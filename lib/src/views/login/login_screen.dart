import 'package:consultancy/src/res/components/inputText.dart';
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
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final authViewModel = Provider.of<AuthViewModel>(context);
    final hight = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: hight * .01),
                const Text(
                  'Consultancy',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(height: hight * .05),
                Form(
                  key: formkey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: hight * .03),
                    child: Column(
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
                              return value.isEmpty ? 'enter Email' : null;
                            }),
                        InputTextField(
                            focusNode: passwordFocusNode,
                            myController: passwordController,
                            onFieldSubmittedValue: (value) {},
                            enable: true,
                            keyBoardType: TextInputType.visiblePassword,
                            hint: 'Password',
                            obscureText: false,
                            onValidator: (value) {
                              return value.isEmpty ? 'enter Password' : null;
                            }),
                      ],
                    ),
                  ),
                ),

                // ignore: prefer_const_constructors
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.forgetUser);
                  },
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'ForgetUser',
                      style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: hight * .04),
                RoundButton(
                  title: 'Login',
                  loading: false,
                  onPress: () {
                    Navigator.pushNamed(context, RoutesName.home);

                    Toasty.toastMessage('Login Success');
                  },
                ),
                SizedBox(height: hight * .03),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.register);
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: 'Dont have an Account?',
                      children: [
                        TextSpan(
                            text: "SignUP",
                            style: TextStyle(
                                fontFamily: 'normal',
                                decoration: TextDecoration.underline,
                                color: Colors.blue))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
