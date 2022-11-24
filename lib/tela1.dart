import 'package:armadillo_app/preferencia_tema.dart';
import 'package:flutter/material.dart';
import 'atuadores.dart';

class Tela1 extends StatelessWidget {
  String servox = ((Servos.servoX * 100).round() / 100).toString();
  String servoy = ((Servos.servoY * 100).round() / 100).toString();
  Color onoff = PreferenciaTema.azul;
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
              const Text("Câmera",
                  style: TextStyle(fontFamily: 'SpaceGrotesk')),
              Icon(Icons.camera_alt, color: onoff),
              const SizedBox(
                height: 20,
              ),
              const Text("Última imagem",
                  style: TextStyle(fontFamily: 'SpaceGrotesk')),
              Container(height: 270, width: 480, color: Colors.grey),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          Column(
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text("EXPANDIR LOGS",
                      style: TextStyle(fontFamily: 'SpaceGrotesk'))),
            ],
          ),
        ],
      ),
    );
  }
}
