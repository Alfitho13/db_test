import 'package:flutter/material.dart';

void main() {
  runApp(const CartridgeKingsApp());
}

class CartridgeKingsApp extends StatelessWidget {
  const CartridgeKingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartridge Kings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const Icon(Icons.local_printshop, color: Colors.amber, size: 28),
            const SizedBox(width: 8),
            const Text(
              'CARTRIDGE KINGS',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.orange),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navigation Bar
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _navItem('HOME'),
                  _navItem('INK CARTRIDGES'),
                  _navItem('TONER CARTRIDGES'),
                  _navItem('CONTACT US'),
                  _navItem('LOGIN / REGISTER'),
                ],
              ),
            ),
            // Hero Section
            Container(
              height: 250,
              padding: const EdgeInsets.all(16),
              color: Colors.blue[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'FIND THE RIGHT CARTRIDGES FOR YOUR PRINTER',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _searchForm(),
                ],
              ),
            ),
            // Featured Products Section
            const SizedBox(height: 16),
            const Text(
              'FEATURED PRODUCTS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _featuredProducts(),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String title) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _searchForm() {
    return Card(
      elevation: 2,
      child: Row(
        children: [
          Expanded(
            child: _dropdownField('1. Printer Brand'),
          ),
          Expanded(
            child: _dropdownField('2. Printer Series'),
          ),
          Expanded(
            child: _dropdownField('3. Printer Model'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            onPressed: () {},
            child: const Text('FIND CARTRIDGES'),
          ),
        ],
      ),
    );
  }

  Widget _dropdownField(String hint) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        items: const [],
        onChanged: (value) {},
      ),
    );
  }

  Widget _featuredProducts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _productCard(
              'HP 62 Black Ink Cartridge', '\$9.49', 'images/ink1.png'),
          _productCard('Canon MF-3110 Toner', '\$36.45', 'images/toner.png'),
          _productCard(
              'HP 62 Color Ink Cartridge', '\$5.99', 'images/ink2.png'),
        ],
      ),
    );
  }

  Widget _productCard(String title, String price, String imagePath) {
    return Card(
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(price, style: const TextStyle(color: Colors.green)),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {},
              child: const Text('ADD TO CART'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
