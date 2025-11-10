class UserDm {
  static const collectionName = "users";
  static UserDm? currentUser;
  late String id;
  late String name;
  late String emailAddress;
  late List<String> favoritEvents;
  UserDm({
    required this.id,
    required this.name,
    required this.emailAddress,
    required this.favoritEvents,
  });
  Map<String, dynamic> toJason() {
    return {
      "id": id,
      "name": name,
      "emailAddress": emailAddress,
      "favoritEvents": favoritEvents,
    };
  }

  UserDm.fromjason(Map jason) {
    id = jason["id"];
    name = jason["name"];
    emailAddress = jason["emailAddress"];
    List<dynamic> favList = jason["favoritEvents"] ?? [];
    favoritEvents = favList.map((id) => id.toString()).toList();
  }
}
