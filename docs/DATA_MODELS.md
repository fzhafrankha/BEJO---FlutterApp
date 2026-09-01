# Data Models — Frontend Flutter

Model Dart (`freezed` + `json_serializable`) yang dipakai untuk parsing response API. Field diturunkan dari `../backend/docs/DATABASE_SCHEMA.md`, **hanya kolom yang relevan untuk client** (mis. `password_hash`, `token_hash` tidak pernah dikirim ke client — dihilangkan di sini). Nama field JSON mengikuti konvensi backend (`snake_case` di JSON, di-map ke `camelCase` di Dart via `@JsonKey`).

Konvensi umum:
- Semua model `@freezed` + `fromJson`/`toJson` (`json_serializable`).
- **Freezed 4.x** (versi terinstall) mewajibkan base class dideklarasikan `abstract class Foo with _$Foo` — bukan `class Foo with _$Foo` seperti contoh kode di dokumen versi lama. Semua cuplikan `dart` di bawah ini ditulis tanpa `abstract` untuk keringkasan; **tambahkan `abstract`** saat implementasi nyata, kalau tidak `flutter analyze` akan error `non_abstract_class_inherits_abstract_member`.
- Timestamp dari backend berformat ISO 8601 string → di-parse ke `DateTime` (nullable jika kolom sumbernya nullable).
- Model untuk **request body** dipisah dari model **response** kalau bentuknya beda (mis. `LoginRequest` vs `User`), diletakkan di file yang sama dengan suffix `Request`.

## User (`features/profile`, `features/auth`)

Sumber: `GET/PATCH /profile/me` (`backend/internal/profile/service.go: Response`) — **bukan** dump mentah tabel `users`. Bentuk response terkonfirmasi dari implementasi aktual: tidak ada `is_verified`/`created_at`/`avatar_path` (field itu cuma asumsi versi dokumen sebelumnya, tidak sesuai backend nyata).

```dart
@freezed
class User with _$User {
  const factory User({
    required int id,
    required String email,
    required String username,
    @JsonKey(name: 'avatar_url') required String avatarUrl, // selalu string (bisa "" kalau belum upload), bukan nullable
    @JsonKey(name: 'currency_balance') required int currencyBalance,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
```

`role` **tidak** dimodelkan di client — frontend tidak punya UI admin (lihat `docs/PRD.md` §2.10), tidak perlu tahu role user login.

Model auth terpisah dari `User` karena bentuk response beda-beda per endpoint (`backend/internal/auth/model.go`):
- `POST /auth/register` → `{id, email, username, is_verified}` (tidak ada avatar/currency) — dimodelkan sebagai `RegisterResult`, bukan `User`.
- `POST /auth/login`, `POST /auth/refresh` → `TokenPair {access_token, refresh_token, token_type, expires_in}` — **tidak** menyertakan data user sama sekali. Client wajib panggil `GET /profile/me` terpisah setelah login untuk dapat `User` lengkap.

## Tamagotchi (`features/tamagotchi`)

Sumber: tabel `tamagotchis`. Bentuk response `GET/POST /tamagotchi/me*` **sudah terkonfirmasi** dari implementasi aktual (`backend/internal/tamagotchi/service.go`) — tidak ada `id` di response (backend hanya expose `happiness`/`growth_stage`/`last_fed_at`/`equipped_accessories`).

```dart
enum AccessorySlot { kepala, sepatu, lencana }

@freezed
class EquippedAccessory with _$EquippedAccessory {
  const factory EquippedAccessory({
    required int id,
    required String name,
    required AccessorySlot slot, // dari field "slot" response — selalu terisi utk item equipped
  }) = _EquippedAccessory;

  factory EquippedAccessory.fromJson(Map<String, dynamic> json) => _$EquippedAccessoryFromJson(json);
}

@freezed
class Tamagotchi with _$Tamagotchi {
  const factory Tamagotchi({
    required int happiness,       // 0-100
    required int growthStage,
    DateTime? lastFedAt,
    required List<EquippedAccessory> equippedAccessories,
  }) = _Tamagotchi;

  factory Tamagotchi.fromJson(Map<String, dynamic> json) => _$TamagotchiFromJson(json);
}
```

`POST /tamagotchi/me/equip` hanya meng-unequip aksesoris lain di **slot yang sama** — 3 slot bisa terpasang bersamaan (lihat `docs/SCREENS.md` §4 Personalisasi). `POST /tamagotchi/me/feed-item` (body `{accessoryId}`) mengonsumsi 1 unit makanan dari inventory untuk menambah happiness sebesar `happinessValue` item tsb — beda dari `POST /tamagotchi/me/feed` yang gratis +10 tetap.

## Accessory (`features/shop`)

Sumber: tabel `accessories`. `category` membedakan aksesoris kosmetik (bisa di-equip ke `slot`) dari makanan (dikonsumsi via `feed-item`, `slot` selalu null).

