import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/src/modals/add_vacuna_modal.dart';
import 'package:pet_app/src/models/mascota_model.dart';
import 'package:pet_app/src/models/vacuna_model.dart';
import 'package:pet_app/src/theme/color_theme.dart';
import 'package:pet_app/src/utils/calculate.dart';
import 'package:pet_app/src/utils/show_dialog.dart';
import 'package:uuid/uuid.dart';

class PerfilPetPage extends StatefulWidget {
  const PerfilPetPage({Key? key}) : super(key: key);

  @override
  State<PerfilPetPage> createState() => _PerfilPetPageState();
}

class _PerfilPetPageState extends State<PerfilPetPage> {
  void agregarVacuna(Vacuna vacuna, Mascota mascota) {
    //TODO: POST VACUNA
    mascota.vacuna = [...mascota.vacuna ?? [], vacuna];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final Mascota mascota = arguments["mascota"];
    final List<Vacuna> vacunas = mascota.vacuna ?? [];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Perfil ${mascota.nombre}",
            style: GoogleFonts.poppins(
                color: ColorTheme.primary, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: ColorTheme.primary),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => customShowDialog(
              context, AddVacuna(mascota: mascota, onAdd: agregarVacuna)),
          child: Icon(Icons.add),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: ColorTheme.primary,
        ),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Hero(
              tag: mascota.id,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: ColorTheme.primary,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              mascota.nombre,
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
                          cantidad: "${calculateAge(mascota.fechaNacimiento)}",
                          mensaje: "años",
                          title: "Edad",
                        ),
                        _DatosPet(
                          cantidad: mascota.peso,
                          mensaje: "kg",
                          title: "Peso",
                        ),
                        _DatosPet(
                          mensaje: mascota.sexo,
                          title: "Sexo",
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          physics: BouncingScrollPhysics(),
                          children: vacunas
                              .map(
                                (e) => ExpansionTile(
                                  title: Text(e.nombre),
                                  subtitle: Text(
                                      "${e.fecha.day}/${e.fecha.month}/${e.fecha.year}"),
                                  leading: Icon(FontAwesomeIcons.bacteria),
                                  iconColor: ColorTheme.primary,
                                  textColor: ColorTheme.primary,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 70),
                                      child: Text(e.descripcion),
                                    )
                                  ],
                                ),
                              )
                              .toList()),
                    )
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
