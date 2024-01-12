// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabaseModelAdapter extends TypeAdapter<DatabaseModel> {
  @override
  final int typeId = 9;

  @override
  DatabaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatabaseModel(
      category: fields[0] as String?,
      name: fields[1] as String?,
      phone: fields[2] as String?,
      address: fields[3] as String?,
      socialAddress: fields[4] as String?,
      note: fields[5] as String?,
      image: fields[6] as Uint8List?,
    )
      ..qrCodeData = fields[7] as String?
      ..qrCodeImage = fields[8] as Uint8List?;
  }

  @override
  void write(BinaryWriter writer, DatabaseModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.socialAddress)
      ..writeByte(5)
      ..write(obj.note)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.qrCodeData)
      ..writeByte(8)
      ..write(obj.qrCodeImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
