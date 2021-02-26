import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final headerIcon;
  final headercolor;

  const CustomDrawer({Key key, this.headerIcon, this.headercolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: headercolor,
          width: MediaQuery.of(context).size.width,
          child: DrawerHeader(
            child: Icon(headerIcon),
          ),
          
        ),
      ],
    ),
  );
  }
}
