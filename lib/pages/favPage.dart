// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';

class FavPage extends StatefulWidget {
  const FavPage({ Key? key }) : super(key: key);

  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Likes', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),),
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors.grey[800],
          ),
        ),
      ),
      
    );
  }
}