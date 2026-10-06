import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<_NewsItem> _newsItems = [
    _NewsItem(
      title: 'Қалада жаңа жол жөндеу жұмыстары басталды',
      date: 'Бүгін, 10:30',
      imageUrl:
          'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=800&q=80',
    ),
    _NewsItem(
      title: 'Qandyagash командасы жеңіске жетті',
      date: 'Бүгін, 09:15',
      imageUrl:
          'https://images.unsplash.com/photo-1547347298-4074fc3086f0?auto=format&fit=crop&w=800&q=80',
    ),
    _NewsItem(
      title: 'Жаңа мәдениет үйі ашылды',
      date: 'Кеше, 18:45',
      imageUrl:
          'https://images.unsplash.com/photo-1511818966892-d7d671e672a2?auto=format&fit=crop&w=800&q=80',
    ),
  ];

  final List<_PlaceItem> _places = [
    _PlaceItem(
      name: 'Arman Cafe',
      subtitle: 'Кафе',
      distance: '500 м',
      imageUrl:
          'https://images.unsplash.com/photo-1552566626-52f8b828add9?auto=format&fit=crop&w=800&q=80',
      color: const Color(0xFF65C6A9),
    ),
    _PlaceItem(
      name: 'Small дүкені',
      subtitle: 'Дүкен',
      distance: '300 м',
      imageUrl:
          'https://images.unsplash.com/photo-1524758631624-e2822e304c36?auto=format&fit=crop&w=800&q=80',
      color: const Color(0xFF2CB0D4),
    ),
    _PlaceItem(
      name: 'Дәріхана №1',
      subtitle: 'Дәріхана',
      distance: '450 м',
      imageUrl:
          'https://images.unsplash.com/photo-1584515933487-779824d29309?auto=format&fit=crop&w=800&q=80',
      color: const Color(0xFF87D6B1),
    ),
    _PlaceItem(
      name: 'Dana',
      subtitle: 'Шаштаңдық',
      distance: '480 м',
      imageUrl:
          'https://images.unsplash.com/photo-1521590832167-7e3f5d3fa38c?auto=format&fit=crop&w=800&q=80',
      color: const Color(0xFF9F7AEA),
    ),
  ];

  final List<_BottomNavItem> _bottomNav = [
    _BottomNavItem(label: 'Басты бет', icon: Icons.home_rounded),
    _BottomNavItem(label: 'Жаңалықтар', icon: Icons.newspaper_rounded),
    _BottomNavItem(label: 'Орындар', icon: Icons.map_rounded),
    _BottomNavItem(label: 'Хабарландыру', icon: Icons.notifications_rounded),
    _BottomNavItem(label: 'Профиль', icon: Icons.person_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7EDF1),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 430,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF0F1),
              borderRadius: BorderRadius.circular(34),
            ),
            child: Column(
              children: [
                if (_selectedIndex == 0) ...[
                  _buildHeader(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeroCard(),
                          const SizedBox(height: 18),
                          _buildWeatherCard(),
                          const SizedBox(height: 18),
                          _buildSectionHeader(
                            title: 'Соңғы жаңалықтар',
                            actionText: 'Барлығын көру',
                          ),
                          const SizedBox(height: 10),
                          ..._newsItems.map(_buildNewsRow),
                          const SizedBox(height: 18),
                          _buildSectionHeader(
                            title: 'Танымал орындар',
                            actionText: 'Барлығын көру',
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 14,
                                crossAxisSpacing: 14,
                                childAspectRatio: 0.82,
                              ),
                              itemCount: _places.length,
                              itemBuilder: (context, index) {
                                final place = _places[index];
                                return _PlaceCard(place: place);
                              },
                            ),
                          ),
                          const SizedBox(height: 18),
                        ],
                      ),
                    ),
                  ),
                ] else if (_selectedIndex == 1) ...[
                  _buildNewsTab(),
                ] else if (_selectedIndex == 2) ...[
                  _buildMapTab(),
                ] else if (_selectedIndex == 3) ...[
                  _buildNotificationTab(),
                ] else ...[
                  _buildProfileTab(),
                ],
                _buildBottomNav(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 8),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.menu, color: Color(0xFF1C2A38), size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Text(
                'QANDYAGASH LIFE',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  letterSpacing: 0.5,
                  color: Color(0xFF1D7EEA),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.notifications_none, color: Color(0xFF1C2A38), size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 222,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
          image: const DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=1200&q=80',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.55),
                Colors.transparent,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'QANDYAGASH LIFE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.14),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      const Icon(Icons.notifications_none, color: Colors.white, size: 22),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Qandyagash',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Жастар қаласы, болашақтың қаласы!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: index == 0 ? Colors.white : Colors.white.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            colors: [Color(0xFF1A7DE0), Color(0xFF1EB7CC)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF2A8BDD).withOpacity(0.22),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.wb_sunny_rounded, color: Colors.white, size: 42),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '+24°',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Ашық, желсіз',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.water_drop_outlined, color: Colors.white, size: 18),
                    SizedBox(width: 6),
                    Text('32%', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.air_rounded, color: Colors.white, size: 18),
                    SizedBox(width: 6),
                    Text('8 км/с', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Кандыагаш',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Дүйсенбі, 11 мамыр',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({required String title, required String actionText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: Color(0xFF1F2937),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              actionText,
              style: const TextStyle(
                color: Color(0xFF2781D7),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsRow(_NewsItem item) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                bottomLeft: Radius.circular(18),
              ),
              child: Image.network(
                item.imageUrl,
                width: 110,
                height: 88,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.schedule, size: 15, color: Color(0xFF6B7280)),
                        const SizedBox(width: 6),
                        Text(
                          item.date,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 14),
              child: Icon(Icons.chevron_right, color: Color(0xFF2B3746)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
      decoration: const BoxDecoration(
        color: Color(0xFFF5F7F8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_bottomNav.length, (index) {
          final item = _bottomNav[index];
          final bool isSelected = index == _selectedIndex;

          return GestureDetector(
            onTap: () => setState(() => _selectedIndex = index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.icon,
                  size: 28,
                  color: isSelected ? const Color(0xFF1D7EEA) : const Color(0xFF4B5563),
                ),
                const SizedBox(height: 6),
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected ? const Color(0xFF1D7EEA) : const Color(0xFF4B5563),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildNewsTab() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildTabHeader('Жаңалықтар'),
            const SizedBox(height: 16),
            _buildNewsCard(
              'Қаладағы жаңа жобаларға инвестициялар өсуде',
              '14:20',
              'https://images.unsplash.com/photo-1494526585095-c41746248156?auto=format&fit=crop&w=800&q=80',
            ),
            const SizedBox(height: 12),
            _buildNewsCard(
              'Жаңа жылдамдықпен жұмыс істейтін такси сервис іске қосылды',
              '09:40',
              'https://images.unsplash.com/photo-1517849845537-4d257902454a?auto=format&fit=crop&w=800&q=80',
            ),
            const SizedBox(height: 12),
            _buildNewsCard(
              'Қала тұрғындарына арналған тегін білім семинары',
              'Қ yesterday',
              'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=800&q=80',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapTab() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTabHeader('Орындар'),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&w=1200&q=80',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.24),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text(
                        'Карта қаласы: Қандыағаш',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationTab() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTabHeader('Хабарландыру'),
            const SizedBox(height: 16),
            _buildNotificationTile('Тақырып: Новая акция', 'Сегодня 13:40', Icons.local_offer_rounded, const Color(0xFF1D7EEA)),
            const SizedBox(height: 12),
            _buildNotificationTile('Такси заказ қабылданды', 'Сегодня 11:20', Icons.local_taxi_rounded, const Color(0xFF21B7A6)),
            const SizedBox(height: 12),
            _buildNotificationTile('Ең жақын дүкенде жеңілдік бар', 'Кеше 18:30', Icons.shopping_bag_rounded, const Color(0xFFF59E0B)),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTab() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTabHeader('Профиль'),
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 52,
              backgroundColor: const Color(0xFF1D7EEA),
              child: const Icon(Icons.person, size: 56, color: Colors.white),
            ),
            const SizedBox(height: 18),
            const Text(
              'Нұрлан Сейіт',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '+7 705 000 00 00',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 20),
            _profileOption('Брондау историясы', Icons.history_rounded),
            const SizedBox(height: 12),
            _profileOption('Төлем әдістері', Icons.credit_card_rounded),
            const SizedBox(height: 12),
            _profileOption('Параметрлер', Icons.settings_rounded),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D7EEA),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Шығу',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: Color(0xFF1F2937),
        ),
      ),
    );
  }

  Widget _buildNewsCard(String title, String time, String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.access_time_filled, size: 14, color: Color(0xFF6B7280)),
                    const SizedBox(width: 6),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationTile(String title, String time, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileOption(String title, IconData icon) {
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
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFF6B7280)),
        ],
      ),
    );
  }
}

class _NewsItem {
  final String title;
  final String date;
  final String imageUrl;

  _NewsItem({required this.title, required this.date, required this.imageUrl});
}

class _PlaceItem {
  final String name;
  final String subtitle;
  final String distance;
  final String imageUrl;
  final Color color;

  _PlaceItem({
    required this.name,
    required this.subtitle,
    required this.distance,
    required this.imageUrl,
    required this.color,
  });
}

class _BottomNavItem {
  final String label;
  final IconData icon;

  _BottomNavItem({required this.label, required this.icon});
}

class _PlaceCard extends StatelessWidget {
  final _PlaceItem place;

  const _PlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            child: Image.network(
              place.imageUrl,
              height: 90,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  place.subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 14, color: place.color),
                    const SizedBox(width: 4),
                    Text(
                      place.distance,
                      style: TextStyle(
                        fontSize: 12,
                        color: place.color,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
