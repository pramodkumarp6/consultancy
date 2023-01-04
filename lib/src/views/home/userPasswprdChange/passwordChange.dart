import 'package:consultancy/src/res/components/inputText.dart';
import 'package:consultancy/src/res/components/roundButton.dart';
import 'package:consultancy/src/utils/routes/routes_names.dart';
import 'package:consultancy/src/utils/toasty.dart';
import 'package:flutter/material.dart';

class PasswordChange extends StatefulWidget {
  const PasswordChange({Key? key}) : super(key: key);

  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  final formkey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  final passwordnewController = TextEditingController();
  final passwordnewFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            tooltip: "Cancel and Return to List",
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.home);
            }),
        centerTitle: true,
        title: const Text("ChangePassword"),
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
                  'Password Change',
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
                            hint: 'Password',
                            obscureText: true,
                            onValidator: (value) {
                              return value.isEmpty
                                  ? 'Enter Password Required'
                                  : null;
                            }),
                        InputTextField(
                            focusNode: passwordFocusNode,
                            myController: passwordController,
                            onFieldSubmittedValue: (value) {},
                            enable: true,
                            keyBoardType: TextInputType.visiblePassword,
                            hint: 'NewPassport',
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

                SizedBox(height: hight * .01),
                RoundButton(
                  title: 'Update',
                  loading: false,
                  onPress: () {
                    if (formkey.currentState!.validate()) {
                      Map data = {
                        'password': passwordController.text.toString(),
                      };
                      // authViewModel.sigup(data, context);
                    }

                    Toasty.toastMessage('Email & Password InvaLid');
                  },
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
