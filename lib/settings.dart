import 'package:armadillo_app/preferencia_tema.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  build(context) {
    return Center(
        child: Column(
      children: [
        const Text(
          "ARMADILLO",
          style: TextStyle(fontSize: 48.00, fontFamily: 'BarlowCondensed'),
        ),
        const Text(
          "CONFIGURAÇÕES",
          style: TextStyle(fontSize: 22.00, fontFamily: 'BarlowCondensed'),
        ),
        Image.asset(
          PreferenciaTema.logo,
          width: 200,
        ),
      ],
    ));
  }
}
