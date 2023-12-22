import 'dart:typed_data';

import 'package:hive_flutter/adapters.dart';

part 'database_model.g.dart';

@HiveType(typeId: 9)
class DatabaseModel extends HiveObject {
  @HiveField(0)
   String category;
  @HiveField(1)
   String adjective;
  @HiveField(2)
    String firstName;
  @HiveField(3)
   String secondName;
  @HiveField(4)
    String phoneNumber;
  @HiveField(5)
   String workName;
  @HiveField(6)
   String department;
  @HiveField(7)
    String company;
  @HiveField(8)
   String country;
  @HiveField(9)
   String governorate;
  @HiveField(10)
    String city;
  @HiveField(11)
   String street;
  @HiveField(12)
   String buildingNumber;
  @HiveField(13)
   String apartmentNumber;
  @HiveField(14)
   String postalNumber;
  @HiveField(15)
   String emailAddress;
  @HiveField(16)
   String eventTitle;
  @HiveField(17)
   String eventDate;
  @HiveField(18)
   String eventDetails;
  @HiveField(19)
   String notes;
  @HiveField(20)
   String web;
  @HiveField(21)
   String facebook;
  @HiveField(22)
   String instagram;
  @HiveField(23)
   String youtube;
  @HiveField(24)
   String messenger;
  @HiveField(25)
   Uint8List image;

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
        required this.image,
      });
}
