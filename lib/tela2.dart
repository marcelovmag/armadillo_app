import 'package:armadillo_app/preferencia_tema.dart';
import 'package:armadillo_app/atuadores.dart';
import 'package:flutter/material.dart';

bool isManual = false;

class Tela2 extends StatefulWidget {
  @override
  State<Tela2> createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  @override
  build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          SizedBox(
            height: 180,
            child: Column(
              children: [
                const Text(
                  "Modo de Controle Manual",
                  style: TextStyle(fontSize: 14.00, fontFamily: 'SpaceGrotesk'),
                ),
                Switch(
                  value: isManual,
                  onChanged: (manual) {
                    setState(() {
                      isManual = manual;
                    });
                  },
                ),
                if (isManual)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Servo X: ",
                          style: TextStyle(fontFamily: 'SpaceGrotesk')),
                      Slider(
                          value: Servos.servoX,
                          min: 0.00,
                          max: 100.00,
                          divisions: 10000,
                          onChanged: (value) {
                            setState(() {
                              Servos.servoX = value;
                            });
                          }),
                      Text(((Servos.servoX * 100).round() / 100).toString()),
                    ],
                  ),
                if (isManual)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Servo Y: ",
                          style: TextStyle(fontFamily: 'SpaceGrotesk')),
                      Slider(
                          value: Servos.servoY,
                          min: 0.00,
                          max: 100.00,
                          divisions: 10000,
                          onChanged: (value) {
                            setState(() {
                              Servos.servoY = value;
                            });
                          }),
                      Text(((Servos.servoY * 100).round() / 100).toString()),
                    ],
                  ),
              ],
            ),
          ),
          if (true)
            Wrap(
              direction: Axis.horizontal,
              spacing: 20.0,
              children: [
                Column(
                  children: [
                    const Text("Alarme",
                        style: TextStyle(fontFamily: 'SpaceGrotesk')),
                    Switch(
                      value: Servos.alarme,
                      onChanged: (alarme) {
                        setState(() {
                          Servos.alarme = alarme;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
