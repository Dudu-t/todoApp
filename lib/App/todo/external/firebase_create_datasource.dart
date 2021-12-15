import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/App/todo/domain/entities/todo.dart';
import 'package:todoapp/App/todo/infra/datasource/create_todo_datasource.dart';
import 'package:todoapp/App/todo/infra/models/todo_model.dart';

class FirebaseCreateDatasource implements CreateToDoDatasource {
  @override
  Future<String> create(ToDo createTodo) async {
    ToDoModel todo = createTodo as ToDoModel;
    var todo2 = todo.toMap();
    try {
      var instance = FirebaseFirestore.instance.collection('tarefas');
      var col = await instance.add(todo2);
      return col.id;
    } catch (e) {
      throw Exception(e);
    }
  }
}
