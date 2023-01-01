import 'package:flutter/material.dart';

import '../color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool loading;
  final Color color, textColor;

  const RoundButton(
      {Key? key,
      required this.title,
      required this.onPress,
      this.textColor = Colors.white,
      this.color = Colors.black,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPress,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.purple, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: const TextStyle(
                        color: AppColors.whiteColors,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
      ),
    );
  }
}
