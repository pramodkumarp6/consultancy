import 'package:flutter/material.dart';

import '../../res/components/inputText.dart';
import '../../res/components/roundButton.dart';
import '../../utils/routes/routes_names.dart';
import '../../utils/toasty.dart';

class PasswordUpdate extends StatefulWidget {
  const PasswordUpdate({Key? key}) : super(key: key);

  @override
  State<PasswordUpdate> createState() => _PasswordUpdateState();
}

class _PasswordUpdateState extends State<PasswordUpdate> {
  final formkey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  final passwordConfirmController = TextEditingController();
  final passwordConfirmFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 0,
          title: const Text('Password Update'),
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
                  'Update Password',
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
                            focusNode: passwordFocusNode,
                            myController: passwordController,
                            onFieldSubmittedValue: (value) {},
                            enable: true,
                            keyBoardType: TextInputType.visiblePassword,
                            hint: 'Old Password',
                            obscureText: true,
                            onValidator: (value) {
                              return value.isEmpty
                                  ? 'Enter Password Required'
                                  : null;
                            }),
                        InputTextField(
                            focusNode: passwordConfirmFocusNode,
                            myController: passwordConfirmController,
                            onFieldSubmittedValue: (value) {},
                            enable: true,
                            keyBoardType: TextInputType.visiblePassword,
                            hint: 'Confirm Password',
                            obscureText: true,
                            onValidator: (value) {
                              return value.isEmpty
                                  ? 'Enter PasswordConfirm Required'
                                  : null;
                            }),
                      ],
                    ),
                  ),
                ),

                // ignore: prefer_const_constructors

                SizedBox(height: hight * .04),
                RoundButton(
                  title: 'PasswordUpdate',
                  loading: false,
                  onPress: () {
                    if (formkey.currentState!.validate()) {}
                    Navigator.pushNamed(context, RoutesName.complete);

                    Toasty.toastMessage('Email & Password InvaLid');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
