import 'package:flutter/material.dart';

class LoginBoxText extends StatelessWidget {
  final String text;
  const LoginBoxText({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 13,
        color: Color(0xFFbdc3c7)
      )
    );
  }
}