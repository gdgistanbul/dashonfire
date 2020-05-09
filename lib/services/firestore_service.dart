import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_on_fire/model/message.dart';
import 'package:dash_on_fire/model/stream_model.dart';
import 'package:dash_on_fire/model/user.dart';

class DataBase {
  static final DataBase instance = DataBase();

  final CollectionReference streamsCollectionReference =
      Firestore.instance.collection('streams');
  final CollectionReference usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference messagesCollectionReference =
      Firestore.instance.collection('messages');

  final StreamController<List<Message>> messagesController =
      StreamController<List<Message>>.broadcast();

  Future<List<Streams>> getStreams() async {
    var doc = await streamsCollectionReference.getDocuments();

    var streams = doc.documents
        .map((stream) => Streams.fromMap(stream.data, stream.documentID))
        .toList();
    return streams;
  }

  Future createUser(User user) async {
    await usersCollectionReference.document(user.uid).setData(user.toJson());
  }

  Stream listenMessages() {
    messagesCollectionReference.snapshots().listen((messageSnapshot) {
      if (messageSnapshot.documents.isNotEmpty) {
        var messages = messageSnapshot.documents
            .map((message) => Message.fromMap(message.data, message.documentID))
            .toList();

        messagesController.add(messages);
      }
    });
    return messagesController.stream;
  }
}
