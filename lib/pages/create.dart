// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile_final/pages/home.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CreatePost extends StatefulWidget {
  CreatePost({required this.Createchannel, Key? key}) : super(key: key);

  WebSocketChannel Createchannel;

  State<StatefulWidget> createState() {
    return _CreatePostState(this.Createchannel);
  }
}

class _CreatePostState extends State<CreatePost> {
  _CreatePostState(this.Createchannel);
  WebSocketChannel Createchannel;

  String text = '';
  final input1 = TextEditingController();
  final input2 = TextEditingController();
  final input3 = TextEditingController();
  List<String> messageList = [];
  bool postValid = false;

  void inputPosts() {
    setState(() {
      if (input1.text.isNotEmpty) {
        postValid = true;
      } else {
        postValid = false;
      }
    });
  }

  @override
  void initState() {
    input1.addListener(inputPosts);
    input2.addListener(inputPosts);
    input3.addListener(inputPosts);
    super.initState();
  }

  void createPosts() {
    Createchannel.sink.add(
        '{"type": "create_post","data": {"title": "${input1.text}", "description": "${input2.text}","image": "${input3.text}"}}');
    input1.clear();
    input2.clear();
    input3.clear();
    _toHome();
  }

  void _toHome() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    input1.dispose();
    input2.dispose();
    input3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF26A69A),
      appBar: AppBar(
        title: Text(
          'Create Post',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5, right: 10, bottom: 5),
            child: ElevatedButton(
              child: Text('Post'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal[900],
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    ),
                textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white),
              ),
              onPressed: postValid
                  ? () {
                      createPosts();

                      final snackBar = SnackBar(
                        content: const Text(
                          'Posted!',
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 1, fontSize: 17),
                        ),
                        backgroundColor: (Colors.blueGrey),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  : null,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 82.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0)),
                      color: Colors.white),
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Title',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w800),
                            ),
                            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                            TextField(
                              controller: input1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2.0),
                                ),
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w800),
                            ),
                            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                            TextField(
                              maxLines: 5,
                              style: TextStyle(fontSize: 15),
                              controller: input2,
                              decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Image URL',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w800),
                            ),
                            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                            TextField(
                              controller: input3,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
