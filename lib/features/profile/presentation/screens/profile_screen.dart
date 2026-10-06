import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Хабарландыру')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(
          children: const [
            _NotificationCard(title: 'Тақырып: Новая акция', time: 'Сегодня 13:40', color: Color(0xFF1D7EEA)),
            SizedBox(height: 12),
            _NotificationCard(title: 'Такси заказ қабылданды', time: 'Сегодня 11:20', color: Color(0xFF21B7A6)),
            SizedBox(height: 12),
            _NotificationCard(title: 'Ең жақын дүкенде жеңілдік бар', time: 'Кеше 18:30', color: Color(0xFFF59E0B)),
          ],
        ),
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final String title;
  final String time;
  final Color color;

  const _NotificationCard({required this.title, required this.time, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(Icons.notifications_rounded, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF1F2937))),
                const SizedBox(height: 6),
                Text(time, style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
