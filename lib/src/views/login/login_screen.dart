import 'package:consultancy/src/utils/routes/routes_names.dart';
import 'package:consultancy/src/utils/toasty.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.home);

            Toasty.toastMessage('Login Success');
          },
          child: const Text('Click'),
        ),
      ),
    );
  }
}
