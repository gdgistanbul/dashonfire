import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_on_fire/viewmodels/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Consumer<LoginProvider>(
        builder: (_, model, child) {
          return FutureBuilder<List<DocumentSnapshot>>(
              future: model.databaseService.getStreams(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<DocumentSnapshot> streamList = snapshot.data;
                  return ListView.builder(
                    itemCount: streamList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: <Widget>[
                          Container(
                            height: 80,
                            child: Image.network(streamList[index].data['url']),
                          ),
                          Center(
                            child: Text(streamList[index].data['name']),
                          )
                        ],
                      );
                    },
                  );
                }
              });
        },
        child: Container(),
      ),
    );
  }
}