```dart
enum AccessoryCategory { accessory, food }

@freezed
class Accessory with _$Accessory {
  const factory Accessory({
    required int id,
    required String name,
    required AccessoryCategory category,
    AccessorySlot? slot,           // terisi hanya jika category == accessory
    required String imageUrl,      // field response: image_url (URL absolut, bukan image_path)
    required int price,
    int? happinessValue,           // terisi hanya jika category == food
  }) = _Accessory;

  factory Accessory.fromJson(Map<String, dynamic> json) => _$AccessoryFromJson(json);
}
```

Tab Shop "Makanan" vs "Aksesori" difilter dari field `category` ini (bukan menebak dari nama item).

## UserAccessory (inventory, `GET /shop/my-accessories`)

Sumber: tabel `user_accessories` (join `accessories`). Response backend adalah objek flat (bukan nested `accessory`) — field aksesoris & kepemilikan digabung dalam satu level.

```dart
@freezed
class UserAccessory with _$UserAccessory {
  const factory UserAccessory({
    required int id,               // accessory_id
    required String name,
    required AccessoryCategory category,
    AccessorySlot? slot,
    required String imageUrl,
    int? happinessValue,
    required bool isEquipped,      // selalu false utk category == food
    required int quantity,         // relevan utk food (bisa >1); accessory selalu 1
  }) = _UserAccessory;

  factory UserAccessory.fromJson(Map<String, dynamic> json) => _$UserAccessoryFromJson(json);
}
```

> Catatan: dokumen versi sebelumnya mengasumsikan `acquiredAt` ada di response dan `accessory` nested — kedua asumsi itu **tidak sesuai implementasi aktual**, sudah diperbaiki di atas (2026-08-31, saat implementasi frontend).

## QuizQuestion (`features/quiz_happiness`, `features/chapters`)

Sumber: tabel `quiz_questions`. `correct_option_index` **tidak** pernah dikirim backend ke endpoint pengambilan soal (`GET /quiz/happiness`, `GET /chapters/:id/quiz`) — jawaban benar hanya diketahui lewat response submit. Jangan modelkan field itu di sini untuk hindari asumsi salah.

```dart
@freezed
class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required int id,
    required String questionText,
    required List<String> options,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) => _$QuizQuestionFromJson(json);
}

// Response POST /quiz/happiness/submit — bentuk terkonfirmasi dari implementasi aktual.
@freezed
class HappinessQuizResult with _$HappinessQuizResult {
  const factory HappinessQuizResult({
    required bool isCorrect,
    required int happiness, // nilai tamagotchi SETELAH update (tidak berubah kalau salah)
  }) = _HappinessQuizResult;

  factory HappinessQuizResult.fromJson(Map<String, dynamic> json) => _$HappinessQuizResultFromJson(json);
}

// Response POST /chapters/:id/quiz/submit — TIDAK menyertakan reward_currency/chapter
// berikutnya; client ambil nilai itu dari GET /chapters setelah submit sukses (lihat ChapterRepository).
@freezed
class ChapterQuizResult with _$ChapterQuizResult {
  const factory ChapterQuizResult({
    required bool isCorrect,
    required bool chapterDone,  // true kalau submit ini melengkapi semua soal aktif chapter
    required bool rewardGiven,  // true hanya pada submit yang men-trigger klaim reward pertama kali
  }) = _ChapterQuizResult;

  factory ChapterQuizResult.fromJson(Map<String, dynamic> json) => _$ChapterQuizResultFromJson(json);
}
```

## Chapter (`features/chapters`)

Sumber: tabel `chapters` + `chapter_progress` (di-join oleh backend untuk `GET /chapters`).

```dart
@freezed
class Chapter with _$Chapter {
  const factory Chapter({
    required int id,
    required int orderIndex,
    required String title,
    required int rewardCurrency,
    required bool isUnlocked,
    required bool isCompleted,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}
```

`id` dipakai untuk mencocokkan asset lokal `assets/chapters/chapter_<id>.json` (lihat §Local Chapter Content di bawah dan `docs/ARCHITECTURE.md` §5).

## WasteScanResult (`features/waste_scan`)

Request ke `POST /waste-scan/submit` (hasil klasifikasi on-device) dan response-nya.

```dart
@freezed
class WasteScanSubmitRequest with _$WasteScanSubmitRequest {
  const factory WasteScanSubmitRequest({
    required String classifiedLabel, // salah satu: organik, anorganik, B3
    double? confidence,
  }) = _WasteScanSubmitRequest;

  factory WasteScanSubmitRequest.fromJson(Map<String, dynamic> json) => _$WasteScanSubmitRequestFromJson(json);
}

// Response asli hanya 2 field ini — tidak ada id/classified_label/created_at.
@freezed
class WasteScanResult with _$WasteScanResult {
  const factory WasteScanResult({
    required int currencyAwarded,
    required int currencyBalance,
  }) = _WasteScanResult;

  factory WasteScanResult.fromJson(Map<String, dynamic> json) => _$WasteScanResultFromJson(json);
}
```

## GachaResult (`features/shop`)

