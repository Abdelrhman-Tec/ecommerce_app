import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  // Keys
  static const _seenOnboardingKey = 'seenOnboarding';
  static const _isLoggedInKey = 'isLoggedIn';
  static const _userUidKey = 'userUid';
  static const _userFullNameKey = 'userFullName';
  static const _userEmailKey = 'userEmail';

  // Onboarding
  static Future<void> setSeenOnboarding(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_seenOnboardingKey, value);
  }

  static Future<bool> getSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_seenOnboardingKey) ?? false;
  }

  // Authentication
  static Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // User Data
  static Future<void> setUserUid(String? uid) async {
    final prefs = await SharedPreferences.getInstance();
    if (uid == null) {
      await prefs.remove(_userUidKey);
    } else {
      await prefs.setString(_userUidKey, uid);
    }
  }

  static Future<String?> getUserUid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userUidKey);
  }

  static Future<void> setUserFullName(String? fullName) async {
    final prefs = await SharedPreferences.getInstance();
    if (fullName == null) {
      await prefs.remove(_userFullNameKey);
    } else {
      await prefs.setString(_userFullNameKey, fullName);
    }
  }

  static Future<String?> getUserFullName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userFullNameKey);
  }

  static Future<void> setUserEmail(String? email) async {
    final prefs = await SharedPreferences.getInstance();
    if (email == null) {
      await prefs.remove(_userEmailKey);
    } else {
      await prefs.setString(_userEmailKey, email);
    }
  }

  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmailKey);
  }

  // Clear all user data on logout
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userUidKey);
    await prefs.remove(_userFullNameKey);
    await prefs.remove(_userEmailKey);
    await prefs.setBool(_isLoggedInKey, false);
  }
}
