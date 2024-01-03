import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tracker/contants/palette.dart';
import 'package:tracker/widgets/custom_menu.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.height * 0.5, vertical: size.width * 0.4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: Palette.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () => showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) => const CustomMenu()),
                  child: Ink(
                    height: size.height * 0.06,
                    width: size.width * 0.10,
                    decoration: BoxDecoration(
                      color: Palette.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Icon(
                        LineAwesomeIcons.bar_chart,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.5,
                child: Text(
                  'title'.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
