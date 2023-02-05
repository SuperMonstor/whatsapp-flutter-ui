import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Enter your phone number")),
      body: Column(
        children: [
          const Text('Whatsapp will need to verify your phone number'),
          TextButton(
            onPressed: () {},
            child: Text('Pick Country'),
          )
        ],
      ),
    );
  }
}
