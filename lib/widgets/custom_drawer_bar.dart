import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tracker/contants/palette.dart';
import '../utils/theme.dart';

class CustomDrawerBar extends StatelessWidget {
  const CustomDrawerBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextThemeData.textTheme;
    // Size size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Palette.transparent,
      title: Text(
        'Location'.toUpperCase(),
        style: textTheme.titleLarge,
      ),
      centerTitle: true,
      leading: InkWell(
        onTap: () => Scaffold.of(context).openDrawer(),
        child: Ink(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Palette.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            LineAwesomeIcons.bars,
            color: Palette.primaryColor, // Color azul
          ),
        ),
      ),
    );
  }
}
