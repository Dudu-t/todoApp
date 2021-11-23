import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Connectors/connector.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Connector tarefas = Connector('tarefas');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: tarefas.getStreamAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data?.docs;

              return Container(
                  child: ListView.builder(
                itemCount: data!.length,
                itemBuilder: (BuildContext context1, int index) {
                  var tarefa = data[index];
                  bool checked = tarefa['checked'];

                  return Card(
                      child: ListTile(
                    leading: Checkbox(
                      value: checked,
                      onChanged: (bool? value) {
                        setState(() {
                          tarefas.updateDoc(
                              id: tarefa.id, data: {'checked': value});
                        });
                      },
                    ),
                    title: Text(tarefa['name']),
                  ));
                },
              ));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

/*
,*/
