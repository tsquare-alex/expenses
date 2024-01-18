// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RadioModelAdapter extends TypeAdapter<RadioModel> {
  @override
  final int typeId = 191;

  @override
  RadioModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RadioModel(
      id: fields[0] as int,
      title: fields[1] as String,
      image: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RadioModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RadioModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
