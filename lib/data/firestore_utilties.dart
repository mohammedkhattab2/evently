import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/model/user_dm.dart';

Future<void> addUsersToFirestore(UserDm user) async {
  var userCollection = FirebaseFirestore.instance.collection(
    UserDm.collectionName,
  );
  var embtyDoc = userCollection.doc(user.id);
  await embtyDoc.set({
    "id" : user.id,
    "name": user.name,
    " emailAddress" : user.emailAddress
  });
}

// userDm getUsersFromFirestore (String userId){}
Future<void> addEventToFirestore(EventDm event) async {
  var eventsCollection = FirebaseFirestore.instance.collection(
    EventDm.colictionName,
  );
  var emptyBoc = eventsCollection.doc();
  emptyBoc.set({
    "title": event.title,
    "description": event.description,
    "date": event.date,
    "catogry": event.catogryId,
    "Id": "",
    "ownerId": "",
  });
}
// List <EventDm> getAllEventFromFirestore(){}
// List <EventDm>  getFavoritEventFromFirestore(){}