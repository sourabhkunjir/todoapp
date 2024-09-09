import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/repos/hive_repo.dart';
import 'package:todoapp/ui/screens/all_todo_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveRepo().initHive();
  runApp(ProviderScope(child: const TodoApp()));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AllTodoScreen(),
    );
  }
}
