import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/src/theme/color_theme.dart';
import 'package:pet_app/src/widgets/custom_divider.dart';

class PetsPage extends StatelessWidget {
  const PetsPage({Key? key}) : super(key: key);

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
            "Mascotas",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          CustomDivider(),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Wrap(
                    runSpacing: 30,
                    spacing: 40,
                    alignment: WrapAlignment.center,
                    children: List.generate(
                      7,
                      (index) => Column(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pushNamed(context, "/pet"),
                            child: CircleAvatar(
                              radius: 57,
                              backgroundColor: ColorTheme.primary,
                            ),
                          ),
                          Text(
                            "Pet $index",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ColorTheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
