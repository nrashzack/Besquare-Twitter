// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 8,
        centerTitle: true,
        title: Text('About',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            )),
        backgroundColor: Colors.teal[800],
      ),
    );
  }
}
