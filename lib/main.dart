import 'package:armadillo_app/tela1.dart';
import 'package:armadillo_app/tela2.dart';
import 'package:armadillo_app/settings.dart';
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
  bool settings = false;

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
          appBar: login // testa se está logado, pra só então exibir a AppBar
              ? AppBar(
                  title: settings
                      ? const Text("Configurações")
                      : id == 0
                          ? Text("Bem-vindo,  ${txtUsuario.text} - Tela 1")
                          : Text("Bem-vindo,  ${txtUsuario.text} - Tela 2"),
                  actions: [
                    PopupMenuButton(
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                  child: ListTile(
                                leading: const Icon(Icons.logout),
                                title: const Text('Logout'),
                                onTap: () {
                                  setState(() {
                                    login = false;
                                    txtUsuario.text = '';
                                    txtSenha.text = '';
                                    id = 0;
                                    settings = false;
                                  });
                                },
                              )),
                              PopupMenuItem(
                                  child: ListTile(
                                leading: settings
                                    ? const Icon(Icons.arrow_back_rounded)
                                    : const Icon(Icons.settings),
                                title: settings
                                    ? const Text('Voltar')
                                    : const Text('Configurações'),
                                onTap: () {
                                  setState(() {
                                    settings = !settings;
                                  });
                                },
                              )),
                              PopupMenuItem(
                                  child: ListTile(
                                leading: const Icon(Icons.info),
                                title: const Text('Info'),
                                onTap: () {},
                              ))
                            ])
                  ],
                )
              : null,
          body:
              login // testa se está logado, pra exibir a tela de login, ou as telas principais
                  ? settings
                      ? Settings()
                      : id == 0
                          ? Tela1()
                          : Tela2()
                  : Center(
                      // tela de login
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Flexible(
                              flex: 24,
                              child: Text(
                                "ARMADILLO",
                                style: TextStyle(
                                    fontSize: 48.00,
                                    fontFamily: 'BarlowCondensed'),
                              ),
                            ),
                            Flexible(
                              flex: 20,
                              child: Image.asset(PreferenciaTema.logo),
                            ),
                            const Spacer(
                              flex: 6,
                            ),
                            const Flexible(
                                flex: 10,
                                child: Text(
                                  "Faça Login",
                                  style: TextStyle(),
                                )),
                            const Spacer(),
                            Row(
                              children: [
                                const Spacer(),
                                Flexible(
                                  flex: 4,
                                  child: TextField(
                                      controller: txtUsuario,
                                      decoration: const InputDecoration(
                                        label: Text("Usuário"),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0))),
                                      )),
                                ),
                                const Spacer(),
                              ],
                            ),
                            const Spacer(flex: 1),
                            Row(
                              children: [
                                const Spacer(),
                                Flexible(
                                  flex: 4,
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
                                const Spacer(),
                              ],
                            ),
                            const Spacer(),
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
                  ? !settings
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
                      : null
                  : null,
        ),
      ),
    );
  }
}
