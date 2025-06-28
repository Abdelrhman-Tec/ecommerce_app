import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkUtils {
  static Future<bool> hasInternet() async {
    final checker = InternetConnectionChecker.createInstance();
    return await checker.hasConnection;
  }
}
