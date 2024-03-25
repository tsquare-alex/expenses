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
      id: fields[25] as String,
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
      isFavorite: fields[15] as bool?,
      addNote: fields[16] as String,
      iconPath: fields[17] as String?,
      currency: fields[18] as String,
      currencyValue: fields[19] as double,
      totalBalance: fields[20] as double?,
      remainBalance: fields[22] as double?,
      remainTotalBalance: fields[21] as double?,
      repeatWallet: fields[23] as String?,
      notificationBalance: fields[24] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, WalletModel obj) {
    writer
      ..writeByte(26)
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
      ..write(obj.model)
      ..writeByte(15)
      ..write(obj.isFavorite)
      ..writeByte(16)
      ..write(obj.addNote)
      ..writeByte(17)
      ..write(obj.iconPath)
      ..writeByte(18)
      ..write(obj.currency)
      ..writeByte(19)
      ..write(obj.currencyValue)
      ..writeByte(20)
      ..write(obj.totalBalance)
      ..writeByte(21)
      ..write(obj.remainTotalBalance)
      ..writeByte(22)
      ..write(obj.remainBalance)
      ..writeByte(23)
      ..write(obj.repeatWallet)
      ..writeByte(24)
      ..write(obj.notificationBalance)
      ..writeByte(25)
      ..write(obj.id);
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
