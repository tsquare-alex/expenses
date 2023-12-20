// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_type_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionTypeModelAdapter extends TypeAdapter<TransactionTypeModel> {
  @override
  final int typeId = 0;

  @override
  TransactionTypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionTypeModel(
      name: fields[0] as String?,
      content: (fields[1] as List?)?.cast<TransactionContentModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, TransactionTypeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
