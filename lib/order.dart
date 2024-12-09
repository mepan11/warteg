import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Pesanan'),
      ),
      body: Center(
        child: Text('Ini halaman Semua Pesanan', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
