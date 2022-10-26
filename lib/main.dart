import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int id = 0; // id da pagina, pra trocar no bottom bar navigation
  TextEditingController txtUsuario =
      TextEditingController(); // controller da caixa de texto de usuario, no login
  TextEditingController txtSenha =
      TextEditingController(); // controller da caixa de texto de senha, no login
  bool login = false; // status de logado (ou não)
  bool dark = true;

  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // desabilita tremzinho de debug
      theme: ThemeData(
          primarySwatch: dark ? Colors.indigo : Colors.blue,
          brightness: dark
              ? Brightness.dark
              : Brightness.light), // seta dark/light mode
      home: Scaffold(
        floatingActionButton:
            login // testa se está logado, pra só então exibir o botão de deslogar
                ? FloatingActionButton(
                    backgroundColor: dark ? Colors.indigo : Colors.blue,
                    onPressed: () {
                      setState(() {
                        login = false;
                      });
                    },
                    child: const Text("Logout"))
                : null,
        appBar: login // testa se está logado, pra só então exibir a AppBar
            ? AppBar(
                title: id == 0
                    ? Text("Bem-vindo,  ${txtUsuario.text} - Tela 1")
                    : id == 1
                        ? Text("Bem-vindo,  ${txtUsuario.text} - Tela 2")
                        : Text("Bem-vindo,  ${txtUsuario.text} - Tela 3"),
              )
            : null,
        body:
            login // testa se está logado, pra exibir a tela de login, ou as telas principais
                ? id == 0
                    ? Tela1()
                    : id == 1
                        ? Tela2()
                        : Tela3()
                : Center(
                    // tela de login
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Flexible(
                            flex: 12,
                            child: Text(
                              "ARMADILLO",
                              style: TextStyle(
                                  fontSize: 48.00,
                                  fontFamily: 'BarlowCondensed'),
                            ),
                          ),
                          Flexible(
                            flex: 10,
                            child: dark
                                ? Image.asset(
                                    'assets/images/armadilloIndigo.png')
                                : Image.asset('assets/images/armadillo.png'),
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          const Flexible(flex: 10, child: Text("Faça Login")),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                120.0, 30.0, 120.0, 15.0),
                            child: TextField(
                                controller: txtUsuario,
                                decoration: const InputDecoration(
                                  label: Text("Usuário"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                120.0, 30.0, 120.0, 15.0),
                            child: TextField(
                                controller: txtSenha,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  label: Text("Senha"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                )),
                          ),
                          SizedBox(
                            height: 35.0,
                            width: 90.0,
                            child: ElevatedButton(
                                child: const Text("Login"),
                                // testa os logins aceitos
                                onPressed: () {
                                  if (txtUsuario.text == "marcelo") {
                                    if (txtSenha.text == "123") {
                                      setState(() {
                                        login = true;
                                      });
                                    }
                                  } else if (txtUsuario.text == "admin") {
                                    if (txtSenha.text == "admin") {
                                      setState(() {
                                        login = true;
                                      });
                                    }
                                  }
                                }),
                          ),
                        ]),
                  ),
        bottomNavigationBar:
            login // testa se está logado, pra só então exibir a bottomNavigationBar
                ? BottomNavigationBar(
                    selectedItemColor: dark ? Colors.indigo : Colors.blue,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.cable), label: "Tela1"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.umbrella), label: "Tela2"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.star), label: "Tela3"),
                    ],
                    currentIndex: id, // usa da var id como index
                    // muda o id de acordo com o selecionado no app
                    onTap: (i) {
                      setState(() {
                        id = i;
                      });
                    },
                  )
                : null,
      ),
    );
  }
}

class Tela1 extends StatelessWidget {
  @override
  build(context) {
    return Center(
      child: Column(
        children: [
          const Text("Texto 1 da tela 1"),
          const Text("Texto 2 da tela 1"),
          const Text("Texto 3 da tela 1"),
          Container(height: 40, width: 120, color: Colors.black),
        ],
      ),
    );
  }
}

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

class Tela3 extends StatelessWidget {
  @override
  build(context) {
    return Column(
      children: [
        const Text("Texto 1 da tela 3"),
        const Text("Texto 2 da tela 3"),
        const Text("Texto 3 da tela 3"),
        Container(height: 40, width: 120, color: Colors.cyan),
      ],
    );
  }
}
