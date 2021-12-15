import 'package:todoapp/App/todo/domain/entities/todo.dart';
import 'package:todoapp/App/todo/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:todoapp/App/todo/domain/repositories/create_todo_repository.dart';
import 'package:todoapp/App/todo/infra/datasource/create_todo_datasource.dart';
import 'package:todoapp/App/todo/infra/models/todo_model.dart';

class CreateToDoRepositoryImpl implements CreateToDoRepository {
  final CreateToDoDatasource datasource;

  CreateToDoRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureToDoCreate, String>> create(ToDo todo) async {
    try {
      var result = await datasource.create(todo);
      return right(result);
    } on FailureToDoCreate catch (_, e) {
      return left(FailureToDoCreate());
    } catch (e) {
      return left(FailureToDoCreate());
    }
  }
}
