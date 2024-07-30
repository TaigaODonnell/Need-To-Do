import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:need_to_do/core/models/user.dart';
import 'package:need_to_do/core/services/auth_service.dart';
import 'package:need_to_do/core/viewmodels/user_provider.dart';

class AuthViewmodel extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();
  final UserProvider _userProvider;

  String? _errorMessage;

  AuthViewmodel(this._userProvider);
  String? get errorMessage => _errorMessage;

  Future<bool> isLoggedIn() async {
    //checks for logged in user, used for auth persistance
    final bool isLoggedIn = await _firebaseService.isLoggedIn();
    if (isLoggedIn) {
      User? firebaseuser = await _firebaseService.currentUser;
      if (firebaseuser != null) {
        _userProvider.setUser(AppUser.fromFirebaseUser(
            firebaseuser)); //sets user to user provider
      }
    }
    return isLoggedIn;
  }

  Future<void> login(String email, String password) async {
    //logs in user with email and password
    try {
      final user =
          await _firebaseService.signInWithEmailAndPassword(email, password);
      if (user != null) {
        _userProvider.setUser(user);
      }
      _errorMessage = null;
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
    } catch (e) {
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> loginWithGoogle() async {
    //logs in user with google
    try {
      final user = await _firebaseService.signInWithGoogle();
      if (user != null) {
        _userProvider.setUser(user);
      }
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> signup(String name, String email, String password) async {
    //signs up user with email and password
    try {
      final user = await _firebaseService.signUpWithEmailAndPassword(
          name, email, password);
      if (user != null) {
        _userProvider.setUser(user);
      }
      _errorMessage = null;
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
    }
    notifyListeners();
  }

  Future<void> anonymousSignIn() async {
    //signs in user anonymously
    try {
      final user = await _firebaseService.anonymousSignIn();
      if (user != null) {
        _userProvider.setUser(user);
      }
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    //signs out user
    try {
      await _firebaseService.signOut();
      _userProvider.clearUser();
      _errorMessage = null;
    } on Exception catch (e) {
      _errorMessage = e.toString();
    }
    notifyListeners();
  }
}
