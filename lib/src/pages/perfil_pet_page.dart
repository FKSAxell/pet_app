import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/src/theme/color_theme.dart';

class PerfilPetPage extends StatelessWidget {
  const PerfilPetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    print(arguments);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Perfil Cosmo",
            style: GoogleFonts.poppins(
                color: ColorTheme.primary, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: ColorTheme.primary),
        ),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Hero(
              tag: arguments["key"],
              child: CircleAvatar(
                radius: 80,
                backgroundColor: ColorTheme.primary,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Cosmo",
              style: GoogleFonts.poppins(
                color: ColorTheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _DatosPet(
                          cantidad: "3",
                          mensaje: "años",
                          title: "Edad",
                        ),
                        _DatosPet(
                          cantidad: "25",
                          mensaje: "kg",
                          title: "Peso",
                        ),
                        _DatosPet(
                          mensaje: "M",
                          title: "Sexo",
                        ),
                      ],
                    ),
                    // ExpansionPanelList(
                    //   elevation: 0,
                    //   children: [
                    //     ExpansionPanel(
                    //       isExpanded: false,
                    //       headerBuilder: (context, isExpanded) => ListTile(
                    //         title: Text(
                    //           "Rabia",
                    //         ),
                    //       ),
                    //       body: Container(),
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class _DatosPet extends StatelessWidget {
  const _DatosPet({
    Key? key,
    this.cantidad,
    required this.mensaje,
    required this.title,
  }) : super(key: key);
  final String? cantidad;
  final String mensaje;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 90,
          decoration: BoxDecoration(
            color: ColorTheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (cantidad != null)
                  ? Text(
                      cantidad!,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : Container(),
              Text(
                mensaje,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: ColorTheme.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
