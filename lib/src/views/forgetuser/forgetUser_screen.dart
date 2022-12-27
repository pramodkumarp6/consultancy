import 'package:flutter/material.dart';

class ForgetUser extends StatefulWidget {
  const ForgetUser({Key? key}) : super(key: key);

  @override
  State<ForgetUser> createState() => _ForgetUserState();
}

class _ForgetUserState extends State<ForgetUser> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  final emailFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple, title: const Text('ForgetUser')),
    );
  }
}
