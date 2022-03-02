import 'package:flutter/material.dart';
import 'package:pet_app/src/theme/color_theme.dart';

class CustomInput extends StatelessWidget {
  final String hint;
  final String label;
  final bool enabled;
  final Function onChanged;
  final TextInputType? keyboardType;

  const CustomInput({
    Key? key,
    required this.hint,
    required this.label,
    this.enabled = true,
    required this.onChanged,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            offset: Offset(0, 0),
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
      child: TextField(
        keyboardType: keyboardType,
        enabled: enabled,
        decoration: _customInputDecoration(),
        onChanged: (value) => onChanged(value),
      ),
    );
  }

  InputDecoration _customInputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorTheme.primary,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
      hintText: hint,
      labelText: label,
      hintStyle: TextStyle(color: Colors.grey),
      labelStyle: TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
    );
  }
}
