import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: new Text("MediaDo Tech Conference 2019"),
            accountEmail: null,
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
          ),
          ListTile(
            title: Text("スケジュール"),
            leading: Icon(Icons.calendar_today, color: Colors.blue,),
            onTap: () {
              Navigator.of(context).pushNamed('/list');
            },
          ),
          ListTile(
            title: Text("イベント概要"),
            leading: Icon(Icons.info, color: Colors.grey),
            onTap: () {
              Navigator.of(context).pushNamed('/about');
            },
          ),
          ListTile(
            title: Text("ログアウト"),
            leading: Icon(Icons.exit_to_app, color: Colors.grey),
            onTap: () {
              _auth.signOut();
              Navigator.of(context).pushNamed('/login');
            },
          ),
        ],
      ),
    );
  }

}
