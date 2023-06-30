import 'package:flutter/material.dart';

AppBar MainAppbar() {
  return AppBar(
    centerTitle: true,
    elevation: 3,
    toolbarHeight: 65,
    backgroundColor: Colors.black,
    title: Text(
      "NFC",
      style: TextStyle(color: Colors.white, fontSize: 19),
    ),
  );
}
