import 'package:flutter/material.dart';
import 'package:tracker/contants/palette.dart';

class CustomElevatedBottom extends StatelessWidget {
  const CustomElevatedBottom(
      {required String text, required VoidCallback onPressed, super.key})
      : _text = text,
        _onPressed = onPressed;

  final String _text;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Palette.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 45),
      ),
      child: Text(
        _text,
        style: const TextStyle(
            color: Colors.white, fontFamily: 'RobotoMedium', fontSize: 18),
      ),
    );
  }
}
