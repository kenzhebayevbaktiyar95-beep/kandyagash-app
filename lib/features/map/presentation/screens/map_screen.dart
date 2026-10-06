import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Жаңалықтар')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(
          children: const [
            _NewsCard(
              title: 'Қаладағы жаңа жобаларға инвестициялар өсуде',
              time: '14:20',
            ),
            SizedBox(height: 14),
            _NewsCard(
              title: 'Жаңа жылдамдықпен жұмыс істейтін такси сервис іске қосылды',
              time: '09:40',
            ),
            SizedBox(height: 14),
            _NewsCard(
              title: 'Қала тұрғындарына арналған тегін білім семинары',
              time: 'Кеше 18:30',
            ),
          ],
        ),
      ),
    );
  }
}

class _NewsCard extends StatelessWidget {
  final String title;
  final String time;

  const _NewsCard({required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: const DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1494526585095-c41746248156?auto=format&fit=crop&w=800&q=80'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF1F2937))),
          const SizedBox(height: 8),
          Text(time, style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
        ],
      ),
    );
  }
}
