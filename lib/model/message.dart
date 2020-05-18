import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String uid;
  String message;
  String senderId;
  Timestamp date;
  List<String> likedUsers;

  Message({this.uid,this.date, this.message, this.senderId, this.likedUsers});

  Message.fromMap(Map snapshot, String id) {
    uid = id ?? '';
    message = snapshot['message'] ?? "";
    senderId = snapshot['senderId'] ?? '';
    date = snapshot['date'] ?? '';
    if (snapshot['likedUsers'] != null) {
      likedUsers = List.from(snapshot['likedUsers']);
    } else {
      likedUsers = new List<String>();
    }
  }

  toJson() {
    return {
      "uid": uid,
      "message": message,
      "senderId": senderId,
      "date": date,
      "likedUsers": likedUsers,
    };
  }
}
