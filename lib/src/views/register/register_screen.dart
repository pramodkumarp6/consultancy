import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: (const Text('Register')),
      ),
      body: Center(
        child: InkWell(
          onTap: () {},
          child: const Text('Click'),
        ),
      ),
    );
  }
}
