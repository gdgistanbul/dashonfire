
class Streams {
  String id;
  String name;
  String url;

  Streams(this.id, this.name, this.url);

  Streams.fromMap(Map snapshot, String documentId) {
    id = documentId;
    name = snapshot['name'];
    url = snapshot['url'];
  }
}
