import 'package:chicpalette/Pages/SignUpPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChicPalette());
}

class ChicPalette extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _EmailidController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        //Background Image
        Image.asset(
          'assets/images/3.jpg',
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _EmailidController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _PasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  //Perform login logic here
                  String email = _EmailidController.text;
                  String password = _PasswordController.text;

                  //Add authentication logic or API calls here

                  print('Email: $email');
                  print('Password: $password');
                },
                child: Text('Login'),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
