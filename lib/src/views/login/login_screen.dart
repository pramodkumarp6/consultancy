import 'package:consultancy/src/res/components/inputButton.dart';
import 'package:consultancy/src/res/components/roundButton.dart';
import 'package:consultancy/src/utils/toasty.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes_names.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    // final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputTextField(
                focusNode: emailFocusNode,
                myController: emailController,
                onFieldSubmittedValue: (value) {},
                enable: true,
                keyBoardType: TextInputType.emailAddress,
                hint: 'Email',
                obscureText: false,
                onValidator: (value) {
                  print(value);
                  return value.isEmpty ? 'enter Email' : null;
                }),
            RoundButton(
              title: 'Login',
              loading: false,
              onPress: () {
                Navigator.pushNamed(context, RoutesName.home);

                Toasty.toastMessage('Login Success');
              },
            )
          ],
        ),
      ),
      // body: Center(
      //   child: InkWell(
      //     onTap: () {

      //       Toasty.toastMessage('Login Success');
      //     },
      //     child: const Text(
      //       'Hello World',
      //       style: TextStyle(color: Colors.red),
      //     ),
      //   ),
      // ),
    );
  }
}
