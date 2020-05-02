import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_on_fire/model/stream_model.dart';

class DataBase{
static final DataBase instance = DataBase();

  final CollectionReference streamsCollectionReference =
      Firestore.instance.collection('streams');


  Future<List<DocumentSnapshot>> getStreams() async{
    return await streamsCollectionReference.getDocuments()
                            .then((document) => document.documents);
  }
  
}