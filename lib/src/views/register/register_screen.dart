import 'package:consultancy/src/viewmodel/authViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/components/inputText.dart';
import '../../res/components/roundButton.dart';
import '../../utils/routes/routes_names.dart';
import '../../utils/toasty.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  final nameController = TextEditingController();
  final nameFocusNode = FocusNode();

  final mobileController = TextEditingController();
  final mobileFocusNode = FocusNode();

  final addressController = TextEditingController();
  final addressFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
  }

  void register() {
    // loading = true
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    final hight = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 0,
          title: const Text('Register'),
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
                  'Register',
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
                            focusNode: nameFocusNode,
                            myController: nameController,
                            onFieldSubmittedValue: (value) {},
                            enable: true,
                            keyBoardType: TextInputType.name,
                            hint: 'Name',
                            obscureText: false,
                            onValidator: (value) {
                              return value.isEmpty
                                  ? 'Enter Name Required'
                                  : null;
                            }),
                        InputTextField(
                            focusNode: mobileFocusNode,
                            myController: mobileController,
                            onFieldSubmittedValue: (value) {},
                            enable: true,
                            keyBoardType: TextInputType.phone,
                            hint: 'Mobile',
                            obscureText: false,
                            onValidator: (value) {
                              return value.isEmpty
                                  ? 'Enter Mobile Required'
                                  : null;
                            }),
                        InputTextField(
                            focusNode: addressFocusNode,
                            myController: addressController,
                            onFieldSubmittedValue: (value) {},
                            enable: true,
                            keyBoardType: TextInputType.name,
                            hint: 'Address',
                            obscureText: false,
                            onValidator: (value) {
                              return value.isEmpty
                                  ? 'Enter Address Required'
                                  : null;
                            }),
                      ],
                    ),
                  ),
                ),

                // ignore: prefer_const_constructors

                SizedBox(height: hight * .01),
                RoundButton(
                  title: 'Register',
                  loading: false,
                  onPress: () {
                    if (formkey.currentState!.validate()) {
                      Map data = {
                        'email': emailController.text.toString(),
                        'password': passwordController.text.toString(),
                        'name': nameController.text.toString(),
                        'address': addressController.text.toString()
                      };
                      authViewModel.sigup(data, context);
                    }

                    Toasty.toastMessage('Email & Password InvaLid');
                  },
                ),
                SizedBox(height: hight * .03),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: 'Do Already have an Account?',
                      children: [
                        TextSpan(
                            text: "SignIn",
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
