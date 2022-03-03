import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/src/widgets/custom_divider.dart';

class LugaresPage extends StatelessWidget {
  const LugaresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Lugares",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          CustomDivider(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
