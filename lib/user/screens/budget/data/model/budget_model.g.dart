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
      budgetValue: fields[0] as double,
      transactionName: fields[1] as String,
      waletName: fields[2] as String,
      startBudget: fields[3] as String,
      transactionRepeat: fields[4] as String?,
      percentValue: fields[5] as double?,
      endBudget: fields[6] as String,
      addNote: fields[7] as String,
      notification: fields[8] as bool?,
      favoitate: fields[9] as bool?,
      transactionValue: fields[10] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, BudgetModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.budgetValue)
      ..writeByte(1)
      ..write(obj.transactionName)
      ..writeByte(2)
      ..write(obj.waletName)
      ..writeByte(3)
      ..write(obj.startBudget)
      ..writeByte(4)
      ..write(obj.transactionRepeat)
      ..writeByte(5)
      ..write(obj.percentValue)
      ..writeByte(6)
      ..write(obj.endBudget)
      ..writeByte(7)
      ..write(obj.addNote)
      ..writeByte(8)
      ..write(obj.notification)
      ..writeByte(9)
      ..write(obj.favoitate)
      ..writeByte(10)
      ..write(obj.transactionValue);
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
