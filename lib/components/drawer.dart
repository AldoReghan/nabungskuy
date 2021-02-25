import 'package:flutter/material.dart';

Widget drawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          child: DrawerHeader(
            child: Icon(Icons.home),
          ),
        ),
      ],
    ),
  );
}
