import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TempPage extends StatefulWidget {
  @override
  _TempPageState createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  Future fetch() async {
    try {
      var res = await http.get('http://192.168.200.124:3000/temp');
      return jsonDecode(res.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('home keeping'),
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
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                'Temperature',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: this.fetch(),
                  builder: (context, snap) {
                    if (!snap.hasData) return CircularProgressIndicator();
                    return Text(
                      snap.data['temp'].toString() + 'c',
                      style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    );
                  }),
              SizedBox(
                height: 40,
              ),
              Text(
                'Humidity',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: this.fetch(),
                  builder: (context, snap) {
                    if (!snap.hasData) return CircularProgressIndicator();
                    return Text(
                      snap.data['humid'].toString() + '%',
                      style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    );
                  }),
              SizedBox(
                height: 80,
              ),
              Text('Temperature and Humidity')
            ],
          ),
        ),
      ),
    );
  }
}
