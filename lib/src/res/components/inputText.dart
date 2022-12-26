// ignore: file_names
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController myController;
  final FormFieldSetter onFieldSubmittedValue;
  final FocusNode focusNode;
  final String hint;
  final bool obscureText;
  final TextInputType keyBoardType;
  final bool enable, autoFoucs;
  final FormFieldValidator onValidator;

  const InputTextField({
    Key? key,
    required this.focusNode,
    required this.myController,
    required this.onFieldSubmittedValue,
    required this.keyBoardType,
    required this.hint,
    required this.obscureText,
    required this.onValidator,
    this.autoFoucs = false,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: myController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmittedValue,
        obscureText: obscureText,
        validator: onValidator,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
            hintText: hint,
            // hintStyle: Theme.of(context.textTheme.bo),
            contentPadding: const EdgeInsets.all(10),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purpleAccent),
                borderRadius: BorderRadius.all(Radius.circular(8)))),
      ),
    );
  }
}
