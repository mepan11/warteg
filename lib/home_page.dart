import 'package:flutter/material.dart';
import 'tampilan_profile.dart'; // Pastikan ini diimpor dengan benar

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? PreferredSize(
              preferredSize: const Size.fromHeight(150),
              child: _buildAppBarWithLogo(), // AppBar hanya untuk Beranda
            )
          : null, // Tidak ada AppBar di tab selain Beranda
      body: _buildContent(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Konten untuk tab yang dipilih
  Widget _buildContent() {
    if (_selectedIndex == 0) {
      return _buildHomeContent();
    } else if (_selectedIndex == 1) {
      return const Center(
        child: Text('Halaman Pesanan', style: TextStyle(fontSize: 18)),
      );
    } else {
      // Navigasi langsung ke halaman ProfilePage
      return ProfilePage();
    }
  }

  // AppBar dengan logo dan teks "Warteg" untuk Beranda
  Widget _buildAppBarWithLogo() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.green),
          height: 150,
        ),
        Container(
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/warteg.png',
                  height: 60,
                  width: 60,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Warteg',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Konten untuk tab Beranda
  Widget _buildHomeContent() {
    return Column(
      children: [
        Container(
          color: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildInteractiveOption(
                icon: Icons.restaurant,
                label: "Dine In",
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Dine In dipilih')),
                  );
                },
              ),
              _buildInteractiveOption(
                icon: Icons.takeout_dining,
                label: "Take Away",
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Take Away dipilih')),
                  );
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilterChip(
                label: const Text(
                  "Promo",
                  style: TextStyle(color: Colors.white),
                ),
                selected: false,
                onSelected: (bool selected) {
                  print('Promo dipilih: $selected');
                },
                backgroundColor: Colors.green,
                selectedColor: Colors.green.shade700,
              ),
              FilterChip(
                label: const Text(
                  "Best Seller",
                  style: TextStyle(color: Colors.white),
                ),
                selected: false,
                onSelected: (bool selected) {
                  print('Best Seller dipilih: $selected');
                },
                backgroundColor: Colors.green,
                selectedColor: Colors.green.shade700,
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.all(10),
            children: [
              _buildFoodCard('assets/omlet.png', 'Nasi Omlet', 'Rp. 10.000'),
              _buildFoodCard('assets/ayam_goreng.png', 'Ayam Goreng', 'Rp. 9.000'),
              _buildFoodCard('assets/telur_dadar.png', 'Telor Dadar', 'Rp. 5.000'),
              _buildFoodCard('assets/nasi_goreng.png', 'Nasi Goreng', 'Rp. 14.000'),
            ],
          ),
        ),
      ],
    );
  }

  // Widget untuk opsi interaktif
  Widget _buildInteractiveOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  // Widget untuk menampilkan gambar makanan
  Widget _buildFoodCard(String imagePath, String foodName, String price) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Text(foodName, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(price, style: const TextStyle(color: Colors.green)),
      ],
    );
  }
}
