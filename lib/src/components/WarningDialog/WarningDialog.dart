import 'package:Brisacliente/src/components/LoginBoxButton/LoginBoxButton.dart';
import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  final String error;
  final String redirectText;
  final Function redirectFunction;
  WarningDialog({
    Key key,
    this.error,
    this.redirectText,
    this.redirectFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(left: 7.0, bottom: 10),
      titlePadding: EdgeInsets.only(left: 7.0, top: 15, bottom: 25),
      title: Row(
        children: [
          Icon(
            Icons.warning,
            color: Color(0xFFf46e27),
            size: 30
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text("Ops", 
              style: TextStyle(
                color: Color(0xFF093d93)
              ),
            ),
          )
        ],
      ),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                  error,
                  style: TextStyle(
                    color: Color(0xFF093d93)
                  ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LoginBoxButton(
                      isInverted: true, 
                      text: "Cancelar",
                      onPressed: () => Navigator.of(context).pop()
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LoginBoxButton( 
                      text: redirectText,
                      onPressed: redirectFunction
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}