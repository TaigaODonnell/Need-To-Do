import 'package:flutter/foundation.dart';
import 'package:need_to_do/features/auth/viewmodel/auth_viewmodel.dart';

class SplashViewModel with ChangeNotifier {
  final AuthViewmodel _authViewModel;
  String _state = 'loading';

  SplashViewModel(this._authViewModel);

  String get state => _state;

  Future<void> checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 1));

    bool isLoggedIn = await _authViewModel.isLoggedIn();

    _state = isLoggedIn ? 'authenticated' : 'unauthenticated';
    notifyListeners();
  }
}
