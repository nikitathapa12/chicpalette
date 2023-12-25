import 'package:chicpalette/Pages/Lipstick.dart';
import 'package:flutter/material.dart';
import 'Blush.dart';
import 'Eyeshadow.dart';
import 'Foundation.dart';
import 'HomePage.dart';
import 'Lipstick.dart';
import 'Concealer.dart';
import 'Mascara.dart';

class MakeupCategoryPage extends StatefulWidget {
  @override
  _MakeupCategoryPageState createState() => _MakeupCategoryPageState();
}

class _MakeupCategoryPageState extends State<MakeupCategoryPage> {
  List<String> categories = [
    'Concealer',
    'Eyeshadow',
    'Foundation',
    'Lipstick',
    'Blush',
    'Mascara',
  ];
  List<Map<String, dynamic>> products = [
    {'name': 'Concealer', 'category': 'Concealer'},
    {'name': 'Eyeshadow Palette', 'category': 'Eyeshadow'},
    {'name': 'Foundation', 'category': 'Foundation'},
    {'name': 'Lipstick', 'category': 'Lipstick'},
    {'name': 'Blush', 'category': 'Blush'},
    {'name': 'Mascara', 'category': 'Mascara'},


  ];

  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('ChicPalette'),
            backgroundColor: Colors.red[100],
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Image.asset('lib/images/logo.png'),
                height: 50,
                width: 50,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart_checkout, color: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute
                    (builder: (context) => ShoppingCartPage(),),
                  );
                },
              ),
            ]
        ),
      body: Column(
        children: [
          _buildCategoryFilter(),
          Expanded(
            child: _buildProductList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set the initial index to the home page
        selectedItemColor: Colors.red[100],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            // Navigate to the home page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            // Navigate to the profile page
            // Replace 'ProfilePage()' with your actual profile page class
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          } else if (index == 2) {
            // Do nothing or handle the category page differently
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.red[100]),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.red[100]),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, color: Colors.red[100]),
            label: 'Category',
          ),
        ],
      ),
    );
    /*body: Column(
        children: [
          _buildCategoryFilter(),
          Expanded(
            child: _buildProductList(),
          ),
        ],
      ),
    );*/
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
            items: ['All', ...categories].map<DropdownMenuItem<String>>((
                String value) {
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
        : products.where((product) => product['category'] == selectedCategory)
        .toList();

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
              style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16.0),
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
    if (product['category'] == 'Foundation') {
      // Navigate to the Foundation.dart screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Foundation(),
        ),
      );
    } else {

    }

    if (product['category'] == 'Lipstick') {
      // Navigate to the Lipstick.dart screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Lipstick(),
        ),
      );
    } else {

    }

    if (product['category'] == 'Concealer') {
      // Navigate to the Concealer.dart screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Concealer(),
        ),
      );
    } else {

    }

    if (product['category'] == 'Eyeshadow') {
      // Navigate to the Eyeshadow.dart screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Eyeshadow(),
        ),
      );
    } else {

    }

    if (product['category'] == 'Blush') {
      // Navigate to the Blush.dart screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Blush(),
        ),
      );
    } else {

    }

    if (product['category'] == 'Mascara') {
      // Navigate to the Mascara.dart screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Mascara(),
        ),
      );
    } else {

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
