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
      category: fields[0] as String,
      adjective: fields[1] as String,
      firstName: fields[2] as String,
      secondName: fields[3] as String,
      phoneNumber: fields[4] as String,
      workName: fields[5] as String,
      department: fields[6] as String,
      company: fields[7] as String,
      country: fields[8] as String,
      governorate: fields[9] as String,
      city: fields[10] as String,
      street: fields[11] as String,
      buildingNumber: fields[12] as String,
      apartmentNumber: fields[13] as String,
      postalNumber: fields[14] as String,
      emailAddress: fields[15] as String,
      eventTitle: fields[16] as String,
      eventDate: fields[17] as String,
      eventDetails: fields[18] as String,
      notes: fields[19] as String,
      web: fields[20] as String,
      facebook: fields[21] as String,
      instagram: fields[22] as String,
      youtube: fields[23] as String,
      messenger: fields[24] as String,
      image: fields[25] as Uint8List,
      name: fields[26] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DatabaseModel obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.adjective)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.secondName)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.workName)
      ..writeByte(6)
      ..write(obj.department)
      ..writeByte(7)
      ..write(obj.company)
      ..writeByte(8)
      ..write(obj.country)
      ..writeByte(9)
      ..write(obj.governorate)
      ..writeByte(10)
      ..write(obj.city)
      ..writeByte(11)
      ..write(obj.street)
      ..writeByte(12)
      ..write(obj.buildingNumber)
      ..writeByte(13)
      ..write(obj.apartmentNumber)
      ..writeByte(14)
      ..write(obj.postalNumber)
      ..writeByte(15)
      ..write(obj.emailAddress)
      ..writeByte(16)
      ..write(obj.eventTitle)
      ..writeByte(17)
      ..write(obj.eventDate)
      ..writeByte(18)
      ..write(obj.eventDetails)
      ..writeByte(19)
      ..write(obj.notes)
      ..writeByte(20)
      ..write(obj.web)
      ..writeByte(21)
      ..write(obj.facebook)
      ..writeByte(22)
      ..write(obj.instagram)
      ..writeByte(23)
      ..write(obj.youtube)
      ..writeByte(24)
      ..write(obj.messenger)
      ..writeByte(25)
      ..write(obj.image)
      ..writeByte(26)
      ..write(obj.name);
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
