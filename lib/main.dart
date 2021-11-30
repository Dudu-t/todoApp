import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/Connectors/initialize.dart';
import 'package:todoapp/EditTodoPage/edittodo.dart';
import 'package:todoapp/LoginPage/loginpage.dart';
import 'HomePage/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => InitializeApp(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/editTodo': (context) => EditTodoPage()
      },
    );
  }
}
