import 'package:acs_display/app/app.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const AppView(),
    );
  }
}
