import 'package:armadillo_app/preferencia_tema.dart';
import 'package:flutter/material.dart';

class Tela1 extends StatelessWidget {
  String servox = 'desconectado';
  String servoy = 'desconectado';
  IconData onoff = Icons.camera;

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
                  const Text("SERVO X: "),
                  Text(
                    servox,
                    style: const TextStyle(
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("SERVO Y: "),
                  Text(
                    servoy,
                    style: const TextStyle(
                      backgroundColor: Colors.grey,
                    ),
                  )
                ],
              ),
              const Text("CÂMERA"),
              Icon(onoff),
              const Text("ULTIMA IMAGEM"),
              Container(height: 270, width: 480, color: Colors.grey),
            ],
          ),
          Column(
            children: [
              TextButton(onPressed: () {}, child: const Text("EXPANDIR LOGS"))
            ],
          ),
        ],
      ),
    );
  }
}
