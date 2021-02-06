import 'package:flutter/material.dart';

class LoginBoxButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isInverted;
  final double width;
  const LoginBoxButton({Key key, this.text, this.onPressed, this.isInverted: false, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * 0.058,
      width: this.width ?? width * 0.25,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: isInverted ? Color(0xFFf26a0f) : Colors.transparent
          )
        ),
        elevation: 0,
        child: Text(
          text,
          style: TextStyle(
             color: isInverted ? Color(0xFFf26a0f) : Colors.white,
             fontWeight: FontWeight.w300
          ),
        ),
        onPressed: onPressed,
        color: isInverted ? Colors.white : Color(0xFFf26a0f),
      ),
    );
  }
}