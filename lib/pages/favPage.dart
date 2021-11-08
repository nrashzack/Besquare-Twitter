// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';

class FavPage extends StatefulWidget {
   FavPage({required this.favs, Key? key}) : super(key: key);

  List favs = [];

  State<StatefulWidget> createState() {
    return _FavPageState(this.favs);
  }
}

class _FavPageState extends State<FavPage> {
  _FavPageState(this.favs);

  List favs = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Likes',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
        ),
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
      body: favs.isEmpty ? Center(
        child: Text("No Favorites",
        style: TextStyle(fontSize: 20),),
      )
      : ListView.builder(
            itemCount: favs.length,
            itemBuilder: (context, index) {
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                  favs[index]["author"],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              favs[index]
                                                  ["title"],
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.6)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        favs[index]
                                            ["description"],
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
                                            "${favs[index]["image"]}",
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
                                                favs[index]["date"],
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
                                                padding: const EdgeInsets.only(
                                                    left: 20, top: 20),
                                                onPressed: () {
                                                  setState(() {
                                                    favs.remove(favs[index]);
                                                  });
                                                  
                                                },
                                               icon: favs.contains(
                                                          favs[index]) 
                                                      ? const Icon(
                                                          Icons.favorite)
                                                      : const Icon(Icons
                                                          .favorite_border),
                                                  color: Colors.red[500],
                                                ),
                                          ),
                                        
                                          Padding(
                                            padding: EdgeInsets.only(left: 200),
                                            child: IconButton(
                                                padding: const EdgeInsets.only(
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
                        
                        ),
                      ),
                    ]),
                  ),
                ],
              );
            }),
    );
  }
}
