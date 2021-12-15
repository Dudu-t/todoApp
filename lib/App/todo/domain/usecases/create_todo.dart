import 'package:dartz/dartz.dart';
import 'package:todoapp/App/todo/domain/entities/todo.dart';
import 'package:todoapp/App/todo/domain/errors/errors.dart';
import 'package:todoapp/App/todo/domain/repositories/create_todo_repository.dart';

abstract class CreateToDo {
  Future<Either<FailureToDoCreate, String>> call(ToDo todo);
}

class CreateToDoImpl implements CreateToDo {
  final CreateToDoRepository repository;

  CreateToDoImpl(this.repository);
  @override
  Future<Either<FailureToDoCreate, String>> call(ToDo todo) async {
    return await repository.create(todo);
  }
}
