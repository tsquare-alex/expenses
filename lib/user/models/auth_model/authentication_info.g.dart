// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthenticationInfoAdapter extends TypeAdapter<AuthenticationInfo> {
  @override
  final int typeId = 100;

  @override
  AuthenticationInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthenticationInfo(
      isAuthenticated: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AuthenticationInfo obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isAuthenticated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthenticationInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
