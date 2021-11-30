import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Connectors/connector.dart';

class BottomMenu extends StatefulWidget {
  BottomMenu({Key? key}) : super(key: key);

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  Connector tarefas = Connector('tarefas');
  late TextEditingController _controller = TextEditingController();
  var _newTodo = '';
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 8),
        child: Wrap(
          children: [
            Container(
                padding: EdgeInsets.only(top: 10, left: 0),
                child: ListTile(
                    leading: Transform.scale(
                        scale: 1.35,
                        child: Checkbox(
                            onChanged: null,
                            value: false,
                            shape: CircleBorder())),
                    title: TextField(
                      controller: _controller,
                      onChanged: (String value) {
                        setState(() {
                          _newTodo = value;
                        });
                      },
                      autofocus: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Adicionar uma tarefa'),
                      obscureText: false,
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.file_upload_outlined),
                        onPressed: (_newTodo.isNotEmpty)
                            ? () {
                                tarefas.addDoc({
                                  'name': _newTodo,
                                  'checked': false,
                                  'uid': FirebaseAuth.instance.currentUser!.uid,
                                }).then((value) => Navigator.pop(context));
                              }
                            : null)))
          ],
        ));
  }
}
