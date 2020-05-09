import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StreamListItem extends StatelessWidget {
  final String url;
  final String name;
  final DocumentReference owner;
  final GestureTapCallback onTap;

  const StreamListItem({Key key, this.url, this.name, this.onTap, this.owner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Container(
            height: 80,
            width: 100,
            child: Image.network(
              url,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Text(name),
          ),Center(
            child: Text(""),
          )
        ],
      ),
    );
  }
}
