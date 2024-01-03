import 'dart:convert';

import 'comm_server.dart';
import 'package:crypto/crypto.dart';

class LoginClass {
  CommServer comm = CommServer();

  bool loggedIn = false;
  void login(String token) {
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

  // generate Hash
  String getHash(String user, String password) {
    List<int> bytes = utf8.encode('$user$password.sd');

    Digest digest = sha256.convert(bytes);

    String hashResult = digest.toString();
    return hashResult;
  }
}
