import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dentista',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xffEBF1F4),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff00B4CC),
        ),
      ),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      debugShowCheckedModeBanner: false,
    );
  }
}
