import 'package:flutter/material.dart';

import '../contants/palette.dart';

class CustomAlertDialog extends StatelessWidget {
  final String mensaje;
  final GestureTapCallback onTap;

  const CustomAlertDialog(
      {required this.mensaje, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Icon(
        Icons.warning_rounded,
        color: Colors.orange,
        size: 60,
      ),
      content: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
          child: Text(
            mensaje,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 14),
          )),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor: MaterialStateProperty.all(Palette.primaryColor),
          ),
          child: const Text(
            'CANCEL',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor: MaterialStateProperty.all(Palette.successColor),
          ),
          onPressed: onTap,
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  static void showActions(
      BuildContext context, String mensaje, GestureTapCallback onTap) {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(mensaje: mensaje, onTap: onTap),
    );
  }
}
