import 'package:flutter/material.dart';
import 'package:pet_app/src/theme/color_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        primary: ColorTheme.primaryButton,
        padding: EdgeInsets.symmetric(horizontal: 20),
      ),
      onPressed: () => onPressed(),
      child: Text(text),
    );
  }
}
