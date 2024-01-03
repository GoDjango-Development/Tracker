import 'package:flutter/material.dart';
import 'package:tracker/contants/image_string.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(right: size.width * 0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _space(),
                Image.asset(ImageString.logo),
                _space(),
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox _space() {
    return const SizedBox(
      height: 10,
    );
  }
}
