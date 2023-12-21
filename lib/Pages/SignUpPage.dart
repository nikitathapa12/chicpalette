import 'package:flutter/material.dart';

void main() {
  runApp(ChicPalette());
}

class ChicPalette extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _EmailIdController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        //Background Image
        Image.asset(
          'assets/images/2.jpg',
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              controller: _EmailIdController,
              decoration: InputDecoration(
                labelText: 'Email Address',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _PasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                //perform sign up logic here
                String email = _EmailIdController.text;
                String password = _PasswordController.text;

                // add your authentication logic or API calls here
                print('Email: $email');
                print('Password: $password');
              },
              child: Text('Sign Up'),
            ),
          ]),
        )
      ]),
    );
  }
}
