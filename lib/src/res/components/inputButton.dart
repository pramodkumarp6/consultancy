// ignore: file_names
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final FocusNode focusNode;
  final String hint;
  final bool obscureText;
  final TextInputType keyBoardType;
  final bool enable, autoFoucs;
  final FormFieldValidator fieldValidator;

  const InputTextField({
    Key? key,
    required this.focusNode,
    required this.keyBoardType,
    required this.hint,
    required this.obscureText,
    required this.fieldValidator,
    this.autoFoucs = false,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}
