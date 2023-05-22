import 'package:flutter/material.dart';

class ContentHome extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset("assets/banner.jpeg"),
              Container(
                padding: EdgeInsets.all(5),
                height: 120,
                margin: EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset("assets/home-about.jpeg"),
                    Expanded(child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text("Our culture is defined by ongoing innovation and breakthroughs within every division of the company."),
                    ))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
