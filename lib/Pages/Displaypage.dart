
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
    _navigatetohome();
    // Add code after super
    }

    _navigatetohome()async{
    await Future.delayed(Duration(seconds: 5), (){
      Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(builder: (context)=>MyHomePage(title: '',)));});

    }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       height: MediaQuery.of(context).size.height,
       color: Colors.pink[100],
       child: Column(
         children: [
           Image(
             image:AssetImage("assets/images/1.png"),
           ),
           SizedBox(
             height: 10,

           ),

           Text("hhhhhhh"),
         ],
       ),
     ),
   );
  }
}