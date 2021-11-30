import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/HomePage/home.dart';
import 'package:todoapp/LoginPage/loginpage.dart';

class InitializeApp extends StatelessWidget {
  const InitializeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (BuildContext build, snapshot) {
                  if (snapshot.hasData) {
                    return HomePage();
                  } else {
                    return LoginPage();
                  }
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

/*
LoginPage(); */