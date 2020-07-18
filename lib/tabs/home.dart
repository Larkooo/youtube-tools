import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child:
              //OutlineInputBorder(borderRadius: 2),
              OutlineButton.icon(
            label: Text("Download"),
            onPressed: () {},
            icon: Icon(Icons.file_download),
          ),
        ),
      ),
    );
  }
}
