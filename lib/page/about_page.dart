import 'package:flutter/material.dart';
import 'package:flutter_conference_app/widget//my_drawer.dart';

class About extends StatelessWidget {

  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text("イベント概要"),
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _key.currentState.openDrawer();
            }
        ),
      ),
      drawer: new MyDrawer(),
      body: Column(
        children: <Widget>[
          Image.asset(
            "res/logo_transparent.png",
            width: 600,
            height: 400,
            fit: BoxFit.cover,
          ),
          titleSection,
          textSection,
        ],
      )
    );
  }

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "MediaDo Tech Conference 2019",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text(
                "日時: 2019/08/32 10:00-18:00\n会場: パレスサイドビル5F セミナールーム",
                style: TextStyle(
                  color: Colors.grey[500]
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
        "MediaDo Tech Conferenceは株式会社メディアドゥが主催する架空の技術カンファレンスです。\n\n"
            "皆様のご参加をスタッフ一同お待ちしております。"
    ),
  );


}
