import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:social_share/social_share.dart';
import 'package:tracker/contants/image_string.dart';
import 'package:tracker/contants/palette.dart';
import 'package:tracker/features/views/map/map_helper.dart';

import '../utils/theme.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    //Custom Text theme
    TextTheme textTheme = TextThemeData.textTheme;
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(right: size.width * 0.3),
      child: ColoredBox(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _space(),
                  Text(
                    'Tracker'.toUpperCase(),
                    style: textTheme.displayLarge,
                  ),
                  _space(),
                  _logo(textTheme),
                  _space(),
                  const Divider(
                    color: Palette.focusColor,
                  ),
                  _space(),
                  const MenuItem(
                      label: 'Share Position',
                      route: 'share',
                      icon: LineAwesomeIcons.share),
                  _space(),
                  const MenuItem(
                      label: 'Logout',
                      route: '/login',
                      icon: LineAwesomeIcons.alternate_sign_out),
                  _space(),
                ],
              ),
            ),
            Image.asset(
              ImageString.logoDjango,
              width: 50,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _space() {
    return const SizedBox(
      height: 10,
    );
  }

  Widget _logo(TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            ImageString.logo,
            width: 140,
            height: 160,
          ),
          Text(
            'Powered by TFProtocol',
            style: textTheme.displaySmall,
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String label;
  final String route;
  final IconData icon;
  const MenuItem(
      {super.key,
      required this.label,
      required this.route,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    MapHelper mapHelper = MapHelper();
    return GestureDetector(
      onTap: () {
        route != 'share' ? Get.offAllNamed(route) : _shareData(mapHelper);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              height: 30.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                      child: Icon(
                        icon,
                        color: Palette.primaryColor,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        label,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Palette.segundaryColor,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 25),
          //   child: Divider(
          //     color: Palette.primaryColor,
          //     thickness: 2,
          //   ),
          // )
        ],
      ),
    );
  }

  _shareData(MapHelper mapHelper) async {
    final position = await mapHelper.setInitialPosition();
    double latitud = position.latitude;
    double longitud = position.longitude;
    SocialShare.shareWhatsapp('Position lat: $latitud, long: $longitud');
    Get.back();
  }
}
