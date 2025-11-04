import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          // Account Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'ACCOUNT',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          _buildSettingsTile(
            icon: Icons.person_outline,
            title: 'Edit Profil',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.lock_outline,
            title: 'Ganti Password',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privasi',
            onTap: () {},
          ),
          const Divider(),
          // Notifications Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'NOTIFICATIONS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          _buildSettingsTile(
            icon: Icons.notifications_outlined,
            title: 'Notifikasi',
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: const Color(0xFF6B4EFF),
            ),
          ),
          _buildSettingsTile(
            icon: Icons.email_outlined,
            title: 'Email Notifications',
            trailing: Switch(
              value: false,
              onChanged: (value) {},
              activeColor: const Color(0xFF6B4EFF),
            ),
          ),
          const Divider(),
          // More Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'MORE',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          _buildSettingsTile(
            icon: Icons.help_outline,
            title: 'Bantuan',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.info_outline,
            title: 'Tentang',
            onTap: () {},
          ),
          _buildSettingsTile(
            icon: Icons.description_outlined,
            title: 'Syarat & Ketentuan',
            onTap: () {},
          ),
          const Divider(),
          // Logout
          _buildSettingsTile(
            icon: Icons.logout,
            title: 'Logout',
            iconColor: Colors.red,
            textColor: Colors.red,
            onTap: () {
              Get.defaultDialog(
                title: 'Logout',
                middleText: 'Apakah Anda yakin ingin keluar?',
                textConfirm: 'Ya',
                textCancel: 'Batal',
                confirmTextColor: Colors.white,
                buttonColor: Colors.red,
                onConfirm: () {
                  Get.back();
                  Get.offAllNamed(Routes.LOGIN);
                },
              );
            },
          ),
          const SizedBox(height: 24),
          // Version
          const Center(
            child: Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    Color? iconColor,
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.black87),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, color: textColor ?? Colors.black87),
      ),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
