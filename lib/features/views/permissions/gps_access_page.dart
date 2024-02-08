import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/contants/palette.dart';
import 'package:tracker/widgets/custom_elevated_bottom.dart';

import '../../../bloc/gps/gps_bloc.dart';
import '../../../utils/theme.dart';

class GpsAccessPage extends StatelessWidget {
  const GpsAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isGpsEnable
              ? const _AccessButton()
              : const _EnableGpsMessage();
        },
      ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextThemeData.textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Access to GPS is required',
            style: textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomElevatedBottom(
            onPressed: () {
              final gpsBloc = BlocProvider.of<GpsBloc>(context);
              gpsBloc.askGpsAccess();
            },
            text: 'Request Access'.toUpperCase(),
          )
        ],
      ),
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextThemeData.textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.gps_off_outlined,
            size: 180,
            color: Palette.primaryOpacityColor,
          ),
          Text(
            'You must enable GPS',
            style: textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
