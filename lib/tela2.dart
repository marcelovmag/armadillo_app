import 'package:armadillo_app/preferencia_tema.dart';
import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  @override
  build(context) {
    return Center(
      child: Column(
        children: [
          Column(
            children: [
              const Text(
                "ARMADILLO",
                style:
                    TextStyle(fontSize: 48.00, fontFamily: 'BarlowCondensed'),
              ),
              const Text(
                "PAINEL DE CONTROLE",
                style:
                    TextStyle(fontSize: 22.00, fontFamily: 'BarlowCondensed'),
              ),
              Image.asset(
                PreferenciaTema.logo,
                width: 200,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("SERVO X: "),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("SERVO Y: "),
                ],
              ),
              const Text("CÂMERA"),
            ],
          ),
        ],
      ),
    );
  }
}
