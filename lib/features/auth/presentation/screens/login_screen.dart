import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Профиль')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 52,
              backgroundColor: Color(0xFF1D7EEA),
              child: Icon(Icons.person, size: 56, color: Colors.white),
            ),
            const SizedBox(height: 18),
            const Text('Нұрлан Сейіт', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF1F2937))),
            const SizedBox(height: 8),
            const Text('+7 705 000 00 00', style: TextStyle(fontSize: 16, color: Color(0xFF6B7280))),
            const SizedBox(height: 28),
            _ProfileOption(title: 'Брондау историясы', icon: Icons.history_rounded),
            const SizedBox(height: 12),
            _ProfileOption(title: 'Төлем әдістері', icon: Icons.credit_card_rounded),
            const SizedBox(height: 12),
            _ProfileOption(title: 'Параметрлер', icon: Icons.settings_rounded),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D7EEA),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text('Шығу', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final String title;
  final IconData icon;

  const _ProfileOption({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF1D7EEA)),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF1F2937)))),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFF6B7280)),
        ],
      ),
    );
  }
}
