import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:need_to_do/core/models/user.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return AppUser.fromFirebaseUser(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<AppUser?> signUpWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        await user.updateProfile(displayName: name);
        await user.reload();
        user = _auth.currentUser;

        AppUser appUser = AppUser.fromFirebaseUser(user!);

        await _firestore
            .collection('users')
            .doc(appUser.uid)
            .set(appUser.toFirestore());

        return appUser;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<AppUser?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        DocumentSnapshot doc =
            await _firestore.collection('users').doc(user.uid).get();
        if (!doc.exists) {
          AppUser appUser = AppUser(
              name: user.displayName?.split(' ').first ?? "",
              email: user.email ?? "",
              uid: user.uid);
          await _firestore
              .collection('users')
              .doc(appUser.uid)
              .set(appUser.toFirestore());
          return appUser;
        } else {
          return AppUser.fromFirestore(doc.data() as Map<String, dynamic>);
        }
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<AppUser?> anonymousSignIn() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      print("Signed in with temporary account.");
      if (userCredential.user != null) {
        DocumentSnapshot doc = await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();
        AppUser appUser =
            AppUser.fromFirebaseUser(userCredential.user!, isGuest: true);
        if (!doc.exists) {
          await _firestore
              .collection('users')
              .doc(appUser.uid)
              .set(appUser.toFirestore());
          return appUser;
        }
        return null;
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
    return null;
  }
}
