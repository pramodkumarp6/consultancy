import 'package:flutter/material.dart';

import '../../res/components/inputText.dart';
import '../../res/components/roundButton.dart';
import '../../utils/routes/routes_names.dart';
import '../../utils/toasty.dart';

class OtpSendVerify extends StatefulWidget {
  const OtpSendVerify({Key? key}) : super(key: key);

  @override
  State<OtpSendVerify> createState() => _OtpSendVerifyState();
}

class _OtpSendVerifyState extends State<OtpSendVerify> {
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
          title: const Text('OtpSend'),
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
                  'OtpSend',
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
                            keyBoardType: TextInputType.number,
                            hint: 'Otp',
                            obscureText: false,
                            onValidator: (value) {
                              return value.isEmpty
                                  ? 'Enter OTP Required'
                                  : null;
                            }),
                      ],
                    ),
                  ),
                ),

                // ignore: prefer_const_constructors

                SizedBox(height: hight * .5),
                RoundButton(
                  title: 'Verify',
                  loading: false,
                  onPress: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.pushNamed(context, RoutesName.passupdate);

                      // login();
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
    );
  }
}
