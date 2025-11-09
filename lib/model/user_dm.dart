class UserDm {
  static const collectionName = "users";
  static UserDm? currentUser;
  late String id;
  late String name;
  late String emailAddress;
  UserDm({required this.id, required this.name, required this.emailAddress});
  Map<String, dynamic> toJason() {
    return {"id": id, "name": name, "emailAddress": emailAddress};
  }

  UserDm.fromjason(Map jason) {
    id = jason["id"];
    name = jason["name"];
    emailAddress = jason["emailAddress"];
  }
}
