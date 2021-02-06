import 'package:flutter/material.dart';

class LoginBoxTitle extends StatelessWidget {
  final String text;
  const LoginBoxTitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xFF062a66), 
        fontSize: 15,
        fontWeight: FontWeight.w600
      ),
    );
  }
}