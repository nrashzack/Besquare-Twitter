import 'package:flutter/material.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({ Key? key }) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
        elevation: 8,
        backgroundColor: Colors.teal[800],
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