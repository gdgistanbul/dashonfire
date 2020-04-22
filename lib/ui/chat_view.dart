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
          return Text("welcome ${model.getUser()}");
        },
        child: Container(),
      ),
    );
  }
}
