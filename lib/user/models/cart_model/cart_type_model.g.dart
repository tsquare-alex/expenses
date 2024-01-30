// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_type_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartTypeModelAdapter extends TypeAdapter<CartTypeModel> {
  @override
  final int typeId = 158;

  @override
  CartTypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartTypeModel(
      name: fields[0] as String?,
      image: fields[1] as String?,
      content: (fields[2] as List?)?.cast<CartContentModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartTypeModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
