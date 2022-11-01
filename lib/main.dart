import 'package:armadillo_app/tela1.dart';
import 'package:armadillo_app/tela2.dart';
import 'package:armadillo_app/preferencia_tema.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  // seta Observer pra mudar tema
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    PreferenciaTema.setTema();
    super.initState();
  }

  // remove Observer pra mudar tema
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // muda o tema ao vivasso
  @override
  void didChangePlatformBrightness() {
    PreferenciaTema.setTema();
  }

  int id = 0; // id da pagina, pra trocar no bottom bar navigation
  TextEditingController txtUsuario =
      TextEditingController(); // controller da caixa de texto de usuario, no login
  TextEditingController txtSenha =
      TextEditingController(); // controller da caixa de texto de senha, no login
  bool login = false; // status de logado (ou não)

  @override
  build(context) {
    return ValueListenableBuilder(
      valueListenable: PreferenciaTema.tema,
      builder: (context, tema, _) => MaterialApp(
        title: 'Armadillo App',
        debugShowCheckedModeBanner: false, // desabilita tremzinho de debug
        theme: ThemeData(
          primarySwatch: PreferenciaTema.azul,
          brightness: tema,
        ),
        home: Scaffold(
          floatingActionButton:
              login // testa se está logado, pra só então exibir o botão de deslogar
                  ? FloatingActionButton(
                      backgroundColor: PreferenciaTema.azul,
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
                      : Text("Bem-vindo,  ${txtUsuario.text} - Tela 2"))
              : null,
          body:
              login // testa se está logado, pra exibir a tela de login, ou as telas principais
                  ? id == 0
                      ? Tela1()
                      : Tela2()
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
                              child: Image.asset(PreferenciaTema.logo),
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
                      selectedItemColor: PreferenciaTema.azul,
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.assessment_outlined),
                            label: "Monitoramento"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.radio_button_checked),
                            label: "Painel de Controle"),
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
      ),
    );
  }
}
