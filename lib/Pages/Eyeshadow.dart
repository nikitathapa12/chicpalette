import 'package:flutter/material.dart';
import 'Eyeshadow_details.dart';

class Eyeshadow extends StatefulWidget {
  @override
  EyeshadowPageState createState() => EyeshadowPageState();
}

class EyeshadowPageState extends State<Eyeshadow> {
  //int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChicPalette'),
        backgroundColor: Colors.red[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen (category page)
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Concealer',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Strong foundation, stunning you',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
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
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Color(Eyeshadow_detail[index]['color']),
                                  borderRadius: BorderRadius.circular(18),
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
                                          backgroundColor: Color(Eyeshadow_detail[index]['color']).withOpacity(0.5),
                                        ),
                                      ),
                                      Image.asset(
                                        Eyeshadow_detail[index]['image'],
                                        height: 160,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Eyeshadow_detail[index]['name'],
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    r'Rs.' + Eyeshadow_detail[index]['price'],
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add your logic for the 'Add to Cart' button
                                },
                                child: Text('Add to Cart'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red[100],
                                  onPrimary: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
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
        ),
      ),
    );
  }
}
