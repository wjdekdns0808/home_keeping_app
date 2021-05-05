import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/vlc_player.dart';
import 'package:flutter_vlc_player/vlc_player_controller.dart';

class CctvPage extends StatefulWidget {
  @override
  _CctvPageState createState() => _CctvPageState();
}

class _CctvPageState extends State<CctvPage> {
  final String _streamUrl = "http://192.168.200.124:8080";
  final VlcPlayerController _vlcViewController = VlcPlayerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('cctv'),
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
              _streamUrl == null
                  ? Container(
                      child: Center(
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'stream closed',
                              style: TextStyle(
                                  fontSize: 34.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))
                        ])),
                      ),
                    )
                  : VlcPlayer(
                      defaultHeight: 480,
                      defaultWidth: 640,
                      url: _streamUrl,
                      controller: _vlcViewController,
                      placeholder: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
