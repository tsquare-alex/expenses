import 'dart:typed_data';
import 'package:hive_flutter/adapters.dart';

part 'database_model.g.dart';

@HiveType(typeId: 9)
class DatabaseModel extends HiveObject {
  @HiveField(0)
  String? category;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  String? address;
  @HiveField(4)
  String? socialAddress;
  @HiveField(5)
  String? note;
  @HiveField(6)
  Uint8List? image;
  @HiveField(7)
  String? qrCodeData;
  @HiveField(8)
  Uint8List? qrCodeImage;

  DatabaseModel({
    required this.category,
    required this.name,
    required this.phone,
    required this.address,
    required this.socialAddress,
    required this.note,
    required this.image,
  }) {
    // Initialize QR code data when constructing the object
    qrCodeData = generateQRCodeData();
  }

  String generateQRCodeData() {
    print('$category,$name,$phone,$address,$socialAddress,$note');
    return '$category,$name,$phone,$address,$socialAddress,$note';
  }


}
class ScannedData {
  final String category;
  final String name;
  final String phone;
  final String address;
  final String socialAddress;
  final String note;

  ScannedData({
    required this.category,
    required this.name,
    required this.phone,
    required this.address,
    required this.socialAddress,
    required this.note,
  });
}

ScannedData scannedData = ScannedData(
  category: '',
  name: '',
  phone: '',
  address: '',
  socialAddress: '',
  note: '',
);