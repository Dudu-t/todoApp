import 'package:flutter/material.dart';

class EditTodoPage extends StatefulWidget {
  EditTodoPage({Key? key}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments;
    arguments = arguments as Map<String, dynamic>;

    return Scaffold(
        appBar: AppBar(
          title: Text('ToDo App'),
        ),
        body: Container(
          child: Center(
            child: Text('Document ID: ${arguments['documentID']}'),
          ),
        ));
  }
}
