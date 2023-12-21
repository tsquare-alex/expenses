import 'dart:typed_data';

import 'package:hive_flutter/adapters.dart';

part 'database_model.g.dart';

@HiveType(typeId: 9)
class DatabaseModel extends HiveObject {
  @HiveField(0)
  final String category;
  @HiveField(1)
  final String adjective;
  @HiveField(2)
  late final String firstName;
  @HiveField(3)
  final String secondName;
  @HiveField(4)
  late final String phoneNumber;
  @HiveField(5)
  final String workName;
  @HiveField(6)
  final String department;
  @HiveField(7)
  late final String company;
  @HiveField(8)
  final String country;
  @HiveField(9)
  final String governorate;
  @HiveField(10)
  late final String city;
  @HiveField(11)
  final String street;
  @HiveField(12)
  final String buildingNumber;
  @HiveField(13)
  final String apartmentNumber;
  @HiveField(14)
  final String postalNumber;
  @HiveField(15)
  final String emailAddress;
  @HiveField(16)
  final String eventTitle;
  @HiveField(17)
  final String eventDate;
  @HiveField(18)
  final String eventDetails;
  @HiveField(19)
  final String notes;
  @HiveField(20)
  final String web;
  @HiveField(21)
  final String facebook;
  @HiveField(22)
  final String instagram;
  @HiveField(23)
  final String youtube;
  @HiveField(24)
  final String messenger;
  @HiveField(25)
  final Uint8List image;
  @HiveField(26)
  final String name;

  DatabaseModel(
      {required this.category,
      required this.adjective,
      required this.firstName,
      required this.secondName,
      required this.phoneNumber,
      required this.workName,
      required this.department,
      required this.company,
      required this.country,
      required this.governorate,
      required this.city,
      required this.street,
      required this.buildingNumber,
      required this.apartmentNumber,
      required this.postalNumber,
      required this.emailAddress,
      required this.eventTitle,
      required this.eventDate,
      required this.eventDetails,
      required this.notes,
      required this.web,
      required this.facebook,
      required this.instagram,
      required this.youtube,
      required this.messenger,
        required this.image, required this.name,
      });
}
