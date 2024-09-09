import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/modals/todo_modal.dart';

class HiveRepo {
  final todoBoxName = "todoBox";
  Future initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoModalAdapter());
  }

  Future<Box<TodoModal>> openBox() async {
    final box = await Hive.openBox<TodoModal>(todoBoxName);
    return box;
  }

  Future<void> addTododToBox(TodoModal todo) async {
    final box = await openBox();
    if (box.isOpen) {
      await box.put(todo.id, todo);
    } else {
      throw Exception("Box is not open");
    }
  }

  Future<List<TodoModal>> getListOfTodos() async {
    final box = await openBox();
    if (box.isOpen) {
      return box.values.toList();
    } else {
      throw Exception("Box is not open");
    }
  }
}

final hiveRepoProvider = Provider((ref) => HiveRepo());
