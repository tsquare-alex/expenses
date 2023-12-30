// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BagModelAdapter extends TypeAdapter<BagModel> {
  @override
  final int typeId = 185;

  @override
  BagModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BagModel(
      type: fields[0] as String?,
      priority: fields[1] as DropdownModel?,
      amount: fields[2] as double?,
      unit: fields[3] as DropdownModel?,
      completed: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, BagModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.priority)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.unit)
      ..writeByte(4)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BagModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
