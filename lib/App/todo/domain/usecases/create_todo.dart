import 'package:dartz/dartz.dart';
import 'package:todoapp/App/todo/domain/entities/todo.dart';
import 'package:todoapp/App/todo/domain/errors/errors.dart';
import 'package:todoapp/App/todo/domain/repositories/todo_repository.dart';

abstract class CreateToDo {
  Future<Either<FailureToDoCreate, String>> call(ToDo todo);
}

class CreateToDoImpl implements CreateToDo {
  final ToDoRepository repository;

  CreateToDoImpl(this.repository);
  @override
  Future<Either<FailureToDoCreate, String>> call(ToDo todo) async {
    var result = await repository.create(todo);
    return result.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    });
  }
}
