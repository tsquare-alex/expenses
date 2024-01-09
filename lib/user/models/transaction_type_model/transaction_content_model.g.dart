// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_content_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionContentModelAdapter
    extends TypeAdapter<TransactionContentModel> {
  @override
  final int typeId = 1;

  @override
  TransactionContentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionContentModel(
      name: fields[0] as String?,
      image: fields[1] as String?,
      selected: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionContentModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.selected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionContentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
