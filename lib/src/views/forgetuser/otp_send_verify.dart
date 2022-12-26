import 'package:flutter/material.dart';

class OtpSendVerify extends StatefulWidget {
  const OtpSendVerify({Key? key}) : super(key: key);

  @override
  State<OtpSendVerify> createState() => _OtpSendVerifyState();
}

class _OtpSendVerifyState extends State<OtpSendVerify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: const Text('OtpSend'),
      ),
    );
  }
}
