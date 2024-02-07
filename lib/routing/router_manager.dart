import 'package:get/get.dart';
import 'package:tracker/features/login/login.dart';
import 'package:tracker/features/views/map/map_page.dart';

class RouterManager {
  static final routes = [
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/map', page: () => const MapPage()),
  ];

  static void configureRoute() {
    Get.config(
        enableLog: true, defaultTransition: Transition.cupertino);
  }
}
