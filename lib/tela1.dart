import 'package:armadillo_app/preferencia_tema.dart';
import 'package:armadillo_app/atuadores.dart';
import 'package:flutter/material.dart';

class Tela1 extends StatelessWidget {
  String servox = ((Servos.servoX * 100).round() / 100).toString();
  String servoy = ((Servos.servoY * 100).round() / 100).toString();
  bool logs = false;

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
                "MONITORAMENTO",
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
                  const Text("Servo X: ",
                      style: TextStyle(fontFamily: 'SpaceGrotesk')),
                  Text(
                    servox,
                    style: const TextStyle(
                      backgroundColor: Colors.grey,
                      fontFamily: 'SpaceGrotesk',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Servo Y: ",
                      style: TextStyle(fontFamily: 'SpaceGrotesk')),
                  Text(
                    servoy,
                    style: const TextStyle(
                      backgroundColor: Colors.grey,
                      fontFamily: 'SpaceGrotesk',
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                direction: Axis.horizontal,
                spacing: 20.0,
                children: [
                  Column(
                    children: [
                      const Text("Alarme",
                          style: TextStyle(fontFamily: 'SpaceGrotesk')),
                      Icon(Icons.volume_up,
                          color: Servos.alarme
                              ? Colors.red
                              : PreferenciaTema.azul),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Portão",
                          style: TextStyle(fontFamily: 'SpaceGrotesk')),
                      Icon(Icons.door_front_door,
                          color: Servos.alarme
                              ? Colors.red
                              : PreferenciaTema.azul),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          /*
          Column(
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text("EXPANDIR LOGS",
                      style: TextStyle(fontFamily: 'SpaceGrotesk'))),
            ],
          ),
          */
        ],
      ),
    );
  }
}
