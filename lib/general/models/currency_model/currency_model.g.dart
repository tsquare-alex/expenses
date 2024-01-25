// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyModelAdapter extends TypeAdapter<CurrencyModel> {
  @override
  final int typeId = 67;

  @override
  CurrencyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyModel(
      mainCurrency: fields[0] as String?,
      subCurrency: fields[1] as String?,
      value: fields[4] as double?,
      mainCurrencyName: fields[2] as String?,
      subCurrencyName: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.mainCurrency)
      ..writeByte(1)
      ..write(obj.subCurrency)
      ..writeByte(2)
      ..write(obj.mainCurrencyName)
      ..writeByte(3)
      ..write(obj.subCurrencyName)
      ..writeByte(4)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
