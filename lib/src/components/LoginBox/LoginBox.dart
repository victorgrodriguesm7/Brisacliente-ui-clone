import 'package:flutter/material.dart';

class LoginBox extends StatelessWidget {
  final String type;
  final List<Widget> children;
  final double height;
  final double radius;
  const LoginBox({Key key, this.type: "row", this.children, this.height, this.radius: 5}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double sidePadding = width * 0.04;
    double bottomPadding = height * 0.03;
    return Padding(
      padding: EdgeInsets.only(left: sidePadding, right: sidePadding,bottom: bottomPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
        height: this.height,
        child: (type != "column") ? 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children
          ) : 
          Column(
            children: children
          )
      ),
    );
  }
}