// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'drawer.dart';
import 'home.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 8,
        centerTitle: true,
        title: Text('Settings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            )),
        backgroundColor: Colors.teal[800],
      ),
      body: Container(
        child: Center(
          
          child: Text('Not in the project requirement.\n Dummy purpose.', style: TextStyle(fontSize: 30), textAlign: TextAlign.center,) 
          ,),
      ),
    );
  }
}
