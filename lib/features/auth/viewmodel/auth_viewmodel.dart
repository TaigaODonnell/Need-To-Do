import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:need_to_do/core/services/auth_service.dart';

class AuthViewmodel extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> login(String email, String password) async {
    try {
      await _firebaseService.signInWithEmailAndPassword(email, password);
      _errorMessage = null;
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
    } catch (e) {
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> loginWithGoogle() async {
    try {
      await _firebaseService.signInWithGoogle();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> signup(String name, String email, String password) async {
    try {
      await _firebaseService.signUpWithEmailAndPassword(name, email, password);
      _errorMessage = null;
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
    }
    notifyListeners();
  }
}
