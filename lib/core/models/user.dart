import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  final String name;
  final String email;
  final String uid;
  final bool isGuest;

  AppUser(
      {required this.name,
      required this.email,
      required this.uid,
      this.isGuest = false});

  factory AppUser.fromFirestore(Map<String, dynamic> data) {
    return AppUser(
      name: data['name'] ?? "",
      email: data['email'] ?? "",
      uid: data['uid'] ?? "",
      isGuest: data['isGuest'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'isGuest': isGuest,
    };
  }

  factory AppUser.fromFirebaseUser(User user, {bool isGuest = false}) {
    return AppUser(
      name: user.displayName ?? "",
      email: user.email ?? "",
      uid: user.uid,
      isGuest: isGuest,
    );
  }
}
