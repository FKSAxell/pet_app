import 'package:flutter/material.dart';
import 'package:pet_app/src/pages/home_page.dart';
import 'package:pet_app/src/pages/perfil_pet_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/home': (_) => HomePage(),
  '/pet': (_) => PerfilPetPage()
};
