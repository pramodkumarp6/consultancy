import 'package:consultancy/src/res/components/inputText.dart';
import 'package:consultancy/src/res/components/roundButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/helper/dimens.dart';
import '../../res/helper/strings.dart';
import '../../utils/routes/routes_names.dart';
import '../../viewmodel/authViewModel.dart';

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

  //loading = true
  // Navigator.pushNamed(context, RoutesName.home);
  //Toasty.snackebar('message', context);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final hight = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 0,
          title: const Text(Strings.appbar),
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              tooltip: "Cancel and Return to List",
              onPressed: () {}),
          centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.horizontal_padding,
              vertical: Dimens.vertical_padding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: hight * .01),

                const Image(image: AssetImage('assets/images/spl.png')),

                const Text(
                  Strings.apptext,
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
                            hint: Strings.email,
                            obscureText: false,
                            onValidator: (value) {
                              return value.isEmpty
                                  ? 'Enter Email Required'
                                  : null;
                            }),
                        InputTextField(
                            focusNode: passwordFocusNode,
                            myController: passwordController,
                            onFieldSubmittedValue: (value) {},
                            enable: true,
                            keyBoardType: TextInputType.visiblePassword,
                            hint: Strings.password,
                            obscureText: true,
                            onValidator: (value) {
                              return value.isEmpty
                                  ? 'Enter Password Required'
                                  : null;
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
                      Strings.forgetuser,
                      style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                          color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: hight * .04),
                RoundButton(
                  title: Strings.loginbutton,
                  loading: authViewModel.loading,
                  onPress: () {
                    if (formkey.currentState!.validate()) {
                      Map data = {
                        'email': emailController.text.toString(),
                        'password': passwordController.text.toString()
                      };
                      authViewModel.loginApi(data, context);
                      Navigator.pushNamed(context, RoutesName.home);
                    }

                    //Toasty.fl("meassage", context);

                    //Toasty.toastMessage('Email & Password InvaLid');
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
                      style: TextStyle(fontSize: 15),
                      children: [
                        TextSpan(
                            text: "SignUP",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'normal',
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ))
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
