import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tracker/contants/palette.dart';
import 'package:tracker/widgets/custom_menu.dart';

import '../utils/theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    //Custom Text theme
    TextTheme textTheme = TextThemeData.textTheme;
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          top: size.height * 0.04,
          left: size.width * 0.05,
          right: size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: Palette.transparent,
                child: InkWell(
                  onTap: () => showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) => const CustomMenu(),
                  ),
                  borderRadius: BorderRadius.circular(8),
                  child: Ink(
                    height: size.height * 0.06,
                    width: size.width * 0.10,
                    decoration: BoxDecoration(
                      color: Palette.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Icon(
                        LineAwesomeIcons.bars,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.5,
                child: Text(
                  'Location'.toUpperCase(),
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
                width: size.width * 0.10,
              )
            ],
          )
        ],
      ),
    );
  }
}
