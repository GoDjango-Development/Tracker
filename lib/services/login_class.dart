import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'comm_server.dart';
import 'package:crypto/crypto.dart';

class LoginClass {
  CommServer comm = CommServer();

  bool loggedIn = false;

  String dns = '';
  String port = '';

  void login(String token, String dnsTxt, String portTxt) {
    _saveValues(dnsTxt, portTxt);
    loggedIn = true;
  }

  void logout() {
    loggedIn = false;
  }

  bool loggedStatus() {
    return loggedIn;
  }

  bool dummy() {
    return true;
  }

  Future<void> _saveValues(String dnsTxt, String portTxt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('DNSText', dnsTxt);
    prefs.setString('PortText', portTxt);
  }

  // generate Hash
  String getHash(String user, String password) {
    List<int> bytes = utf8.encode('$user$password.sd');

    Digest digest = sha256.convert(bytes);

    String hashResult = digest.toString();
    return hashResult;
  }
}
