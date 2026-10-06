import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Заказы')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            _OrderCard(title: 'Такси', status: 'Жеткізілуде', total: '1 200 ₸'),
            const SizedBox(height: 12),
            _OrderCard(title: 'Еда', status: 'Дайындауда', total: '2 500 ₸'),
            const SizedBox(height: 12),
            _OrderCard(title: 'Доставка', status: 'Тапсырыс қабылданды', total: '800 ₸'),
          ],
        ),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final String title;
  final String status;
  final String total;

  const _OrderCard({required this.title, required this.status, required this.total});

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
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: const Color(0xFF1D7EEA).withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.receipt_long_rounded, color: Color(0xFF1D7EEA)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF1F2937))),
                const SizedBox(height: 6),
                Text(status, style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
              ],
            ),
          ),
          Text(total, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF1D7EEA))),
        ],
      ),
    );
  }
}
