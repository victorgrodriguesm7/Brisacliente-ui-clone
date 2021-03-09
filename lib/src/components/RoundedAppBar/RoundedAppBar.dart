import 'package:flutter/material.dart';

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const RoundedAppBar({Key key, this.title = "Brisacliente"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      ),
      backgroundColor: Color(0xFF093d93),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(60);
}
