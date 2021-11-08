// ignore_for_file: prefer_const_declarations, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:mobile_final/component/user_page.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'login.dart';
import 'home.dart';
import 'settings.dart';
import 'favPage.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({required this.Drawerchannel, Key? key}) : super(key: key);

  WebSocketChannel Drawerchannel;

  @override
  State<DrawerScreen> createState() => _DrawerScreenState(this.Drawerchannel);
}

class _DrawerScreenState extends State<DrawerScreen> {
  void signOut() {
    Drawerchannel.sink.close();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginPage(),
    ));
    print('Connection Closed');
  }

  _DrawerScreenState(this.Drawerchannel);
  WebSocketChannel Drawerchannel;

  final padding = EdgeInsets.symmetric(horizontal: 20);
  void selectedItem(BuildContext context, int i) {
    Navigator.of(context).pop();
    switch (i) {
      case 0:
        showAboutDialog(
            context: context,
            applicationIcon: FlutterLogo(),
            applicationName: 'About',
            applicationVersion: '0.0.1',
            applicationLegalese: 'Developed by Nashsyeerah',
            children: <Widget>[
              Text(
                  'This is a BeSquare Twitter Demo app for Mobile Development module final project.')
            ]);

        break;
      case 1:
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => FavPage(),
        // ));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Settings()));
        break;
      case 3:
        signOut();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = 'Nur Nashsyeerah';
    final urlImage =
        'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg';

    return Drawer(
      child: Material(
        color: Colors.white10,
        child: ListView(
          children: <Widget>[
            buildHeader(
                urlImage: urlImage,
                name: name,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserPage(
                          name: name,
                          urlImage: urlImage,
                        )))),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'About',
              icon: Icons.info,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Favorites',
              icon: Icons.favorite,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: 'Settings',
              icon: Icons.settings,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 16),
            const Divider(color: Colors.grey),
            buildMenuItem(
                text: 'Log Out',
                icon: Icons.logout,
                onClicked: () => selectedItem(context, 3)),
            const SizedBox(height: 16),
            buildMenuItem(text: 'Mode', icon: Icons.toggle_off)
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    final color = Colors.teal;
    final hoverColor = Colors.tealAccent;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}

Widget buildHeader({
  required String urlImage,
  required String name,
  required VoidCallback onClicked,
}) =>
    InkWell(
      onTap: onClicked,
      child: Container(
        color: Colors.teal[50],
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(urlImage),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
