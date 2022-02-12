import 'package:flutter/material.dart';
import 'package:pet_app/src/pages/blank_page.dart';
import 'package:pet_app/src/pages/pets_page.dart';
import 'package:pet_app/src/theme/color_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int opcion = 1;
  PageController pageCtrl = PageController(initialPage: 1);

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
        controller: pageCtrl,
        onPageChanged: (int index) => setState(
          () {
            opcion = index;
          },
        ),
        children: [
          BlankPage(),
          PetsPage(),
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
              onPressed: () {},
              child: Icon(Icons.add),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: ColorTheme.primary,
            )
          : Container(),
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
