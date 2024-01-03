import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tracker/bloc/gps/gps_bloc.dart';
import 'package:tracker/features/views/permissions/permission_page.dart';
import 'package:tracker/routing/router_manager.dart';
import 'package:tracker/utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  RouterManager.configureRoute();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GpsBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tracker',
      theme: ThemeApp.lightTheme,
      initialRoute: '/',
      home: const PermissionPage(),
      getPages: RouterManager.routes,
    );
  }
}
