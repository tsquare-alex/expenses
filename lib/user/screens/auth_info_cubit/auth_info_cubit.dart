
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
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
      bool hasBiometrics = await auth.canCheckBiometrics;

      bool isDeviceSecure = await auth.isDeviceSupported();

      if (!hasBiometrics || !isDeviceSecure) {
        _showSetupSecurityDialog(context);
        return false;
      }

      bool authenticated = await auth.authenticate(
        localizedReason: tr(context, "authentication"),
        options: AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );

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






  void _showSetupSecurityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: MyText(title: tr(context, "setupSecurity"), color: MyColors.primary, size: 20,fontWeight: FontWeight.bold,),
          content: MyText(title: tr(context, "securityMsg"), color: MyColors.primary, size: 15,fontWeight: FontWeight.bold,),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
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