Sumber: tabel `gacha_history`, response `POST /shop/gacha/pull`. Response asli berisi **list ID** (bisa duplikat, mendukung multi-pull), bukan 1 objek `Accessory` — client mencocokkan tiap ID ke katalog dari `GET /shop/accessories` (mis. lewat provider katalog yang sudah di-cache) untuk dapat nama/gambar.

```dart
@freezed
class GachaResult with _$GachaResult {
  const factory GachaResult({
    required List<int> accessoryIds,
    required int currencySpent,
    required int currencyBalance,
  }) = _GachaResult;

  factory GachaResult.fromJson(Map<String, dynamic> json) => _$GachaResultFromJson(json);
}
```

## PurchaseResult (`features/shop`)

Response `POST /shop/accessories/:id/purchase`:

```dart
@freezed
class PurchaseResult with _$PurchaseResult {
  const factory PurchaseResult({
    required int accessoryId,
    required int currencyBalance,
  }) = _PurchaseResult;

  factory PurchaseResult.fromJson(Map<String, dynamic> json) => _$PurchaseResultFromJson(json);
}
```

## NewsItem (`features/news`)

Sumber: tabel `news_cache`.

```dart
@freezed
class NewsItem with _$NewsItem {
  const factory NewsItem({
    required int id,
    required String title,
    required String url,
    String? imageUrl,
    required String source,
    required DateTime publishedAt,
  }) = _NewsItem;

  factory NewsItem.fromJson(Map<String, dynamic> json) => _$NewsItemFromJson(json);
}
```

## ChatMessage (`features/chatbot`)

Sumber: `backend/internal/chatbot/service.go: MessageResponse` — bentuk response
**tidak** sama dengan tabel `chat_messages` mentah: tidak ada `id` (baik di
`POST .../messages` maupun `GET .../messages`), field waktu bernama `time`
(bukan `created_at`). `POST /chatbot/sessions` cuma mengembalikan
`{"session_id": N}` — tidak perlu model `ChatSession` terpisah, cukup `int`.

```dart
enum ChatRole { user, assistant }

@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required ChatRole role,
    required String content,
    required DateTime time,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);
}
```

## Auth Request/Response Models

```dart
@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String email,
    required String password,
    required String username,
  }) = _RegisterRequest;
  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);
}

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;
  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
}

// Response POST /auth/login, POST /auth/refresh — TIDAK berisi data user.
@freezed
class AuthTokens with _$AuthTokens {
  const factory AuthTokens({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'token_type') required String tokenType,
    @JsonKey(name: 'expires_in') required int expiresIn,
  }) = _AuthTokens;
  factory AuthTokens.fromJson(Map<String, dynamic> json) => _$AuthTokensFromJson(json);
}

// Response POST /auth/register — bentuk beda dari User (tidak ada avatar/currency).
@freezed
class RegisterResult with _$RegisterResult {
  const factory RegisterResult({
    required int id,
    required String email,
    required String username,
    @JsonKey(name: 'is_verified') required bool isVerified,
  }) = _RegisterResult;
  factory RegisterResult.fromJson(Map<String, dynamic> json) => _$RegisterResultFromJson(json);
}
```

## Error Model

Dipakai internal oleh `ApiClient` interceptor (`docs/ARCHITECTURE.md` §3.1) untuk membungkus response `success: false`.

```dart
class ApiException implements Exception {
  final String code;    // salah satu dari ../backend/docs/API_CONTRACT.md §Error Codes
  final String message;

  ApiException(this.code, this.message);
}
```

Tidak pakai `freezed` untuk ini karena dilempar sebagai `Exception`, bukan dikonsumsi sebagai state data biasa.

## Local Chapter Content (`assets/chapters/chapter_<id>.json`)

Bukan dari API — dibundle di app (`docs/PRD.md` §2.4, `docs/ARCHITECTURE.md` §5). Skema JSON:

```json
{
  "id": 1,
  "title": "Mengenal Sampah Organik",
  "sections": [
    { "heading": "Apa itu sampah organik?", "body": "Teks materi (Markdown-lite: bold/italic/list didukung)." },
    { "heading": "Contoh sehari-hari", "body": "..." }
  ],
  "imageAssets": ["assets/chapters/images/chapter_1_hero.png"]
}
```

```dart
@freezed
class ChapterContent with _$ChapterContent {
  const factory ChapterContent({
    required int id,
    required String title,
    required List<ChapterSection> sections,
    @Default([]) List<String> imageAssets,
  }) = _ChapterContent;

  factory ChapterContent.fromJson(Map<String, dynamic> json) => _$ChapterContentFromJson(json);
}

@freezed
class ChapterSection with _$ChapterSection {
  const factory ChapterSection({
    required String heading,
    required String body,
  }) = _ChapterSection;

  factory ChapterSection.fromJson(Map<String, dynamic> json) => _$ChapterSectionFromJson(json);
}
```

`id` di file ini **wajib** sama dengan `id` chapter dari backend (`GET /chapters`) — lihat aturan pencocokan di `docs/ARCHITECTURE.md` §5.
