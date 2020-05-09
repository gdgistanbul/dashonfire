class Message {
  String uid;
  String message;
  String senderId;
  List<String> likedUsers;

  Message({this.uid, this.message, this.senderId, this.likedUsers});

  Message.fromMap(Map snapshot, String id) {
    uid = id ?? '';
    message = snapshot['message'] ?? "";
    senderId = snapshot['senderId'] ?? '';
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
      "likedUsers": likedUsers,
    };
  }
}
