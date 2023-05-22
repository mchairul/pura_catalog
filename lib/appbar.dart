import 'package:flutter/material.dart';

class CustomAppbar extends AppBar{
  CustomAppbar() : super(
    backgroundColor: Colors.cyan,
    elevation: 0.25,
    flexibleSpace: _buildWidgetAppbar(),
  );

  static Widget _buildWidgetAppbar() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset("assets/logo.png")
        ],
      ),
    );
  }
}
