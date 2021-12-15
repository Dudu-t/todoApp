import 'package:dartz/dartz.dart';
import 'package:todoapp/App/todo/domain/errors/errors.dart';
import 'package:todoapp/App/todo/domain/repositories/delete_todo_repository.dart';

abstract class DeleteToDo {
  Future<Either<FailureToDoDelete, void>> call(String documentId);
}

class DeleteTodoImpl implements DeleteToDo {
  final DeleteToDoRepository repository;

  DeleteTodoImpl(this.repository);
  @override
  Future<Either<FailureToDoDelete, void>> call(String documentId) async {
    return await repository.delete(documentId);
  }
}
