import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Connectors/auth.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Auth auth = Auth();
  late TextEditingController _email;
  late TextEditingController _password;
  late String invalidUser;
  @override
  void initState() {
    _email = TextEditingController(text: 'carloslage.dev@gmail.com');
    _password = TextEditingController(text: '25052003');
    invalidUser = '';
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.deepPurple,
      body: Center(
          child: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              child: SizedBox(
                child: Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Row(
                        children: [Icon(Icons.account_box, size: 64)],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Row(
                        children: [
                          Text(
                            'Registro',
                            style: Theme.of(context).textTheme.headline5,
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Row(children: [
                        Flexible(
                          child: Container(
                            child: TextField(
                              controller: _email,
                              decoration: InputDecoration(
                                  labelText: 'E-mail',
                                  border: OutlineInputBorder()),
                            ),
                            padding: EdgeInsets.only(
                                bottom: 0, top: 16, left: 16, right: 16),
                          ),
                        )
                      ]),
                      Row(children: [
                        Flexible(
                          child: Container(
                            child: TextField(
                              controller: _password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Senha',
                                  border: OutlineInputBorder()),
                            ),
                            padding: EdgeInsets.only(
                              bottom: 0,
                              top: 16,
                              left: 16,
                              right: 16,
                            ),
                          ),
                        )
                      ]),
                      invalidUser.length == 0
                          ? Row()
                          : Row(children: [
                              Container(
                                  padding: EdgeInsets.only(
                                      top: 8, left: 19, right: 16, bottom: 0),
                                  child: Text(invalidUser,
                                      style: TextStyle(color: Colors.red)))
                            ]),
                      Row(children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(
                              top: 8, left: 16, right: 16, bottom: 0),
                          child: ElevatedButton(
                            child: Text('Registrar'),
                            onPressed: () {
                              auth
                                  .register(
                                      email: _email.value.text,
                                      password: _password.value.text)
                                  .then((value) => Navigator.of(context).pop())
                                  .catchError((e) {
                                setState(() {
                                  if (e.toString() ==
                                      'Exception: weak-password') {
                                    invalidUser = 'Senha muito fraca.';
                                  } else if (e.toString() ==
                                      'Exception: email-already-in-use') {
                                    invalidUser =
                                        'Este e-mail já está sendo utilizado.';
                                  } else {
                                    invalidUser =
                                        'Não foi possível registrar essa conta.';
                                  }
                                });
                              });
                            },
                          ),
                        )),
                      ]),
                      Row(children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(
                              top: 0, left: 16, right: 16, bottom: 16),
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.grey),
                            child: Text('Voltar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )),
                      ]),
                    ],
                  ),
                ),
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width * 0.16),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      )),
    );
  }
}
