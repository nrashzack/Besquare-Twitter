// ignore_for_file: deprecated_member_use, prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:mobile_final/pages/splash.dart';
import 'home.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final channel =
      WebSocketChannel.connect(Uri.parse('ws://besquare-demo.herokuapp.com'));

  final controllerName = TextEditingController();
  bool signin = false;

  @override
  void initState() {
    controllerName.addListener(validation);
    super.initState();
  }

  void validation() {
    setState(() {
      if (controllerName.text.isNotEmpty) {
        signin = true;
      } else {
        signin = false;
      }
    });
  }

  void _signIn() {
    if (controllerName.text.isNotEmpty) {
      channel.sink.add(
          '{"type": "sign_in","data": {"name": "${controllerName.text}"}}');
      print('${controllerName.text} sign in success');
      controllerName.clear();
    }
  }

  @override
  void dispose() {
    controllerName.dispose();
    super.dispose();
  }

  final List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SplashScreen()));
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors.grey[800],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Enter your Besquare username",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      makeInput(label: "Username"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 90),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )),
                    child: ElevatedButton(
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.tealAccent[700],
                        elevation: 0,
                        fixedSize: const Size(300, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      onPressed: signin
                          ? () {
                              _signIn();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Home(Homechannel: channel)),
                              );
      
                              final snackBar = SnackBar(
                                content: const Text(
                                  'You have successfully login!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(height: 1, fontSize: 17),
                                ),
                                backgroundColor: (Colors.blueGrey),
                              );
      
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          : null,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/login2.jpg'),
                      fit: BoxFit.cover)),
            )
          ],
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return ValueListenableBuilder(
        valueListenable: controllerName,
        builder: (context, TextEditingValue value, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 5,
              ),
              Form(
                child: TextField(
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    hintText: 'Enter username',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                  ),
                  controller: controllerName,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          );
        });
  }
}
