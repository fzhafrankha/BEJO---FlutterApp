import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/network/error_messages.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/application/auth_notifier.dart';
import '../data/profile_repository.dart';

const _maxAvatarSizeBytes = 5 * 1024 * 1024;
const _allowedAvatarExt = {'.jpg', '.jpeg', '.png', '.webp'};

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  late final TextEditingController _usernameController;
  File? _pickedAvatar;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final user = ref.read(authNotifierProvider).maybeWhen(authenticated: (u) => u, orElse: () => null);
    _usernameController = TextEditingController(text: user?.username ?? '');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  String? _validateAvatarFile(String path, int sizeBytes) {
    final ext = path.contains('.') ? path.substring(path.lastIndexOf('.')).toLowerCase() : '';
    if (!_allowedAvatarExt.contains(ext)) {
      return 'Format foto harus JPG, PNG, atau WebP';
    }
    if (sizeBytes > _maxAvatarSizeBytes) {
      return 'Ukuran foto maksimal 5MB';
    }
    return null;
  }

  Future<void> _pickAvatar() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 90);
    if (picked == null) return;
    final file = File(picked.path);
    final sizeBytes = await file.length();
    final error = _validateAvatarFile(picked.path, sizeBytes);
    if (error != null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
      return;
    }
    setState(() => _pickedAvatar = file);
  }

  Future<void> _save() async {
    final username = _usernameController.text.trim();
    if (username.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Username minimal 3 karakter')));
      return;
    }

    setState(() => _saving = true);
    try {
      final repo = ref.read(profileRepositoryProvider);
      if (_pickedAvatar != null) {
        await repo.uploadAvatar(_pickedAvatar!.path);
      }
      final currentUsername =
          ref.read(authNotifierProvider).maybeWhen(authenticated: (u) => u.username, orElse: () => null);
      if (username != currentUsername) {
        await repo.updateUsername(username);
      }
      await ref.read(authNotifierProvider.notifier).refreshUser();
      if (!mounted) return;
      Navigator.of(context).pop();
    } on ApiException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessageFor(e))));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authNotifierProvider).maybeWhen(authenticated: (u) => u, orElse: () => null);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Edit Profil'), backgroundColor: AppColors.background),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickAvatar,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 56,
                    backgroundColor: Colors.white,
                    backgroundImage: _pickedAvatar != null
                        ? FileImage(_pickedAvatar!)
                        : (user != null && user.avatarUrl.isNotEmpty
                            ? NetworkImage(resolveMediaUrl(user.avatarUrl))
                            : null) as ImageProvider?,
                    child: (_pickedAvatar == null && (user == null || user.avatarUrl.isEmpty))
                        ? const Icon(Icons.person, size: 48, color: Colors.black26)
                        : null,
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(color: AppColors.buttonGreenBg, shape: BoxShape.circle),
                    child: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            if (user != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(user.email, style: const TextStyle(color: Colors.black54)),
              ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saving ? null : _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonGreenBg,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _saving
                    ? const SizedBox(
                        width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                    : const Text('Simpan', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
