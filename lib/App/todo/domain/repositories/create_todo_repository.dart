import 'package:dartz/dartz.dart';
import 'package:todoapp/App/todo/domain/entities/todo.dart';
import 'package:todoapp/App/todo/domain/errors/errors.dart';

abstract class CreateToDoRepository {
  Future<Either<FailureToDoCreate, String>> create(ToDo todo);
}
