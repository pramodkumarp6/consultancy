import 'package:flutter/material.dart';

import '../../res/components/inputText.dart';
import '../../res/components/roundButton.dart';
import '../../utils/routes/routes_names.dart';
import '../../utils/toasty.dart';

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
    final hight = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 0,
          title: const Text('ForgetUser'),
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              tooltip: "Cancel and Return to List",
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.login);
              }),
          centerTitle: true),

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
                              return value.isEmpty
                                  ? 'Enter Email Required'
                                  : null;
                            }),
                      ],
                    ),
                  ),
                ),

                // ignore: prefer_const_constructors

                SizedBox(height: hight * .5),
                RoundButton(
                  title: 'Send',
                  loading: false,
                  onPress: () {
                    if (formkey.currentState!.validate()) {
                      //login();

                      Navigator.pushNamed(context, RoutesName.otpSend);
                    }

                    Toasty.toastMessage('Email & Password InvaLid');
                  },
                ),
                SizedBox(height: hight * .03),
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
