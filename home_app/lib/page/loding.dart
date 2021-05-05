import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_app/page/home.dart';

class LodingPage extends StatefulWidget {
  @override
  _LodingPageState createState() => _LodingPageState();
}

class _LodingPageState extends State<LodingPage> {
  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() async {
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green[300], Colors.cyan[100], Colors.cyan[300]],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/house.png',
                width: 250,
                height: 250,
              ),
              SizedBox(
                height: 50,
              ),
              Text('HOME KEEPING'),
              SizedBox(
                height: 20,
              ),
              Text('loding...')
            ],
          ),
        ),
      ),
    );
  }
}
