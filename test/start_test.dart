import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp/App/todo/domain/entities/todo.dart';
import 'package:todoapp/App/todo/domain/usecases/create_todo.dart';
import 'package:todoapp/App/todo/external/firebase_create_datasource.dart';
import 'package:todoapp/App/todo/infra/models/todo_model.dart';
import 'package:todoapp/App/todo/infra/repositories/create_todo_repository_impl.dart';

main() async {
  test('testando', () async {
    var init = await Firebase.initializeApp();
    var todocreated =
        ToDoModel(checked: false, name: 'Criar conta', uid: 'userid');

    var createTodo =
        CreateToDoImpl(ToDoRepositoryImpl(FirebaseCreateDatasource()));
    var created = await createTodo(todocreated);

    expect(created.isRight(), true);
  });
}
