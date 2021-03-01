import 'package:Brisacliente/src/components/LoginBoxButton/LoginBoxButton.dart';
import 'package:flutter/material.dart';

class SucessfullyDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final Function buttonFunction;
  const SucessfullyDialog({Key key, this.title, this.message, this.buttonText, this.buttonFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFF093d93)
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: TextStyle(
              color: Color(0xFF093d93)
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 5),
                  child: LoginBoxButton(
                    isInverted: true, 
                    text: buttonText,
                    onPressed: buttonFunction
                  ),
                ),
              ),
            ],
          )
        ]
      )
    );
  }
}