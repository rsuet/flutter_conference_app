import 'package:flutter/material.dart';
import 'package:flutter_conference_app/page/login_page.dart';
import 'package:flutter_conference_app/page/about_page.dart';
import 'package:flutter_conference_app/page/list_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MediaDo Tech Conference 2019",
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: _auth.currentUser() == null ? Login() : List(),
      routes: <String, WidgetBuilder> {
        "/login": (BuildContext context) => Login(),
        "/about": (BuildContext context) => About(),
        "/list": (BuildContext context) => List(),
      },
    );
  }
}
