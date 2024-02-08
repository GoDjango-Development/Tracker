import 'package:flutter/material.dart';
import 'package:tracker/services/tfprotocol.dart';

import '../model/i_tfprotocol_callback.dart';

class CommServer extends StatelessWidget implements ITfprotocolCallback {
  const CommServer({super.key});
  
  @override
  Widget build(BuildContext context) {
    final TFProtocol tfProtocol = TFProtocol("godjango.dev", 10377, "", "", this);

    tfProtocol.connect();

    return const SizedBox();
  }

  bool dummy() {
    return true;
  }
  
  @override
  void echoCallback(String value) {
    // TODO: implement echoCallback
  }
  
  @override
  void fstatCallback(String value) {
    // TODO: implement fstatCallback
  }
  
  @override
  void renamCallback(String value) {
    // TODO: implement renamCallback
  }
  
  @override
  void statusServer(String value) {
    // TODO: implement statusServer
  }
  
  @override
  void supCallback(String value) {
    // TODO: implement supCallback
  }
}
