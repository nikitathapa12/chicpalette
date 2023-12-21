import 'package:chicpalette/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/*void main() {
  runApp(ChicPalette());
}*/

/*class ChicPalette extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Makeup Store',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}*/

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChicPalette'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              //Navigate to shopping cart page
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'lib/images/fentyfoundation.png',
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Featured Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context,index) {
                    return ProductCard();
                  },
                ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'New Arrivals',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ProductCard();
            },
            ),
            ),

          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
        margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
        'lib/images/fentyfoundation.png',
        height: 120,
        width: 200,
        fit: BoxFit.cover,
          ),
          Padding(padding: const EdgeInsets.all(8.0),
          child: Text(
            'Product Name',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Price: \$25.99',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold
            ),
           ),
          ),
        ],
      ),
    );
  }
}