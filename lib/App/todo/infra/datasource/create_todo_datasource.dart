import 'package:todoapp/App/todo/domain/entities/todo.dart';

abstract class CreateToDoDatasource {
  Future<String> create(ToDo createTodo);
}
