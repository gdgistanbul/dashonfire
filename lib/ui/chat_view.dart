import 'package:dash_on_fire/model/stream_model.dart';
import 'package:dash_on_fire/utils/widgets.dart';
import 'package:dash_on_fire/viewmodels/streams_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StreamsProvider>(
      builder: (_, model, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
          ),
          body: Container()
        );
      },
    );
  }
}
