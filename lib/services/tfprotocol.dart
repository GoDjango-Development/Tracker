// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/services.dart';

// import '../model/i_tfprotocol_callback.dart';

// class TFProtocol {
//   final MethodChannel _platform = const MethodChannel("tfprotocol.client");
//   final ITfprotocolCallback callback;

//   TFProtocol(String dns, int port, String user, String pass, this.callback){
//     _platform.setMethodCallHandler((call) async {
//       switch(call.method){
//         case "statusServer":
//           callback.statusServer(call.arguments.toString());
//           break;
//         case "echoCallback":
//           callback.echoCallback(call.arguments.toString());
//           break;
//         case "supCallback":
//           callback.supCallback(call.arguments.toString());
//           break;
//         case "fstatCallback":
//           callback.fstatCallback(call.arguments.toString());
//           break;
//         case "renamCallback":
//           callback.renamCallback(call.arguments.toString());
//           break;
//       }
//     });

//     _config(dns, port, user, pass);
//   }

//   void _config(String dns, int port, String user, String pass){
//     _platform.invokeMethod("config", {
//       "dns" : dns,
//       "port" : port,
//       "user" : user,
//       "pass" : pass,
//     });
//   }

//   void fstat(){
//     _platform.invokeMethod("fstat");
//   }

//   void connect(){
//     _platform.invokeMethod("connect");
//   }

//   void disconnect(){
//     _platform.invokeMethod("disconnect");
//   }

//   void sup(String path, Uint8List data, int timeout){
//     _platform.invokeMethod("sup", {
//       "path" : path,
//       "data" : data,
//       "timeout" : timeout,
//     });
//   }

//   void rename(String pathOld, String pathNew){
//     _platform.invokeMethod("rename", {
//       "pathOld" : pathOld,
//       "pathNew" : pathNew,
//     });
//   }

// }
