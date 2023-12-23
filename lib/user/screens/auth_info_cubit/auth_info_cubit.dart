// import 'package:expenses/user/models/auth_model/authentication_info.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';
//
// class AuthenticationCubit extends Cubit<bool> {
//   AuthenticationCubit() : super(false);
//
//   void loadAuthenticationStatus() async {
//     final box = await Hive.openBox<AuthenticationInfo>('authentication_box');
//     final authenticationInfo = box.get(
//         1, defaultValue: AuthenticationInfo(isAuthenticated: false));
//     emit(authenticationInfo!.isAuthenticated);
//   }
//
//   void saveAuthenticationStatus(bool isAuthenticated) async {
//     final box = await Hive.openBox<AuthenticationInfo>('authentication_box');
//     await box.put(1, AuthenticationInfo(isAuthenticated: isAuthenticated));
//     emit(isAuthenticated);
//   }
//
//   void clearAuthenticationStatus() async {
//     final box = await Hive.openBox<AuthenticationInfo>('authentication_box');
//     await box.clear();
//     emit(false);
//   }
//
//   bool isAuthenticationRequired() {
//     final box = Hive.box<AuthenticationInfo>('authentication_box');
//     final authenticationInfo = box.get(
//         1, defaultValue: AuthenticationInfo(isAuthenticated: false));
//     return !authenticationInfo!.isAuthenticated;
//   }
//
//   void setAuthenticationCompleted() async {
//     final box = await Hive.openBox<AuthenticationInfo>('authentication_box');
//     box.put(1, AuthenticationInfo(isAuthenticated: true));
//   }
//
// }
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/user/models/auth_model/authentication_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_auth/local_auth.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationState(isAuthenticated: false));

  Future<bool> authenticate(BuildContext context) async {
    final LocalAuthentication auth = LocalAuthentication();
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: tr(context, "authentication"),
        options: AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );

      // Check if authentication was successful and update the status
      if (authenticated) {
        await saveAuthenticationStatus(true);
        emit(AuthenticationState(isAuthenticated: true));
      }

      return authenticated;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> showAuthenticationDialog(BuildContext context) async {
    return await authenticate(context);
  }

  bool isAuthenticationRequired() {
    final box = Hive.box<AuthenticationInfo>('authentication_box');
    final authenticationInfo = box.get(1,
        defaultValue: AuthenticationInfo(isAuthenticated: false));
    return !authenticationInfo!.isAuthenticated;
  }

  Future<void> saveAuthenticationStatus(bool isAuthenticated) async {
    final box = Hive.box<AuthenticationInfo>('authentication_box');
    await box.put(1, AuthenticationInfo(isAuthenticated: isAuthenticated));
    emit(AuthenticationState(isAuthenticated: isAuthenticated));
  }

  void clearAuthenticationStatus() async {
    final box = Hive.box<AuthenticationInfo>('authentication_box');
    await box.clear();
    emit(AuthenticationState(isAuthenticated: false));
  }

  Future<void> loadAuthenticationStatus() async {
    final box = Hive.box<AuthenticationInfo>('authentication_box');
    final authenticationInfo = box.get(1,
        defaultValue: AuthenticationInfo(isAuthenticated: false));
    emit(AuthenticationState(isAuthenticated: authenticationInfo!.isAuthenticated));
  }
}

class AuthenticationState {
  final bool isAuthenticated;

  AuthenticationState({required this.isAuthenticated});
}


// class AuthenticationCubit extends Cubit<bool> {
//   AuthenticationCubit() : super(false);
//
//   Future<void> authenticate() async {
//     final LocalAuthentication auth = LocalAuthentication();
//     try {
//       bool authenticated = await auth.authenticate(
//         localizedReason: "Subscribe or you will never find any data",
//         options: AuthenticationOptions(
//           stickyAuth: true,
//           biometricOnly: false,
//         ),
//
//       );
//       if (authenticated) {
//         await saveAuthenticationStatus(true);
//       }
//       emit(authenticated);
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   Future<void> showAuthenticationDialog() async {
//     await authenticate();
//   }
//
//   bool isAuthenticationRequired() {
//     final box = Hive.box<AuthenticationInfo>('authentication_box');
//     final authenticationInfo = box.get(1,
//         defaultValue: AuthenticationInfo(isAuthenticated: false));
//     return authenticationInfo!.isAuthenticated;
//   }
//
//   Future<void> saveAuthenticationStatus(bool isAuthenticated) async {
//     final box = Hive.box<AuthenticationInfo>('authentication_box');
//     await box.put(1, AuthenticationInfo(isAuthenticated: isAuthenticated));
//     emit(isAuthenticated);
//   }
//
//   void clearAuthenticationStatus() async {
//     final box = Hive.box<AuthenticationInfo>('authentication_box');
//     await box.clear();
//     emit(false);
//   }
//
//   Future<void> loadAuthenticationStatus() async {
//     final box = Hive.box<AuthenticationInfo>('authentication_box');
//     final authenticationInfo = box.get(1,
//         defaultValue: AuthenticationInfo(isAuthenticated: false));
//     emit(authenticationInfo!.isAuthenticated);
//   }
//
// }