import 'package:dash_on_fire/model/stream_model.dart';
import 'package:dash_on_fire/utils/widgets.dart';
import 'package:dash_on_fire/viewmodels/streams_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StreamsProvider>(
      builder: (_, model, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            actions: [
              IconButton(onPressed: () {
                model.signOut(context);
              }, icon: Icon(Icons.exit_to_app))
            ],
          ),
          body: FutureBuilder<List<Streams>>(
              future: model.databaseService.getStreams(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return StreamListItem(
                        name: snapshot.data[index].name,
                        url: snapshot.data[index].url,
                        onTap: (){
                          
                        },
                      );
                    },
                  );
                }
              }),
        );
      },
    );
  }
}
