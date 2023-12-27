// import 'package:expenses/general/packages/localization/Localizations.dart';
// import 'package:expenses/general/widgets/MyText.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'auth_info_cubit.dart';
//
// class AuthenticationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/data_security.jpg',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Center(
//             child: Container(
//
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent
//                 ),
//                 onPressed: () {
//                   _authenticate(context);
//                 },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     MyText(title: tr(context, "enableAuthentication"), color: Colors.white, size: 25),
//                     Image.asset("assets/images/security.png",
//                     height: 200,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _authenticate(BuildContext context) async {
//     final cubit = context.read<AuthenticationCubit>();
//
//     // Trigger the authentication process
//     bool isAuthenticated = await cubit.authenticate(context);
//
//     // If authentication is successful, navigate to the new screen
//     if (isAuthenticated) {
//      print("Auth Is Done =======================================================================");
//     }
//   }
// }
import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth_info_cubit.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthenticationCubit>();
    bool isAuthenticationRequired = cubit.isAuthenticationRequired();
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const SizedBox(height: 90),
            Image.asset(
              "assets/images/security.png",
              height: 200,
            ),
            MyText(title: tr(context, "privacy"), color: MyColors.primary, size: 18,fontWeight: FontWeight.bold,alien: TextAlign.center),

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
                child:MyText(title: tr(context, "enableAuthentication"), color: Colors.black, size: 15.sp,fontWeight: FontWeight.bold,),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
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
                  AutoRouter.of(context).push(HomeRoute(index: 1));
                },
                child: MyText(title: tr(context, "skip"), color: MyColors.primary, size: 15.sp),
              ),
            ),
            BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
                return Visibility(
                  visible: state.isAuthenticated,
                  child:  MyText(title: tr(context, "authenticationIsEnabled"), color: MyColors.secondary, size: 15.sp,fontWeight: FontWeight.bold,),
                );
              },
            ),

            const SizedBox(height: 90),




          ],
        ),
      ),
    );
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