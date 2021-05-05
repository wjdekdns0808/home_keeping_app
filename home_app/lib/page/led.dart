import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LedPage extends StatefulWidget {
  @override
  _LedPageState createState() => _LedPageState();
}

class _LedPageState extends State<LedPage> {
  bool newStatus = true;

  void _toggleSwitch(swichStatus) {
    var client = http.Client();
    try {
      var url = 'http://192.168.200.124:3000/switchLed';
      client.post(url,
          body: json.encode({'status': !newStatus}),
          headers: {'Content-type': 'application/json'}).then((response) {
        print('status: ${newStatus.toString()}');
      });
    } finally {
      client.close();
    }
    setState(() {
      newStatus = !newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('LED'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.green[300], Colors.cyan[100]],
          )),
        ),
      ),
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
            children: <Widget>[
              Image.asset(
                '${newStatus != true ? 'images/led_off.png' : 'images/led_on.png'}',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'led ${newStatus != true ? 'on' : 'off'}',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Transform.scale(
                scale: 3.0,
                child: Switch(
                  onChanged: _toggleSwitch,
                  value: newStatus,
                  activeColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
