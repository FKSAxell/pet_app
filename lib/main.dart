import 'package:flutter/material.dart';
import 'package:pet_app/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet App',
      routes: appRoutes,
      initialRoute: "/home",
    );
  }
}
