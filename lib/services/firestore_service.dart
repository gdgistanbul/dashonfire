import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_on_fire/model/stream_model.dart';

class DataBase {
  static final DataBase instance = DataBase();

  final CollectionReference streamsCollectionReference =
      Firestore.instance.collection('streams');

  Future<List<Streams>> getStreams() async {
    var doc = await streamsCollectionReference.getDocuments();
    var streams = doc.documents
        .map((stream) => Streams.fromMap(stream.data, stream.documentID))
        .toList();
    return streams;
  }
}

// Future<List<Streams>> getStreams() async{
//   var doc = await streamsCollectionReference.getDocuments();
//   var streams = doc.documents
//           .map((snapshot) => Streams.fromMap(snapshot.data,snapshot.documentID ))
//           .where((mappedItem) => mappedItem.name != null)
//           .toList();
//   return streams;

// }
