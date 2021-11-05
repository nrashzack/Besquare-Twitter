// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile_final/pages/create.dart';
import 'package:mobile_final/pages/drawer.dart';
import 'package:mobile_final/pages/favPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          drawer: DrawerScreen(),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 8,
            centerTitle: true,
            title: Image.asset('asset/twittericon.jpg', fit: BoxFit.contain,  height: 40),
            // title: Text('Home',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       color: Colors.white,
            //       fontSize: 20,
            //     )),
            backgroundColor: Colors.teal[800],
            actions: [
              IconButton(
                  padding: EdgeInsets.only(right: 20),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FavPage()));
                  },
                  tooltip: 'Favorites',
                  icon: Icon(Icons.favorite))
            ],
          ),
          // body: ListView.builder(
          //     itemCount: items == null ? 0 : items.length,
          //     itemBuilder: (context, index) {
          //       return Card(
          //         elevation: 7,
          //         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          //         child: Container(
          //           color: Colors.white10,
          //           padding: EdgeInsets.all(20),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center, //card position
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Container(
          //                 width: 50,
          //                 height: 50,
          //                 child: items[index].image == null
          //                     ? Image.asset('asset/user.png')
          //                     : Image(
          //                         image: NetworkImage(
          //                           items[index].image.toString(),
          //                         ),
          //                         fit: BoxFit.fill,
          //                       ),
          //               ),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               Expanded(
          //                   child: Container(
          //                 padding: EdgeInsets.only(bottom: 8),
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Row(
          //                       children: [
          //                         Padding(
          //                           padding: EdgeInsets.only(left: 8, right: 8),
          //                           child: Text(
          //                             items[index].title.toString(),
          //                             style: TextStyle(
          //                                 fontSize: 16,
          //                                 fontWeight: FontWeight.bold),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                     Padding(
          //                       padding: EdgeInsets.only(
          //                           left: 8, right: 8, top: 8, bottom: 8),
          //                       child: Text(
          //                         items[index].username.toString(),
          //                         style:
          //                             TextStyle(fontSize: 14, color: Colors.grey),
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 8, right: 8),
          //                       child: items[index].status == null
          //                           ? Text(
          //                               'Status: None',
          //                               style: TextStyle(
          //                                   fontSize: 15, color: Colors.black54),
          //                             )
          //                           : Text(
          //                               items[index].status.toString(),
          //                               style: TextStyle(
          //                                   fontSize: 15, color: Colors.black),
          //                             ),
          //                     ),
          //                   ],
          //                 ),
          //               )),
          //               Column(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   Padding(
          //                     padding: EdgeInsets.only(left: 8, right: 8),
          //                     child: Text(items[index].lastseentime.toString()),
          //                   ),
          //                   SizedBox(
          //                     height: 20,
          //                   ),
          //                   Stack(children: <Widget>[
          //                     Container(
          //                       width: 40,
          //                       height: 40,
          //                       decoration: BoxDecoration(
          //                         shape: BoxShape.circle,
          //                         color: Colors.lightGreen[400],
          //                       ),
          //                     ),
          //                     Positioned(
          //                       top: 11,
          //                       left: 15,
          //                       child: Container(
          //                         child: items[index].messages == null
          //                             ? Text(
          //                                 '0',
          //                                 style: TextStyle(
          //                                     color: Colors.white,
          //                                     fontSize: 17,
          //                                     fontWeight: FontWeight.bold),
          //                               )
          //                             : Text(
          //                                 items[index].messages.toString(),
          //                                 style: TextStyle(
          //                                     color: Colors.white,
          //                                     fontSize: 17,
          //                                     fontWeight: FontWeight.bold),
          //                               ),
          //                       ),
          //                     ),
          //                   ]),
          //                 ],
          //               )
          //             ],
          //           ),
          //         ),
          //       );
          //     }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CreatePost()));
            },
            child: Image.asset('asset/tweetpost.png'),
            backgroundColor: Colors.teal,
          )),
    );
  }
}
