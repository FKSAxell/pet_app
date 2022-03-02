import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/src/theme/color_theme.dart';
import 'package:pet_app/src/widgets/custom_divider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({Key? key}) : super(key: key);

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
          ExpansionTile(
            title: Text("Veterinaria ABC"),
            subtitle: Text("12:00 -18:00"),
            leading: Container(
              decoration: BoxDecoration(
                color: ColorTheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 40,
              height: 40,
            ),
            children: [
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: ColorTheme.primary,
                      size: 40,
                    ),
                    VerticalDivider(
                      thickness: 2,
                    ),
                    Icon(
                      Icons.phone,
                      color: ColorTheme.primary,
                      size: 40,
                    ),
                    VerticalDivider(
                      thickness: 2,
                    ),
                    FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: ColorTheme.primary,
                      size: 40,
                    )
                  ],
                ),
              )
            ],
          ),
          ExpansionTile(
            title: Text("Veterinaria ABC"),
            subtitle: Text("12:00 -18:00"),
            leading: Container(
              decoration: BoxDecoration(
                color: ColorTheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 40,
              height: 40,
            ),
            children: [
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: ColorTheme.primary,
                      size: 40,
                    ),
                    VerticalDivider(
                      thickness: 2,
                    ),
                    Icon(
                      Icons.phone,
                      color: ColorTheme.primary,
                      size: 40,
                    ),
                    VerticalDivider(
                      thickness: 2,
                    ),
                    FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: ColorTheme.primary,
                      size: 40,
                    )
                  ],
                ),
              )
            ],
          ),
          ExpansionTile(
            title: Text("Veterinaria ABC"),
            subtitle: Text("12:00 -18:00"),
            leading: Container(
              decoration: BoxDecoration(
                color: ColorTheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 40,
              height: 40,
            ),
            children: [
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: ColorTheme.primary,
                      size: 40,
                    ),
                    VerticalDivider(
                      thickness: 2,
                    ),
                    Icon(
                      Icons.phone,
                      color: ColorTheme.primary,
                      size: 40,
                    ),
                    VerticalDivider(
                      thickness: 2,
                    ),
                    FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: ColorTheme.primary,
                      size: 40,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
