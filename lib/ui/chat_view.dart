import 'package:dash_on_fire/model/messagEntity.dart';
import 'package:dash_on_fire/model/stream_model.dart';
import 'package:dash_on_fire/utils/widgets.dart';
import 'package:dash_on_fire/viewmodels/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (_, model, child) {
        return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              actions: [
                GestureDetector(
                  onTap: () {
                    model.isSortingByLike = !model.isSortingByLike;
                    model.isSortingByLike? model.sortByLike(): model.sortByDate();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      model.isSortingByLike? Icons.favorite: Icons.favorite_border,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                )
              ],
            ),
            body: SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 1,
                        child: model.messageWithuser == null
                            ? Container(
                                height: 50,
                                width: 50,
                                child:
                                    Center(child: CircularProgressIndicator()))
                            : ListView.separated(
                                itemCount: model.messageWithuser.length,
                                separatorBuilder: (context, index) {
                                  return Divider();
                                },
                                itemBuilder: (context, index) {
                                  return MessageItem(
                                      message: model.messageWithuser[index],
                                      onTap: () {
                                        model.addLike(
                                            model.messageWithuser[index]);
                                      },
                                      index: index);
                                },
                              ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  controller: model.controller,
                                ),
                              ),
                              SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  model.addMessage();
                                },
                                child: Icon(
                                  Icons.send,
                                  size: 24,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}

String takeUserLetters(String name) {
  var names = name.split(" ");
  StringBuffer buffer = new StringBuffer();
  names.forEach((name) => buffer.write(name[0]));
  return buffer.toString();
}

class MessageItem extends StatelessWidget {
  final MessageWithUser message;
  final int index;
  final GestureTapCallback onTap;
  const MessageItem({
    Key key,
    this.message,
    this.index,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[index % Colors.primaries.length],
          child: Center(child: Text(takeUserLetters(message.user.name))),
        ),
        title: Text(message.user.name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        subtitle: Text(message.message.message),
        trailing: Container(
          height: 50,
          width: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: onTap,
                  child: Icon(Icons.thumb_up, size: 24, color: Colors.red)),
              Text(message.message.likedUsers.length.toString())
            ],
          ),
        ),
      ),
    );
  }
}
