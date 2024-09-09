import 'package:hive/hive.dart';

part 'todo_modal.g.dart';

@HiveType(typeId: 01)
class TodoModal {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final bool? isDone;
  @HiveField(2)
  final DateTime? data;
  @HiveField(3)
  final String id;
  TodoModal(
      {required this.id, required this.title, this.isDone = false, this.data});
}
