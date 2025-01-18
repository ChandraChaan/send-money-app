import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isInitialized = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get isInitialized => _isInitialized;

  // Initialize login status from local storage
  Future<void> initializeLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    _isInitialized = true;
    notifyListeners();
  }

  // Login the user
  Future<void> login(String username, String password) async {
    if (username == 'user' && password == 'pass') {
      _isLoggedIn = true;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      notifyListeners();
    } else {
      throw Exception('Invalid username or password');
    }
  }

  // Logout the user
  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    _isLoggedIn = false;
    notifyListeners();
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
}