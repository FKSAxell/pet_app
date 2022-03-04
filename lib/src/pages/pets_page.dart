import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/src/models/mascota_model.dart';
import 'package:pet_app/src/theme/color_theme.dart';
import 'package:pet_app/src/widgets/custom_divider.dart';

class PetsPage extends StatelessWidget {
  const PetsPage({
    Key? key,
    required this.mascotas,
  }) : super(key: key);
  final List<Mascota> mascotas;

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
                      children: mascotas
                          .map((mascota) => Column(
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.pushNamed(
                                      context,
                                      "/pet",
                                      arguments: {"mascota": mascota},
                                    ),
                                    child: Hero(
                                      tag: mascota.id,
                                      child: CircleAvatar(
                                        radius: 57,
                                        backgroundColor: ColorTheme.primary,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${mascota.nombre}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: ColorTheme.primary,
                                    ),
                                  ),
                                ],
                              ))
                          .toList()
                      // List.generate(
                      //   7,
                      //   (key) => Column(
                      //     children: [
                      //       InkWell(
                      //         onTap: () => Navigator.pushNamed(context, "/pet",
                      //             arguments: {"key": key}),
                      //         child: Hero(
                      //           tag: key,
                      //           child: CircleAvatar(
                      //             radius: 57,
                      //             backgroundColor: ColorTheme.primary,
                      //           ),
                      //         ),
                      //       ),
                      //       Text(
                      //         "Pet $key",
                      //         style: GoogleFonts.poppins(
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.w500,
                      //           color: ColorTheme.primary,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
