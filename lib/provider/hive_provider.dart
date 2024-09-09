import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/modals/todo_modal.dart';
import 'package:todoapp/repos/hive_repo.dart';

class HiveController {
  final List<TodoModal> todo;
  final bool isLoading;
  final String error;
  HiveController({
    required this.todo,
    required this.isLoading,
    required this.error,
  });

  //copywith function
  HiveController copyWith(
      {List<TodoModal>? todo, bool? isLoading, String? error}) {
    return HiveController(
        todo: todo ?? this.todo,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }
}

class HiveProvider extends StateNotifier<HiveController> {
  final Ref ref;
  HiveProvider(this.ref)
      : super(HiveController(todo: [], isLoading: false, error: ""));
  //add todo
  void addTodoToBox(TodoModal todo) async {
    state = state.copyWith(isLoading: true);
    try {
      // add todo to hive
      await ref.read(hiveRepoProvider).addTododToBox(todo);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    } finally {
      getListOfTodos();
  
    }
  }

  // get list of todos
  void getListOfTodos() async {
    state = state.copyWith(isLoading: true);
    try {
      //get list of todos from hive
      final todos = await ref.read(hiveRepoProvider).getListOfTodos();
      state = state.copyWith(isLoading: false, todo: todos);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final hiveProvider = StateNotifierProvider<HiveProvider, HiveController>(
  (ref) {
    return HiveProvider(ref);
  },
);
