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
      emailAddress: fields[8] as String?,
      date: fields[9] as String?,
      job: fields[10] as String?,
      extraPhone: fields[11] as String?,
      facebook: fields[12] as String?,
      whatsapp: fields[13] as String?,
      instagram: fields[14] as String?,
      twitter: fields[15] as String?,
      youtube: fields[16] as String?,
    )..qrCodeData = fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, DatabaseModel obj) {
    writer
      ..writeByte(17)
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
      ..write(obj.emailAddress)
      ..writeByte(9)
      ..write(obj.date)
      ..writeByte(10)
      ..write(obj.job)
      ..writeByte(11)
      ..write(obj.extraPhone)
      ..writeByte(12)
      ..write(obj.facebook)
      ..writeByte(13)
      ..write(obj.whatsapp)
      ..writeByte(14)
      ..write(obj.instagram)
      ..writeByte(15)
      ..write(obj.twitter)
      ..writeByte(16)
      ..write(obj.youtube);
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
