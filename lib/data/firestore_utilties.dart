import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/model/user_dm.dart';

Future<void> addUsersToFirestore(UserDm user) async {
  var userCollection = FirebaseFirestore.instance.collection(
    UserDm.collectionName,
  );
  var embtyDoc = userCollection.doc(user.id);
  embtyDoc.set(user.toJason());
}

Future<UserDm> getUsersFromFirestore(String userId) async {
  var userColection = FirebaseFirestore.instance.collection(
    UserDm.collectionName,
  );
  var userDoc = userColection.doc(userId);
  var snapShot = await userDoc.get();
  Map jason = snapShot.data() as Map;
  var user = UserDm.fromjason(jason);
  return user;
}

Future<void> addEventToFirestore(EventDm event) async {
  var eventsCollection = FirebaseFirestore.instance.collection(
    EventDm.colictionName,
  );
  var emptyBoc = eventsCollection.doc();
  event.id = emptyBoc.id;
  emptyBoc.set(event.toJson());
}

Future<List<EventDm>> getAllEventFromFirestore() async {
  var eventCollection = FirebaseFirestore.instance.collection(
    EventDm.colictionName,
  );
  var querySnapshot = await eventCollection.get();
  List<EventDm> event = querySnapshot.docs.map((docSnapshot) {
    var json = docSnapshot.data();
    return EventDm.fromJson(json);
  }).toList();
  return event;
}
Future<List<EventDm>> getFavoritEvents() async {
  var eventCollection = FirebaseFirestore.instance.collection(
    EventDm.colictionName,
  );
  var querySnapshot = await eventCollection.where("id", whereIn: UserDm.currentUser!.favoritEvents ).get();
  List<EventDm> event = querySnapshot.docs.map((docSnapshot) {
    var json = docSnapshot.data();
    return EventDm.fromJson(json);
  }).toList();
  return event;
}

Future addEventToFavorite(String eventId) async {
  var userCollection = FirebaseFirestore.instance.collection(
    UserDm.collectionName,
  );
  var currentUser = userCollection.doc(UserDm.currentUser!.id);
  currentUser.update({
    "favoritEvents": FieldValue.arrayUnion([eventId]),
  });
  UserDm.currentUser!.favoritEvents.add(eventId);
}

Future removeEventFromFavorite(String eventId) async {
  var userCollection = FirebaseFirestore.instance.collection(
    UserDm.collectionName,
  );
  var currentUser = userCollection.doc(UserDm.currentUser!.id);
  currentUser.update({
    "favoritEvents": FieldValue.arrayRemove([eventId]),
  });
  UserDm.currentUser!.favoritEvents.remove(eventId);
}
