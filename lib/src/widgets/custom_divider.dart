import 'package:flutter/material.dart';
import 'package:pet_app/src/theme/color_theme.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 64,
      color: ColorTheme.primary,
    );
  }
}
