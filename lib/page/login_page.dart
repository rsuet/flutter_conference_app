import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              "res/logo_transparent.png",
              width: 480,
              height: 640,
              fit: BoxFit.fitWidth,
            ),
            FlatButton(
              color: Theme.of(context).accentColor,
              child: const Text("Googleでログイン", style: TextStyle(color: Colors.white),),
              onPressed: () {
                _signIn();
              },
            ),
          ],
        )
      ),
    );
  }

  void _signIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    if (user != null) {
      Navigator.pushReplacementNamed(context, "/list");
    }
  }

}
