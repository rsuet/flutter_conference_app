import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_conference_app/widget/my_drawer.dart';
import 'package:share/share.dart';

class List extends StatefulWidget {
  @override
  _MyList createState() => _MyList();
}

class _MyList extends State<List> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text("MediaDo Tech Conference 2019"),
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _key.currentState.openDrawer();
            }
        ),
      ),
      drawer: new MyDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection("sessions").orderBy("datetime").snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Text("ロード中です");
                }
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  padding: const EdgeInsets.only(top: 10.0),
                  itemBuilder: (context, index) => _buildListItem(context, snapshot.data.documents[index])
                );
              }
          )
      ),
    );
  }

  Stream<DocumentSnapshot> getFavorites(String userId) {
    return Firestore.instance
        .collection("users")
        .document(userId)
        .snapshots();
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  //leading: const Icon(Icons.business),
                  title: Text(document['title']),
                  subtitle: Text(document['datetime'] + " / " + document['place']),
                  trailing: IconButton(icon: Icon(Icons.share), onPressed: () {
                    Share.share("MediaDo Tech Confernce 2019 " + document['title'].toString());
                  }),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(alignment: Alignment.topLeft, child: Text(document['overview']),)
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepOrangeAccent,
                    child: Icon(Icons.person),
                  ),
                  title: Text(document['speakerName']),
                  subtitle: Text(document['speakerDescription']),
                )
              ],
            ),
          )
        ],
      ),
    );

  }

}
