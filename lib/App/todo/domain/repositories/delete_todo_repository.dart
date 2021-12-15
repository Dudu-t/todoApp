import 'package:dartz/dartz.dart';
import 'package:todoapp/App/todo/domain/entities/todo.dart';
import 'package:todoapp/App/todo/domain/errors/errors.dart';

abstract class DeleteToDoRepository {
  Future<Either<FailureToDoDelete, void>> delete(String documentId);
}
