import 'package:todoapp/App/todo/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:todoapp/App/todo/domain/repositories/delete_todo_repository.dart';
import 'package:todoapp/App/todo/infra/datasource/delete_todo_datasource.dart';

class DeleteToDoRepositoryImpl implements DeleteToDoRepository {
  final DeleteToDoDatasource datasource;

  DeleteToDoRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureToDoDelete, void>> delete(String documentId) async {
    try {
      var result = await datasource.delete(documentId);
      return right(result);
    } on FailureToDoCreate catch (_, e) {
      return left(FailureToDoDelete());
    } catch (e) {
      return left(FailureToDoDelete());
    }
  }
}
