import 'package:consultancy/utils/routes/routes_names.dart';
import 'package:consultancy/utils/toasty.dart';
import 'package:consultancy/viewmodel/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
