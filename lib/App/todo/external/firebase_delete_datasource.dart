import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/App/todo/domain/entities/todo.dart';
import 'package:todoapp/App/todo/infra/datasource/delete_todo_datasource.dart';
import 'package:todoapp/App/todo/infra/models/todo_model.dart';

class FirebaseDeleteDatasource implements DeleteToDoDatasource {
  @override
  Future<void> delete(String documentId) async {
    try {
      var instance = FirebaseFirestore.instance.collection('tarefas');
      var col = await instance.doc(documentId).delete();
    } catch (e) {
      throw Exception(e);
    }
  }
}
