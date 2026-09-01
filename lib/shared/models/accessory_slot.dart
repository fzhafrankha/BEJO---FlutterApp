/// Slot equip tamagotchi — dipakai lintas fitur (tamagotchi, shop).
enum AccessorySlot { kepala, sepatu, lencana }

AccessorySlot accessorySlotFromJson(String value) => AccessorySlot.values.firstWhere(
      (e) => e.name == value,
      orElse: () => throw ArgumentError('Slot tidak dikenal: $value'),
    );

String accessorySlotToJson(AccessorySlot slot) => slot.name;
