import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  const RoundButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(color: Colors.red),
      child: Center(
          child: Text(
        title,
        style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16),
      )),
    );
  }
}
