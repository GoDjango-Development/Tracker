import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/bloc/gps/gps_bloc.dart';
import 'package:tracker/features/login/login.dart';

import 'gps_access_page.dart';

class PermissionPage extends StatelessWidget {
  const PermissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isAllGranted ? const LoginPage() : const GpsAccessPage();
        },
      ),
    );
  }
}
