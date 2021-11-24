import 'package:flutter/material.dart';
import 'package:todoapp/Connectors/connector.dart';

class ToDo extends StatefulWidget {
  ToDo({Key? key, required this.tarefa}) : super(key: key);
  final tarefa;
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  Connector tarefas = Connector('tarefas');

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    final tarefa = widget.tarefa;
    bool checked = tarefa['checked'];
    var _clicked;
    return Card(
        child: ListTile(
      contentPadding: EdgeInsets.only(top: 8, bottom: 8),
      onTap: () {
        Navigator.pushNamed(context, '/editTodo',
            arguments: {'documentID': tarefa.id});
      },
      trailing: PopupMenuButton(onSelected: (result) {
        if (result == 'delete') {
          tarefas.deleteDoc(tarefa.id);
        }
      }, itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          const PopupMenuItem(
              padding: EdgeInsets.only(top: 0, bottom: 0),
              child: ListTile(
                contentPadding:
                    EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 10),
                leading: Icon(Icons.delete),
                title: Text('Deletar'),
              ),
              value: 'delete')
        ];
      }),
      leading: Transform.scale(
        scale: 1.35,
        child: Checkbox(
            value: checked,
            shape: CircleBorder(),
            onChanged: (bool? value) {
              tarefas.updateDoc(id: tarefa.id, data: {'checked': value});
            },
            materialTapTargetSize: MaterialTapTargetSize.padded),
      ),
      title: Text(
        tarefa['name'],
        style: TextStyle(
            decoration: tarefa['checked']
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
    ));
  }
}
