import 'package:flutter/material.dart';
import 'Foundation.dart'; // Import the Foundation.dart file

class MakeupCategoryPage extends StatefulWidget {
  @override
  _MakeupCategoryPageState createState() => _MakeupCategoryPageState();
}

class _MakeupCategoryPageState extends State<MakeupCategoryPage> {
  List<String> categories = ['Lipstick', 'Eyeshadow', 'Foundation', 'Mascara', 'New Launches'];
  List<Map<String, dynamic>> products = [
    {'name': 'Red Lipstick', 'category': 'Lipstick'},
    {'name': 'Eyeshadow Palette', 'category': 'Eyeshadow'},
    {'name': 'Foundation', 'category': 'Foundation'},
    {'name': 'Volumizing Mascara', 'category': 'Mascara'},
    {'name': 'New Launches', 'category': 'New Launches'},
    // Add more products here
  ];

  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChicPalette'),
        backgroundColor: Colors.red[100], // Set app bar background color
      ),
      body: Column(
        children: [
          _buildCategoryFilter(),
          Expanded(
            child: _buildProductList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.red[100], // Set background color for the filter bar
      child: Row(
        children: [
          Text(
            'Filter by Category:',
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          SizedBox(width: 10),
          DropdownButton<String>(
            value: selectedCategory,
            onChanged: (String? newValue) {
              setState(() {
                selectedCategory = newValue!;
              });
            },
            items: ['All', ...categories].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 16.0),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    List<Map<String, dynamic>> filteredProducts = (selectedCategory == 'All')
        ? products
        : products.where((product) => product['category'] == selectedCategory).toList();

    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          elevation: 4.0,
          color: Colors.red[100],
          child: ListTile(
            title: Text(
              filteredProducts[index]['name'],
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16.0),
            ),
            // Add more product details (e.g., image, price, etc.) here
            onTap: () {
              // Navigate to product details page
              _navigateToProductDetails(filteredProducts[index]);
            },
          ),
        );
      },
    );
  }

  void _navigateToProductDetails(Map<String, dynamic> product) {
    // Implement navigation logic to product details page
    // You can use Navigator.push() to navigate to a new page
    // and pass the selected product details as arguments.
    // Example:
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ProductDetailsPage(product: product),
    //   ),
    // );

    // Add logic to check if the tapped product belongs to the "Foundation" category
    if (product['category'] == 'Foundation') {
      // Navigate to the Foundation.dart screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Foundation(), // Import Foundation.dart
        ),
      );
    } else {
      // Handle navigation to other product details pages if needed
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: MakeupCategoryPage(),
    theme: ThemeData(
      primarySwatch: Colors.blueGrey, // Set the primary color theme
    ),
  ));
}
