import 'package:acs_display/bootstrap.dart';
import 'package:acs_display/firebase_options.dart';
import 'package:firestore_todos_api/firestore_todos_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final todosApi = FirestoreTodosApi(firestore: FirebaseFirestore.instance);

  bootstrap(todosApi: todosApi);
}
