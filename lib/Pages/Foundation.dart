import 'package:flutter/material.dart';
import 'Foundation_detailpage.dart';

class Foundation extends StatefulWidget {
  @override
  FoundationPageState createState() => FoundationPageState();
}

class FoundationPageState extends State<Foundation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              // Add the heading and subheading
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chic Palette',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Foundation Products',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              // Add CarouselSlider
              SizedBox(height: 20),

              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.73,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Color(Foundation_detailpage[index]['color']),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          radius: 55,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          radius: 55,
                                          backgroundColor: Color(Foundation_detailpage[index]['color']).withOpacity(0.5),
                                        ),
                                      ),
                                      Image.asset(
                                        Foundation_detailpage[index]['image'],
                                        height: 160,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(Foundation_detailpage[index]['name'],
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                            Text(
                              r'Rs.' + Foundation_detailpage[index]['price'],
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            // Remove the Add to Cart Button
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          // Your bottom navigation bar code
        ),
      ),
    );
  }
}
