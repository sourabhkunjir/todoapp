import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/modals/todo_modal.dart';
import 'package:todoapp/provider/hive_provider.dart';

class AddTodoScreen extends ConsumerWidget {
  AddTodoScreen({super.key});

  final TextEditingController _addTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add todo screen"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: _addTodoController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  final TodoModal todo = TodoModal(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      title: _addTodoController.text,
                      isDone: false);
                  ref.read(hiveProvider.notifier).addTodoToBox(todo);
                  Navigator.pop(context);
                },
                child: Text("add this todo"))
          ],
        ),
      ),
    );
  }
}
