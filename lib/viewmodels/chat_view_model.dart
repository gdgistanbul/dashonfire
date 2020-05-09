import 'package:dash_on_fire/model/messagEntity.dart';
import 'package:dash_on_fire/model/message.dart';
import 'package:dash_on_fire/model/user.dart';
import 'package:dash_on_fire/services/firestore_service.dart';
import 'package:dash_on_fire/viewmodels/login_provider.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class ChatProvider extends ChangeNotifier {
  final DataBase databaseService = locator<DataBase>();

  final TextEditingController controller = new TextEditingController();
  List<MessageWithUser> messageWithuser;

  ChatProvider(){
    listenToMessages();
  }


  listenToMessages() {
    databaseService.listenMessages().listen((messages) async {
      List<Message> allMessages = messages;
      if (allMessages != null && allMessages.length > 0) {
        for (Message message in allMessages) {
          var sender = await databaseService.usersCollectionReference
              .document(message.senderId)
              .get();
          var user = User.fromMap(sender.data, sender.documentID);
          messageWithuser.add(MessageWithUser.fromMap(user, message));
          notifyListeners();
        }
      }
    });
    // listenMessages
  }

  // void listenToPosts() {
  //   firestoreService.listenBlogsRealTime().listen((blogsData) async {
  //     List<Blog> updatedPosts = blogsData;
  //     if (updatedPosts != null && updatedPosts.length > 0) {
  //       for (Blog blog in updatedPosts) {
  //         var document = await firestoreService.usersCollectionReference
  //             .document(blog.author)
  //             .get();
  //         var user = User.fromMap(document.data, blog.author);
  //         // User user = getUser(blog.author);
  //         blogList.add(BlogList(blog: blog, user: user));
  //       }
  //       blogs = updatedPosts;
  //       initialBlogList = blogList;
  //     }
  //     notifyListeners();
  //   });
  // }
}
