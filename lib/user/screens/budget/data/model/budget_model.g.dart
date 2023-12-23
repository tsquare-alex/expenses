// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetModelAdapter extends TypeAdapter<BudgetModel> {
  @override
  final int typeId = 8;

  @override
  BudgetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetModel(
      endBudget: fields[4] as String,
      selectTransaction: fields[1] as String,
      selectWallet: fields[2] as String,
      startBudget: fields[3] as String,
      transactionRepeat: fields[5] as String,
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BudgetModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.selectTransaction)
      ..writeByte(2)
      ..write(obj.selectWallet)
      ..writeByte(3)
      ..write(obj.startBudget)
      ..writeByte(4)
      ..write(obj.endBudget)
      ..writeByte(5)
      ..write(obj.transactionRepeat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
