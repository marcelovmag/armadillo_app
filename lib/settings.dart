import 'package:armadillo_app/preferencia_tema.dart';

import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
        ListTile(
          leading: const Icon(Icons.bluetooth),
          title: const Text('Bluetooth'),
          onTap: () {
            setState(() {});
          },
        ),
        ListTile(
          leading: const Icon(Icons.miscellaneous_services),
          title: const Text('- - -'),
          onTap: () {
            setState(() {});
          },
        ),
      ],
    ));
  }
}
