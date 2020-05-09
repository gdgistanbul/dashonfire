import 'package:dash_on_fire/model/message.dart';
import 'package:dash_on_fire/model/user.dart';

class MessageWithUser {
  User user;
  Message message;

  MessageWithUser({this.user, this.message});

  MessageWithUser.fromMap(User user, Message message) {
    this.user = user;
    this.message = message;
  }
}
