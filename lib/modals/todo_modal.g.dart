// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoModalAdapter extends TypeAdapter<TodoModal> {
  @override
  final int typeId = 1;

  @override
  TodoModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoModal(
      id: fields[3] as String,
      title: fields[0] as String,
      isDone: fields[1] as bool?,
      data: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, TodoModal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.isDone)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
