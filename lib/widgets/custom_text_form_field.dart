import 'package:flutter/material.dart';
import 'package:tracker/contants/palette.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {required TextEditingController controller,
      required IconData icon,
      required String label,
      required TextInputType textInputType,
      required String? Function(String?)? validated,
      bool? obscureText,
      super.key})
      : _controller = controller,
        _icon = icon,
        _label = label,
        _textInputType = textInputType,
        _obscureText = obscureText,
        _validated = validated;

  final TextEditingController _controller;
  final IconData _icon;
  final String _label;
  final TextInputType _textInputType;
  final bool? _obscureText;
  final String? Function(String?)? _validated;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: _textInputType,
      onFieldSubmitted: (value) {},
      validator: _validated,
      obscureText: _obscureText ?? false,
      cursorColor: Palette.segundaryColor,
      style:
          const TextStyle(color: Palette.segundaryColor, fontFamily: 'Roboto'),
      decoration: InputDecoration(
        prefixIconColor: Palette.primaryColor,
        label: Text(_label),
        labelStyle: const TextStyle(
            color: Palette.segundaryColor, fontFamily: 'RobotoMedium'),
        prefixIcon: Icon(
          _icon,
          size: 28,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 2, color: Palette.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(width: 3, color: Palette.focusColor),
        ),
      ),
    );
  }
}
