import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class PostDetails extends StatefulWidget {
  PostDetails(
      {Key? key,
      required this.image,
      required this.name,
      required this.desc,
      required this.title,
      required this.date})
      : super(key: key);
  final String image;
  final String name;
  final String desc;
  final String title;
  final String date;

  @override
  _PostDetailsState createState() => _PostDetailsState(
      this.image, this.name, this.desc, this.title, this.date);
}

class _PostDetailsState extends State<PostDetails> {
  _PostDetailsState(this.image, this.name, this.desc, this.title, this.date);

  String image;
  String name;
  String desc;
  String title;
  String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SingleChildScrollView(
                  child: Stack(children: [
                    Card(
                      elevation: 2,
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        ListTile(
                                          leading: Icon(
                                            Icons.person,
                                            size: 30,
                                            color: Colors.black,
                                          ),
                                          title: Text(
                                            "@" + name,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Text(
                                            title,
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.6)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      desc,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Center(
                                        child: Image.network(
                                          image.toString(),
                                          errorBuilder: (_1, _2, _3) {
                                            return SizedBox.shrink();
                                          },
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              date,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider(color: Colors.grey[400]),
                                    // Row(
                                    //   children: [
                                    //     Positioned(
                                    //       child: IconButton(
                                    //           padding: const EdgeInsets.only(
                                    //               left: 20, top: 20),
                                    //           onPressed: () {
                                    //             setState(() {
                                    //               detailPost.remove(
                                    //                   detailPost[index]);
                                    //             });
                                    //           },
                                    //           icon: const Icon(
                                    //             Icons.favorite,
                                    //             size: 22,
                                    //           )),
                                    //     ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 200),
                                          child: IconButton(
                                              padding: const EdgeInsets.only(
                                                  left: 120, top: 20),
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.share,
                                                size: 22,
                                              )),
                                        ),
                                      ],
                                ))
                              )]
                                    )
                          )
                        )               
                      )
                  ]
                    )
                  )
              ]);
                  
          }
                   ) 
                   );
                   }
                   
}