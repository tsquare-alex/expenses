
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../general/constants/MyColors.dart';
import '../../../general/constants/constants.dart';
import '../../../general/packages/localization/Localizations.dart';
import '../../../general/utilities/routers/RouterImports.gr.dart';
import '../../../general/widgets/MyText.dart';
import 'auth_info_cubit.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isSkipClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 90),
            Image.asset(
              "assets/images/security.png",
              height: 200,
            ),
            MyText(
              title: tr(context, "privacy"),
              color: MyColors.primary,
              size: 18,
              fontWeight: FontWeight.bold,
              alien: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Spacer(),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.5,
              child: TextButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                onPressed: () {
                  _authenticate(context);
                },
                child: MyText(
                  title: tr(context, "enableAuthentication"),
                  color: Colors.white,
                  size: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // SizedBox(
            //   width: MediaQuery.sizeOf(context).width * 0.5,
            //   child: TextButton(
            //     style: ElevatedButton.styleFrom(
            //       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            //       backgroundColor: Colors.white,
            //       foregroundColor: Colors.blue,
            //       side: const BorderSide(
            //         color: Colors.blue,
            //         width: 2,
            //       ),
            //     ),
            //     onPressed: () {
            //       _handleSkip(context);
            //     },
            //     child: MyText(
            //       title: tr(context, "skip"),
            //       color: MyColors.primary,
            //       size: 15.sp,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 10,),

            _buildSkipButton(context),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
  Widget _buildSkipButton2(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        bool isSkipClicked = state.isAuthenticated;

        return isSkipClicked
            ? Container() // Hide the button when skip is clicked
            : SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: TextButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
              side: const BorderSide(
                color: Colors.blue,
                width: 2,
              ),
            ),
            onPressed: () {
              context.read<AuthenticationCubit>().updateSkipStatus(true);
              _handleSkip(context);
            },
            child: MyText(
              title: tr(context, "skip"),
              color: MyColors.primary,
              size: 15.sp,
            ),
          ),
        );
      },
    );
  }
  Widget _buildSkipButton(BuildContext context) {
    return FutureBuilder<bool>(
      future: context.read<AuthenticationCubit>().isSkipButtonClicked(),
      builder: (context, skipSnapshot) {
        if (skipSnapshot.hasData && skipSnapshot.data == true) {
          // Skip button clicked, hide the button
          return Container();
        } else {
          // Skip button not clicked or future not resolved, check for authentication
          return BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
              bool isAuthenticated = state.isAuthenticated ?? false;

              if (isAuthenticated) {
                // Authentication enabled, hide the button
                return Container();
              } else {
                // Show the button if neither condition is met
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      side: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    onPressed: () {
                      _handleSkip(context);
                    },
                    child: MyText(
                      title: tr(context, "skip"),
                      color: MyColors.primary,
                      size: 15.sp,
                    ),
                  ),
                );
              }
            },
          );


        }
      },
    );
  }



  // void _handleSkip(BuildContext context) async {
  //   // Retrieve the shared preferences instance
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   // Save the skip state in SharedPreferences
  //   prefs.setBool(authSharedPrefSkip, true);
  //
  //   // Update AuthenticationCubit state
  //   context.read<AuthenticationCubit>().clearAuthenticationStatus();
  //
  //   // Check if authentication is required
  //   bool isAuthenticationRequired = await context.read<AuthenticationCubit>().isAuthenticationRequired();
  //
  //   // Save the authentication state
  //   prefs.setBool(authSharedPrefSkip, isAuthenticationRequired);
  //
  //   // If authentication is required, navigate to the AuthenticationScreen without the Skip button
  //   if (isAuthenticationRequired) {
  //     AutoRouter.of(context).push(AuthenticationScreenRoute());
  //   } else {
  //     // If authentication is not required, navigate to the home screen
  //     AutoRouter.of(context).push(HomeRoute(index: 1));
  //   }
  //   // Set isSkipClicked to true to hide the button
  //   setState(() {
  //     isSkipClicked = true;
  //   });
  // }

  Future<void> _handleSkip1(BuildContext context) async {
    // Retrieve the shared preferences instance
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if the skip button has already been clicked
    if (prefs.getBool(authSharedPrefSkip) ?? false) {
      // If already clicked, return without doing anything
      return;
    }

    // Save the skip state in SharedPreferences
    await prefs.setBool(authSharedPrefSkip, true);

    // Update AuthenticationCubit state if needed
    context.read<AuthenticationCubit>().clearAuthenticationStatus();

    // Check if authentication is required
    bool isAuthenticationRequired =
    await context.read<AuthenticationCubit>().isAuthenticationRequired();

    // Save the authentication state
    prefs.setBool(authSharedPrefSkip, isAuthenticationRequired);

    // If authentication is required, navigate to the AuthenticationScreen without the Skip button
    if (isAuthenticationRequired) {
      AutoRouter.of(context).push(AuthenticationScreenRoute());
    } else {
      // If authentication is not required, navigate to the home screen
      AutoRouter.of(context).push(HomeRoute(index: 1));
    }
    // Set isSkipClicked to true to hide the button (uncomment if needed)
    // setState(() {
    //   isSkipClicked = true;
    // });
  }
  Future<void> _handleSkip(BuildContext context) async {
    // Retrieve the shared preferences instance
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if the skip button has already been clicked
    if (prefs.getBool(authSharedPrefSkip) ?? false) {
      // If already clicked, return without doing anything
      return;
    }

    // Save the skip state in SharedPreferences
    await prefs.setBool(authSharedPrefSkip, true);

    // Update AuthenticationCubit state if needed
    context.read<AuthenticationCubit>().clearAuthenticationStatus();

    // Check if authentication is required
    bool isAuthenticationRequired =
    await context.read<AuthenticationCubit>().isAuthenticationRequired();

    // Save the authentication state
    prefs.setBool(authSharedPrefSkip, isAuthenticationRequired);

    // If authentication is required, navigate to the AuthenticationScreen without the Skip button
    if (isAuthenticationRequired) {
      AutoRouter.of(context).push(AuthenticationScreenRoute());
    } else {
      // If authentication is not required, navigate to the home screen
      AutoRouter.of(context).push(HomeRoute(index: 1));
    }
    // Set isSkipClicked to true to hide the button (uncomment if needed)
    // setState(() {
    //   isSkipClicked = true;
    // });
  }


  void _authenticate(BuildContext context) async {
    final cubit = context.read<AuthenticationCubit>();

    // Trigger the authentication process
    bool isAuthenticated = await cubit.showAuthenticationDialog(context);

    // If authentication is successful, navigate to the new screen
    if (isAuthenticated) {
      print("Auth Is Done =======================================================================");
      AutoRouter.of(context).push(HomeRoute(index: 1));
    }
  }
}