import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: SizedBox(
        height: height / 5,
        child: CircularProgressIndicator(
          semanticsLabel: "Enviando Documentos",
          strokeWidth: 5,
        )
      ),
    );
  }
}