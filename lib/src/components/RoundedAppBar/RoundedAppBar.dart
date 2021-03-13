import 'package:flutter/material.dart';

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasBackIcon;
  const RoundedAppBar({Key key, this.title = "Brisacliente", this.hasBackIcon = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AppBar(
      leading: this.hasBackIcon ? 
        TextButton(
          child: Icon(
            Icons.keyboard_arrow_left,
            size: width * 0.1,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ) : Container(),
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
