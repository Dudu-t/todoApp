import 'package:todoapp/App/todo/domain/entities/todo.dart';

abstract class DeleteToDoDatasource {
  Future<void> delete(String documentId);
}
