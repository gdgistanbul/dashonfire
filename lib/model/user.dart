class User {
  String uid;
  String name;
  String email;

  User(
      {this.uid,
      this.name,
      this.email});

  User.fromMap(Map snapshot, String id) {
    uid = id ?? '';
    name = snapshot['name'] ?? "";
    email = snapshot['email'] ?? '';
  }

  toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
    };
  }
}
