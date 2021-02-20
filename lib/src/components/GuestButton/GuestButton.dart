import 'package:flutter/material.dart';
class GuestButton extends StatelessWidget {
  static const Color defaultnotInvertedTextColor = Color(0xFF093d93);
  final String text;
  final Function onPressed;
  final bool isInverted;
  final Color notInvertedBackgroundColor;
  final Color notInvertedTextColor;
  GuestButton({
    Key key, 
    this.onPressed,
    this.isInverted: false,
    this.text,
    this.notInvertedBackgroundColor: Colors.white,
    this.notInvertedTextColor: GuestButton.defaultnotInvertedTextColor,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: isInverted ? Color(0xFF5376ae) : Colors.transparent,
            width: 1
          )
        ),
        color: isInverted ? Colors.transparent : notInvertedBackgroundColor,
        child: Text(
          text,
          style: TextStyle(
            color: isInverted ?  Color(0xFF5376ae) : notInvertedTextColor,
            fontWeight: FontWeight.w400
          ),
        ),
        onPressed: onPressed
    );
  }
}