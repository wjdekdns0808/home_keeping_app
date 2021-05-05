import 'package:flutter/material.dart';
import 'package:home_app/page/cctv.dart';
import 'package:home_app/page/led.dart';
import 'package:home_app/page/temp.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _crrentindex = 0;
  final List<Widget> _children = [TempPage(), LedPage(), CctvPage()];

  void _onTap(int index) {
    setState(() {
      _crrentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_crrentindex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.cyan[200],
          onTap: _onTap,
          currentIndex: _crrentindex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'home',
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.lightbulb_outline,
                  color: Colors.white,
                ),
                title: Text("led")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.videocam,
                  color: Colors.white,
                ),
                title: Text("cctv"))
          ]),
    );
  }
}
