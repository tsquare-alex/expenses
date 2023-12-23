
import 'package:hive_flutter/hive_flutter.dart';
part 'authentication_info.g.dart';
@HiveType(typeId: 2)
class AuthenticationInfo {
  @HiveField(0)
  late bool isAuthenticated;

  AuthenticationInfo({required this.isAuthenticated});
}