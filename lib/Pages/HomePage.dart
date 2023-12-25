import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> featuredProductImages = [
    'lib/images/featured3rd.png',
    'lib/images/featured2nd.png',
    'lib/images/featured.png',
    'lib/images/featured4th.png',
    'lib/images/featured5th.png',
    'lib/images/featured6th.png'
  ];

  List<String> newArrivalImages = [
    'lib/images/featured3rd.png',
    'lib/images/featured2nd.png',
    'lib/images/featured.png',
    'lib/images/featured4th.png',
    'lib/images/featured5th.png',
    'lib/images/featured6th.png'
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChicPalette',
        style: TextStyle(color: Colors.red[100], fontSize: 30,
            fontWeight: FontWeight.w600),),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
          child: Image.asset('lib/images/logo.png'),
          height: 32,
          width: 32,
        ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_checkout, color: Colors.red[100]),
            onPressed: () {
             Navigator.push(context, MaterialPageRoute
               (builder: (context) => ShoppingCartPage(),),
             );
    },
    )
    ],
    ),
    body: _buildBody(),
    bottomNavigationBar: BottomNavigationBar(
    currentIndex: _currentIndex,
    onTap: _onTabTapped,
    items: [
    BottomNavigationBarItem(
    icon: Icon(Icons.home, color: Colors.red[100]),
    label: 'Home',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.category, color: Colors.red[100]),
    label: 'Categories',
    ),
    /*BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart, color: Colors.red[100]),
    label: 'Cart',
    ),*/
    BottomNavigationBarItem(
    icon: Icon(Icons.person, color: Colors.red[100]),
    label: 'Profile',
    ),
    ],
    )
    ,
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              Container(
                height: 150,
                child: CarouselSlider.builder(
                  itemCount: featuredProductImages.length,
                  itemBuilder: (context, index, realIndex) {
                    return Image.asset(
                      featuredProductImages[index],
                      height: 150,
                      fit: BoxFit.cover,
                    );
                  },
                  options: CarouselOptions(
                    height: 150,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                ),
              ),
              SizedBox(height: 16),
              buildProductSection(' Suggested for you  ',
                featuredProductImages,
                TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w100,
                ),
              ),
              SizedBox(height: 16),
              buildProductSection(' New Arrivals your way  ',
                  newArrivalImages,
                  TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w100,
                  )),
          ]
          )
          );

      case 1:
        return CategoryPage();
      /*case 2:
        return CartPage();*/
      case 2:
        return ProfilePage();
      default:
        return Container();
    }
  }

  Widget buildProductSection(String title, List<String> imagePaths,
      TextStyle textStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.red[100],
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 190,
          child: CarouselSlider.builder(
            itemCount: imagePaths.length,
            itemBuilder: (context, index, realIndex) {
              return ProductCard(imagePath: imagePaths[index]);
            },
            options: CarouselOptions(
              height: 180,
              viewportFraction: 0.8,
              enlargeCenterPage: false,
              autoPlay: false,
            ),
          ),
        ),
      ],
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Shopping Cart'),
      ),
      body: Center(
        child: Text('Your shopping cart content goes here'),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imagePath;

  const ProductCard({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 120,
            width: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Product Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Offer! Offer! Offer!!!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Categories Page'),
    );
  }
}

/*class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cart Page'),
    );
  }
}*/

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Page'),
    );
  }
}
