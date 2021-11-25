import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Connectors/connector.dart';

class EditTodoPage extends StatefulWidget {
  EditTodoPage({Key? key}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  late TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Connector tarefas = Connector('tarefas');
    var arguments = ModalRoute.of(context)?.settings.arguments;
    arguments = arguments as Map<String, dynamic>;
    var documentID = arguments['documentID'];
    late var tarefaName = '';
    var nameTodo = '';

    return Scaffold(
        appBar: AppBar(
          title: Text('Editar'),
        ),
        body: Center(
            child: FutureBuilder<DocumentSnapshot>(
                future: tarefas.getData(documentID),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data;
                    _controller.text = data?['name'];

                    return SingleChildScrollView(
                        child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: TextField(
                                  controller: _controller,
                                  onChanged: (value) {
                                    nameTodo = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      tarefas.updateDoc(id: documentID, data: {
                                        'name': nameTodo
                                      }).then((value) =>
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Editado com sucesso'))));
                                    },
                                    child: Text('Salvar'),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ));
                  }
                  return CircularProgressIndicator();
                })));
  }
}
