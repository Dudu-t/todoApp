import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Connectors/auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Auth auth = Auth();
  late TextEditingController _email;
  late TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController(text: 'carloslage.dev@gmail.com');
    _password = TextEditingController(text: '25052003');
    super.initState();
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
                            'Log-in',
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
                                bottom: 0, top: 15, left: 15, right: 15),
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
                              top: 15,
                              left: 15,
                              right: 15,
                            ),
                          ),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(15),
                          child: ElevatedButton(
                            child: Text('Entrar'),
                            onPressed: () {
                              auth.login(
                                  email: _email.value.text,
                                  password: _password.value.text);
                            },
                          ),
                        )),
                      ]),
                    ],
                  ),
                ),
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width * 0.15),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      )),
    );
  }
}
