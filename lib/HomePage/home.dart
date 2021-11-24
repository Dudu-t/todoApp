import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Connectors/connector.dart';
import 'package:todoapp/HomePage/bottom_menu.dart';
import 'package:todoapp/HomePage/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Connector tarefas = Connector('tarefas');

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Text('ToDo App')],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return BottomMenu();
              });
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: tarefas.getStreamAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data?.docs;
              data = data?.reversed.toList();
              return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (BuildContext context1, int index) {
                  var tarefa = data?[index];

                  return (index == 0)
                      ? Container(
                          child: ToDo(tarefa: tarefa),
                          padding: EdgeInsets.only(top: 15),
                        )
                      : (index + 1 == data?.length)
                          ? Container(
                              child: ToDo(tarefa: tarefa),
                              padding: EdgeInsets.only(bottom: 35),
                            )
                          : ToDo(tarefa: tarefa);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

/*
,*/
