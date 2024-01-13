// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalletModelAdapter extends TypeAdapter<WalletModel> {
  @override
  final int typeId = 13;

  @override
  WalletModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WalletModel(
      name: fields[0] as String,
      balance: fields[1] as double,
      openDate: fields[2] as String,
      closedDate: fields[3] as String,
      encomeSource: fields[4] as String,
      valueCategory: fields[5] as String,
      currancyChange: fields[6] as bool?,
      walletRepate: fields[7] as bool?,
      notification: fields[8] as bool?,
      category: fields[11] as String,
      isClosed: fields[9] as bool?,
      isHide: fields[10] as bool?,
      checkedValue: fields[12] as bool?,
      paymentMethod: fields[13] as String?,
      model: fields[14] as CategoryModel?,
    );
  }

  @override
  void write(BinaryWriter writer, WalletModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.balance)
      ..writeByte(2)
      ..write(obj.openDate)
      ..writeByte(3)
      ..write(obj.closedDate)
      ..writeByte(4)
      ..write(obj.encomeSource)
      ..writeByte(5)
      ..write(obj.valueCategory)
      ..writeByte(6)
      ..write(obj.currancyChange)
      ..writeByte(7)
      ..write(obj.walletRepate)
      ..writeByte(8)
      ..write(obj.notification)
      ..writeByte(9)
      ..write(obj.isClosed)
      ..writeByte(10)
      ..write(obj.isHide)
      ..writeByte(11)
      ..write(obj.category)
      ..writeByte(12)
      ..write(obj.checkedValue)
      ..writeByte(13)
      ..write(obj.paymentMethod)
      ..writeByte(14)
      ..write(obj.model);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalletModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
