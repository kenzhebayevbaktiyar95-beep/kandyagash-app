import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Еда')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Қазіргі ұсыныстар', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF1F2937))),
            const SizedBox(height: 18),
            _FoodCard(title: 'Пицца', price: '2 500 ₸', color: const Color(0xFF1D7EEA)),
            const SizedBox(height: 14),
            _FoodCard(title: 'Бургер', price: '1 800 ₸', color: const Color(0xFF21B7A6)),
            const SizedBox(height: 14),
            _FoodCard(title: 'Суп', price: '1 200 ₸', color: const Color(0xFFF59E0B)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF21B7A6),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text('Заказать', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FoodCard extends StatelessWidget {
  final String title;
  final String price;
  final Color color;

  const _FoodCard({required this.title, required this.price, required this.color});

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
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(Icons.fastfood_rounded, color: color, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF1F2937))),
          ),
          Text(price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF1D7EEA))),
        ],
      ),
    );
  }
}
