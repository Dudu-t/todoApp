import 'package:flutter/material.dart';
import 'package:todoapp/App/todo/domain/usecases/delete_todo.dart';
import 'package:todoapp/App/todo/external/firebase_delete_datasource.dart';
import 'package:todoapp/App/todo/infra/datasource/delete_todo_datasource.dart';
import 'package:todoapp/App/todo/infra/repositories/delete_todo_repository_impl.dart';
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
  late String invalidUser;
  @override
  void ab() async {
    var delete =
        DeleteTodoImpl(DeleteToDoRepositoryImpl(FirebaseDeleteDatasource()));
    delete('4BXMQ07Y173Y7cKX8cp3');
  }

  void initState() {
    _email = TextEditingController(text: 'carloslage.dev@gmail.com');
    _password = TextEditingController(text: '25052003');
    invalidUser = '';
    super.initState();
    ab();
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
                            child: Text('Entrar'),
                            onPressed: () {
                              auth
                                  .login(
                                      email: _email.text,
                                      password: _password.text)
                                  .catchError((e) {
                                setState(() {
                                  invalidUser = 'Usuário ou senha inválidos';
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
                            child: Text('Registrar-se'),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/register');
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
