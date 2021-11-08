// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_final/pages/create.dart';
import 'package:mobile_final/pages/drawer.dart';
import 'package:mobile_final/pages/favPage.dart';
import 'package:mobile_final/pages/postdetail.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Home extends StatefulWidget {
  Home({required this.Homechannel,required this.username, Key? key}) : super(key: key);

  WebSocketChannel Homechannel;
  String username;

  State<StatefulWidget> createState() {
    return _HomeState(this.Homechannel, this.username);
  }
}

class _HomeState extends State<Home> {
  _HomeState(this.Homechannel, this.username);
  WebSocketChannel Homechannel;
  List posts = [];
  List favPosts = [];
  List detail = [];
  bool favonpressed = false;
  String username;

  dynamic decodedMessage;

  @override
  initState() {
    Homechannel.stream.listen((message) {
      decodedMessage = jsonDecode(message);
      if (decodedMessage['type'] == 'all_posts') {
        posts = decodedMessage['data']['posts'];
        // final time = decodedMessage['data']['posts']['date'];
        // final serverTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
      }
      setState(() {});
    });
    _getPost();
    super.initState();
  }

  void _getPost() {
    widget.Homechannel.sink.add('{"type":"get_posts"}');
  }

  Future<void> _loadData() async {
    _getPost();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        drawer: DrawerScreen(Drawerchannel: Homechannel),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 8,
          centerTitle: true,
          title: Image.asset('asset/twittericon.jpg',
              fit: BoxFit.contain, height: 40),
          backgroundColor: Colors.teal[800],
          actions: [
            IconButton(
                padding: EdgeInsets.only(right: 20),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavPage(favs: favPosts)));
                },
                tooltip: 'Favorites',
                icon: Icon(Icons.favorite)),
            IconButton(
                padding: EdgeInsets.only(right: 20),
                onPressed: () {
                  setState(() {
                    // posts = posts.toList();
                  });
                },
                icon: Icon(Icons.sort)),
          ],
        ),
        body: RefreshIndicator(
          child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                int reversedIndex = (posts.length - 1) - index;
                return Column(
                  children: [
                    // Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  "@" +
                                                      posts[reversedIndex]
                                                          ["author"],
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  posts[reversedIndex]["title"],
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.6)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            posts[reversedIndex]["description"],
                                            maxLines: 3,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontStyle: FontStyle.italic),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            // borderRadius:
                                            //     BorderRadius.circular(8),
                                            child: Center(
                                              child: Image.network(
                                                "${posts[reversedIndex]["image"]}",
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
                                                    posts[reversedIndex]
                                                        ["date"],
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Divider(color: Colors.grey[400]),
                                          Row(
                                            children: [
                                              Positioned(
                                                child: IconButton(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, top: 20),
                                                  onPressed: favPosts.contains(
                                                          posts[reversedIndex])
                                                      ? () {
                                                          setState(() {
                                                            favPosts.remove(posts[
                                                                reversedIndex]);
                                                          });
                                                        }
                                                      : () {
                                                          setState(() {
                                                            favPosts.add(posts[
                                                                reversedIndex]);
                                                          });
                                                        },
                                                  icon: favPosts.contains(
                                                          posts[reversedIndex])
                                                      ? const Icon(
                                                          Icons.favorite)
                                                      : const Icon(Icons
                                                          .favorite_border),
                                                  color: Colors.red[500],
                                                ),
                                              ),
                                              Positioned(
                                                child: 
                                                 ButtonBar(
                                                   children: [ 
                                                     username == posts[reversedIndex]["author"]
                                            ? IconButton(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20, top: 20),
                                                      onPressed: () {
                                                        String remove =posts[reversedIndex]["_id"];
                                                        Homechannel.sink.add('{"type": "delete_post","data": {"postId": "$remove"}}');
                                                      },
                                                      
                                                      icon: const Icon(
                                                        Icons.delete_sharp,
                                                        size: 22,
                                                      ))
                                            : SizedBox(
                                                width: 10,
                                              ),
                                                   ]),
                                                    
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 200),
                                                child: IconButton(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20, top: 20),
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.share,
                                                      size: 22,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PostDetails(
                                          image: posts[reversedIndex]["image"],
                                          name: posts[reversedIndex]["author"],
                                          desc: posts[reversedIndex]
                                              ["description"],
                                          title: posts[reversedIndex]["title"],
                                          date: posts[reversedIndex]["date"])),
                                );
                              }),
                        ),
                      ]),
                    ),
                  ],
                );
              }),
          onRefresh: _loadData,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CreatePost(Createchannel: Homechannel)));
          },
          child: Image.asset('asset/tweetpost.png'),
          backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}
