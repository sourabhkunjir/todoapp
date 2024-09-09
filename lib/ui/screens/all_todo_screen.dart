import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/provider/hive_provider.dart';
import 'package:todoapp/ui/screens/add_todo_screen.dart';

class AllTodoScreen extends ConsumerStatefulWidget {
  const AllTodoScreen({super.key});

  @override
  ConsumerState<AllTodoScreen> createState() => _AllTodoScreenState();
}

class _AllTodoScreenState extends ConsumerState<AllTodoScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        ref.read(hiveProvider.notifier).getListOfTodos();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoNotifier = ref.watch(hiveProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Basic Todo App"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.brown,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddTodoScreen(),
                  ));
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: todoNotifier.isLoading
            ? LinearProgressIndicator()
            : todoNotifier.todo.isEmpty
                ? Center(child: const Text("Ther are no todos"))
                : ListView.builder(
                    itemCount: todoNotifier.todo.length,
                    itemBuilder: (context, index) {
                      final todo = todoNotifier.todo[index];
                      return ListTile(
                        title: Text(todo.title),
                        trailing: Checkbox(
                          value: todo.isDone ?? false,
                          onChanged: (value) {
                            
                          },
                        ),
                      );
                    },
                  ));
  }
}
