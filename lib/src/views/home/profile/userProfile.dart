import 'package:consultancy/src/res/components/inputText.dart';
import 'package:consultancy/src/res/components/roundButton.dart';
import 'package:consultancy/src/utils/toasty.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height * 1;

    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
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
                  'Update Profile',
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
                  title: 'Update',
                  loading: false,
                  onPress: () {
                    if (formkey.currentState!.validate()) {
                      emailController.text = "Pramodkumarp6@gmail.com";
                      Map data = {
                        'email': emailController.text.toString(),
                        'password': passwordController.text.toString(),
                        'name': nameController.text.toString(),
                        'address': addressController.text.toString()
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
