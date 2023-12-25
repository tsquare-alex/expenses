// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetModelAdapter extends TypeAdapter<BudgetModel> {
  @override
  final int typeId = 30;

  @override
  BudgetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetModel(
      selectTransaction: fields[1] as String,
      selectWallet: fields[2] as String,
      budgetPeriod: fields[3] as String,
      transactionRepeat: fields[4] as String?,
      value: fields[0] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BudgetModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.selectTransaction)
      ..writeByte(2)
      ..write(obj.selectWallet)
      ..writeByte(3)
      ..write(obj.budgetPeriod)
      ..writeByte(4)
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
