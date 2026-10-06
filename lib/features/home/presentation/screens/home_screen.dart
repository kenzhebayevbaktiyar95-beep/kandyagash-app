import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kandyagash Life'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Городские сервисы',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  _ServiceCard(title: 'Такси', icon: Icons.local_taxi),
                  _ServiceCard(title: 'Еда', icon: Icons.fastfood),
                  _ServiceCard(title: 'Доставка', icon: Icons.delivery_dining),
                  _ServiceCard(title: 'Оплата', icon: Icons.payment),
                  _ServiceCard(title: 'Новости', icon: Icons.newspaper),
                  _ServiceCard(title: 'Профиль', icon: Icons.person),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const _ServiceCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 36),
              const SizedBox(height: 12),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
