import 'package:armadillo_app/preferencia_tema.dart';
import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  @override
  build(context) {
    return Column(
      children: [
        const Text("Texto 1 da tela 2"),
        const Text("Texto 2 da tela 2"),
        const Text("Texto 3 da tela 2"),
        Container(height: 40, width: 120, color: Colors.green),
      ],
    );
  }
}
