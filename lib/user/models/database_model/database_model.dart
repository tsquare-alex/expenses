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
  String? emailAddress;
  @HiveField(9)
  String? date;
  @HiveField(10)
  String? job;

  DatabaseModel({
    required this.category,
    required this.name,
    required this.phone,
    required this.address,
    required this.socialAddress,
    required this.note,
    required this.image,
    required this.emailAddress,
    required this.date,
    required this.job,
  }) {
    qrCodeData = generateQRCodeData();
  }

  String generateQRCodeData() {

    print("===============================================================================");
    print('$category,$name,$phone,$address,$socialAddress,$note,$emailAddress,$date,$job');
    print("===============================================================================");

    return '$category,$name,$phone,$address,$socialAddress,$note,$emailAddress,$date,$job';
  }
  factory DatabaseModel.fromJson(Map<String, dynamic> json) {
    return DatabaseModel(
      category: json['category'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      socialAddress: json['socialAddress'],
      note: json['note'],
      image: Uint8List.fromList(json['image'] ?? []),
      emailAddress: json['emailAddress'],
      date: json['date'],
      job: json['job'],
    );
  }


}
class ScannedData {
  final String category;
  final String name;
  final String phone;
  final String address;
  final String socialAddress;
  final String note;
  final String emailAddress;
  final String date;
  final String job;

  ScannedData({
    required this.category,
    required this.name,
    required this.phone,
    required this.address,
    required this.socialAddress,
    required this.note,
    required this.emailAddress,
    required this.date,
    required this.job,
  });
}

ScannedData scannedData = ScannedData(
  category: '',
  name: '',
  phone: '',
  address: '',
  socialAddress: '',
  note: '',
  emailAddress: "",
  date: "",
  job: "",
);