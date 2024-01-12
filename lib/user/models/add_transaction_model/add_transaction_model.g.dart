// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_transaction_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddTransactionModelAdapter extends TypeAdapter<AddTransactionModel> {
  @override
  final int typeId = 2;

  @override
  AddTransactionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddTransactionModel(
      transactionName: fields[0] as String?,
      transactionType: fields[1] as TransactionTypeModel?,
      image: fields[16] as Uint8List?,
      database: fields[7] as DatabaseModel?,
      unit: fields[4] as DropdownModel?,
      total: fields[6] as String?,
      amount: fields[5] as String?,
      time: fields[10] as String?,
      brandName: fields[15] as String?,
      endDate: fields[12] as String?,
      incomeSource: fields[3] as WalletModel?,
      notify: fields[14] as bool?,
      priority: fields[8] as DropdownModel?,
      repeated: fields[13] as DropdownModel?,
      startDate: fields[17] as String?,
      targetValue: fields[18] as String?,
      transactionContent: fields[2] as TransactionContentModel?,
      transactionDate: fields[9] as String?,
      targetType: fields[19] as TransactionTypeModel?,
      cashTransactionType: fields[11] as TransactionTypeModel?,
      budget: fields[20] as BudgetModel?,
    );
  }

  @override
  void write(BinaryWriter writer, AddTransactionModel obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.transactionName)
      ..writeByte(1)
      ..write(obj.transactionType)
      ..writeByte(2)
      ..write(obj.transactionContent)
      ..writeByte(3)
      ..write(obj.incomeSource)
      ..writeByte(4)
      ..write(obj.unit)
      ..writeByte(5)
      ..write(obj.amount)
      ..writeByte(6)
      ..write(obj.total)
      ..writeByte(7)
      ..write(obj.database)
      ..writeByte(8)
      ..write(obj.priority)
      ..writeByte(9)
      ..write(obj.transactionDate)
      ..writeByte(10)
      ..write(obj.time)
      ..writeByte(11)
      ..write(obj.cashTransactionType)
      ..writeByte(12)
      ..write(obj.endDate)
      ..writeByte(13)
      ..write(obj.repeated)
      ..writeByte(14)
      ..write(obj.notify)
      ..writeByte(15)
      ..write(obj.brandName)
      ..writeByte(16)
      ..write(obj.image)
      ..writeByte(17)
      ..write(obj.startDate)
      ..writeByte(18)
      ..write(obj.targetValue)
      ..writeByte(19)
      ..write(obj.targetType)
      ..writeByte(20)
      ..write(obj.budget);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddTransactionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
