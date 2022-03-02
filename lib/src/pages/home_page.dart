import 'package:flutter/material.dart';
import 'package:pet_app/src/modals/add_mascota_modal.dart';
import 'package:pet_app/src/models/mascota_model.dart';
import 'package:pet_app/src/pages/blank_page.dart';
import 'package:pet_app/src/pages/pets_page.dart';
import 'package:pet_app/src/theme/color_theme.dart';
import 'package:pet_app/src/utils/show_dialog.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final uuid = Uuid();
  int opcion = 1;
  PageController pageCtrl = PageController(initialPage: 1);
  late List<Mascota> mascotas;

  @override
  void initState() {
    super.initState();
    //TODO: CONSULTAR LAS MASCOTAS
    mascotas = [
      Mascota(
        id: Uuid().v1(),
        nombre: "Cosmo",
        fechaNacimiento: DateTime(2020, 2, 30),
        sexo: "M",
        peso: "20.2",
      ),
      Mascota(
        id: Uuid().v1(),
        nombre: "Wanda",
        fechaNacimiento: DateTime(2020, 2, 30),
        sexo: "M",
        peso: "20.2",
      ),
      Mascota(
        id: Uuid().v1(),
        nombre: "Lili",
        fechaNacimiento: DateTime(2020, 2, 30),
        sexo: "M",
        peso: "20.2",
      ),
    ];
  }

  void agregarMascota(Mascota mascota) {
    //TODO: POST MASCOTAS Y UPDATE LISTA MASCOTAS
    mascotas = [...mascotas, mascota];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Pet App",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: ColorTheme.primary),
        actions: [
          CircleAvatar(
            backgroundColor: ColorTheme.primary,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      drawer: Drawer(),
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: pageCtrl,
        onPageChanged: (int index) => setState(
          () {
            opcion = index;
          },
        ),
        children: [
          BlankPage(),
          PetsPage(mascotas: mascotas),
          BlankPage(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        opcion: opcion,
        onTap: (int index) => setState(
          () {
            opcion = index;
            pageCtrl.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          },
        ),
      ),
      floatingActionButton: (opcion == 1)
          ? FloatingActionButton(
              onPressed: () =>
                  customShowDialog(context, AddMascota(onAdd: agregarMascota)),
              child: Icon(Icons.add),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: ColorTheme.primary,
            )
          : null,
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
    required this.opcion,
    required this.onTap,
  }) : super(key: key);
  final int opcion;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      backgroundColor: ColorTheme.primary,
      currentIndex: opcion,
      iconSize: 30,
      selectedItemColor: ColorTheme.secondary,
      unselectedItemColor: Colors.white,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: "Lugares",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pets_outlined),
          label: "pets",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_city_outlined),
          label: "Centros",
        ),
      ],
    );
  }
}
