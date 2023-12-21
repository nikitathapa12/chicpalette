
import 'dart:js';

import 'package:flutter/material.dart';

import '../main.dart';

class Displaypage extends StatefulWidget {
  const Displaypage({super.key});

  @override
  State<Displaypage> createState() => _DisplaypageState();
}

class _DisplaypageState extends State<Displaypage> {
  @override
    void initState() {
    super.initState();
    // Add code after super
    }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       height: MediaQuery.of(context).size.height,
       color: Colors.pink[100],
       child: Column(
         children: [
           Image.asset(
             'lib/images/1.1.png',
           ),
           SizedBox(
             height: 10,

           ),
         ],
       ),
     ),
   );
  }
}