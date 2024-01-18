// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddCartModelAdapter extends TypeAdapter<AddCartModel> {
  @override
  final int typeId = 167;

  @override
  AddCartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddCartModel(
      name: fields[0] as String?,
      address: fields[1] as String?,
      type: fields[8] as String?,
      image: fields[11] as Uint8List?,
      description: fields[12] as String?,
      total: fields[10] as double?,
      time: fields[4] as String?,
      amount: fields[6] as double?,
      number: fields[5] as double?,
      brand: fields[7] as String?,
      date: fields[3] as String?,
      dateCreated: fields[2] as String?,
      estimatedValue: fields[9] as double?,
      typeModel: fields[13] as CartTypeModel?,
      contentModel: fields[14] as CartContentModel?,
      cartType: fields[15] as RadioModel?,
      isCompleted: fields[16] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, AddCartModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.dateCreated)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.number)
      ..writeByte(6)
      ..write(obj.amount)
      ..writeByte(7)
      ..write(obj.brand)
      ..writeByte(8)
      ..write(obj.type)
      ..writeByte(9)
      ..write(obj.estimatedValue)
      ..writeByte(10)
      ..write(obj.total)
      ..writeByte(11)
      ..write(obj.image)
      ..writeByte(12)
      ..write(obj.description)
      ..writeByte(13)
      ..write(obj.typeModel)
      ..writeByte(14)
      ..write(obj.contentModel)
      ..writeByte(15)
      ..write(obj.cartType)
      ..writeByte(16)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddCartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
