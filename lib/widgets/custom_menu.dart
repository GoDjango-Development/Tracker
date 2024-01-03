import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tracker/contants/image_string.dart';
import 'package:tracker/contants/palette.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Image.asset(
                    ImageString.logo,
                    height: 160,
                  ),
                  _space(),
                  const Divider(
                    color: Palette.focusColor,
                  ),
                  const MenuItem(
                      label: 'LogOut',
                      route: '/login',
                      icon: LineAwesomeIcons.alternate_sign_out)
                ],
              ),
            )
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
    return GestureDetector(
      onTap: () => Get.offAllNamed(route),
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
                            // color: Colors.white,
                            // fontWeight: FontWeight.bold,
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
}
