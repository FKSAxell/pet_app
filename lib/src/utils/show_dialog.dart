import 'package:flutter/material.dart';

Future<dynamic> customShowDialog(
  BuildContext context,
  Widget child,
) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    barrierColor: Color(0xff7F7F7F).withOpacity(0.48),
    builder: (BuildContext context) => child,
  );
}
