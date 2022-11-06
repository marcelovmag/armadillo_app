import 'package:armadillo_app/preferencia_tema.dart';
import 'package:flutter/material.dart';

bool isCamera = false;
String camera = 'LIGA';

class Servos {
  static double servoX = 0;
  static double servoY = 0;
}

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
          Column(
            children: [
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
          Column(
            children: [
              const Text("Câmera",
                  style: TextStyle(fontFamily: 'SpaceGrotesk')),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isCamera ? camera = 'DESLIGA' : camera = 'LIGA';
                      isCamera = !isCamera;
                    });
                  },
                  child: Text(camera,
                      style: const TextStyle(fontFamily: 'SpaceGrotesk'))),
              const SizedBox(
                height: 5,
              ),
              OutlinedButton(
                  onPressed: () {
                    if (isCamera) {
                      // tirar foto
                    }
                  },
                  child: const Text('TIRAR FOTO',
                      style: TextStyle(fontFamily: 'SpaceGrotesk'))),
            ],
          )
        ],
      ),
    );
  }
}
