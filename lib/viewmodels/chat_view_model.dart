import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_on_fire/model/messagEntity.dart';
import 'package:dash_on_fire/model/message.dart';
import 'package:dash_on_fire/model/user.dart';
import 'package:dash_on_fire/services/auth_service.dart';
import 'package:dash_on_fire/services/firestore_service.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class ChatProvider extends ChangeNotifier {
  final DataBase databaseService = locator<DataBase>();
  final Auth authenticationService = locator<Auth>();

  final TextEditingController controller = new TextEditingController();
  List<MessageWithUser> messageWithuser = new List();
  List<MessageWithUser> messageWithuserByLike = new List();
  bool isSortingByLike = false;
  ChatProvider() {
    listenToMessages();
  }

  listenToMessages() {
    databaseService.listenMessages().listen((messages) async {
      List<Message> allMessages = messages;
      List<MessageWithUser> newMessages = new List();
      if (allMessages != null && allMessages.length > 0) {
        for (Message message in allMessages) {
          var sender = await databaseService.usersCollectionReference
              .document(message.senderId)
              .get();
          var user = User.fromMap(sender.data, sender.documentID);
          newMessages.add(MessageWithUser.fromMap(user, message));
        }
        messageWithuser = newMessages;
        notifyListeners();
      }
    });
    // listenMessages
  }

  addMessage() {
    var message = Message(
        message: controller.text,
        senderId: authenticationService.user.uid,
        likedUsers: [""],
        date: Timestamp.now());
    databaseService.addMessage(message);
    controller.text = "";
    notifyListeners();
  }

  addLike(MessageWithUser messageWithUser) {
    print("docId" + messageWithUser.message.uid);
    messageWithUser.message.likedUsers.add(messageWithUser.message.uid);
    databaseService.updateMessage(messageWithUser.message);
    notifyListeners();
  }

  sortByLike() {
    messageWithuser.sort((a, b) =>
        a.message.likedUsers.length.compareTo(b.message.likedUsers.length));
    notifyListeners();
  }

  sortByDate() {
    messageWithuser.sort((a, b) =>
        a.message.date.compareTo(b.message.date));
    notifyListeners();
  }
}
