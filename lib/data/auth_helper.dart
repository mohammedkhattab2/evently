import 'package:evently/data/firestore_utilties.dart';
import 'package:evently/model/user_dm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class  GoogleSignInService {
  final GoogleSignIn signIn = GoogleSignIn.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserDm?> signInWithGoogle() async {
    try {
      await signIn.initialize(
        clientId: "718020299821-57quj6sumcr7rbjsm9pcgn3q1tns441r.apps.googleusercontent.com",
        serverClientId:"718020299821-1boacseesjnbe3hsr9dg252s9atql9mf.apps.googleusercontent.com" 

      );
      final GoogleSignInAccount? googleUser = await signIn.authenticate();
      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleaUth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleaUth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        UserDm newUser = UserDm(
          id: firebaseUser.uid,
          name: firebaseUser.displayName ?? "Unknown",
          emailAddress: firebaseUser.email ?? "",
          favoritEvents: [],
        );
        await addUsersToFirestore(newUser);
        UserDm.currentUser = newUser;
        return newUser;
      }
      return null;
    } catch (e) {
      print("error $e");
      return null;
    }
  }
}
