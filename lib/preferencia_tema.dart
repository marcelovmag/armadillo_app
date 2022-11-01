import 'package:flutter/material.dart';

class PreferenciaTema {
  static String logo = 'assets/images/armadilloIndigo.png';
  static MaterialColor azul = Colors.indigo;

  static ValueNotifier<Brightness> tema = ValueNotifier(Brightness.dark);

  static setTema() {
    tema.value = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    attCores();
  }

  static attCores() {
    bool isDark = tema.value == Brightness.dark;

    if (isDark) {
      logo = 'assets/images/armadilloIndigo.png';
      azul = Colors.indigo;
    } else {
      logo = 'assets/images/armadillo.png';
      azul = Colors.blue;
    }
  }
}
