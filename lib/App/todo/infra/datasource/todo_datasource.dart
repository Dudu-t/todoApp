import 'package:todoapp/App/todo/domain/entities/todo.dart';
import 'package:todoapp/App/todo/infra/models/todo_model.dart';

abstract class ToDoDatasource {
  Future<String> create(ToDo createTodo);
}
