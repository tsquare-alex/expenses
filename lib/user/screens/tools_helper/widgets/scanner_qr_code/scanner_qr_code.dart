// import 'package:expenses/general/constants/MyColors.dart';
// import 'package:expenses/general/packages/localization/Localizations.dart';
// import 'package:expenses/general/widgets/MyText.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:googleapis/admob/v1.dart';
//
// import '../../../database/cubit/database_cubit.dart';
//
// class ScannerQrCode extends StatelessWidget {
//   const ScannerQrCode({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: MyColors.primary,
//         title: MyText(title: tr(context, "scanner"), color: Colors.white, size: 18.sp,fontWeight: FontWeight.bold,),
//       ),
//       body: BlocBuilder<DatabaseCubit, DatabaseState>(
//         builder: (context, state) {
//           if (state is DatabaseScannedResult) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Scan Result:',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     state.scanResult,
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 20),
//                   IconButton(
//                     onPressed: () {
//                       BlocProvider.of<DatabaseCubit>(context)
//                           .scanQRCode();
//                     },
//                     icon: Icon(FontAwesomeIcons.qrcode),
//                   ),
//                 ],
//               ),
//             );
//           } else if (state is DatabaseDataFirestoreLoaded) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Scan Result:',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     state.documentData,
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   // Text(
//                   //   'Document Number: ${state.documentNumber}',
//                   //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   // ),
//                   // SizedBox(height: 10),
//                   // Text(
//                   //   'Document Data: ${state.documentData}',
//                   //   style: TextStyle(fontSize: 18),
//                   // ),
//                   // SizedBox(height: 20),
//                   IconButton(
//                     onPressed: () {
//                       BlocProvider.of<DatabaseCubit>(context)
//                           .scanQRCode();
//                     },
//                     icon: Icon(FontAwesomeIcons.qrcode),
//                   ),
//                 ],
//               ),
//             );
//           } else if (state is DatabaseError) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text('Result: No Data Found'),
//                   IconButton(
//                     onPressed: () {
//                       BlocProvider.of<DatabaseCubit>(context)
//                           .scanQRCode();
//                     },
//                     icon: Icon(FontAwesomeIcons.qrcode),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             return Center(
//               child: IconButton(
//                 onPressed: () {
//                   BlocProvider.of<DatabaseCubit>(context)
//                       .scanQRCode();
//                 },
//                 icon: Icon(FontAwesomeIcons.qrcode),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../general/packages/localization/Localizations.dart';
import '../../../../../general/themes/app_colors.dart';
import '../../../../../general/themes/cubit/app_theme_cubit.dart';
import '../../../../../general/widgets/MyText.dart';
import '../../../database/cubit/database_cubit.dart';


class ScannerQrCode extends StatelessWidget {
  const ScannerQrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
          ),
        ),
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            :MyColors.white,
        title: MyText(
          title: tr(context, "scanner"),
          color:context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              :MyColors.black,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocBuilder<DatabaseCubit, DatabaseState>(
        builder: (context, state) {
          return Center(
            child: _buildContent(context, state),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, DatabaseState state) {
    if (state is DatabaseScannedResult) {
      return _buildScannedResult(state.scanResult,context);
    } else if (state is DatabaseDataFirestoreLoaded) {
      return _buildFirestoreLoadedResult(state.documentData,context);
    } else if (state is DatabaseError) {
      return _buildErrorResult(context);
    } else {
      return _buildDefaultState(context);
    }
  }

  Widget _buildScannedResult(String result,BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Scan Result:',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          result,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        IconButton(
          onPressed: () {
            BlocProvider.of<DatabaseCubit>(context).scanQRCode();
          },
          icon: Icon(FontAwesomeIcons.qrcode),
        ),
      ],
    );
  }

  Widget _buildFirestoreLoadedResult(String documentData,BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Scan Result:',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          documentData,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        IconButton(
          onPressed: () {
            BlocProvider.of<DatabaseCubit>(context).scanQRCode();
          },
          icon: Icon(FontAwesomeIcons.qrcode),
        ),
      ],
    );
  }

  Widget _buildErrorResult(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Result: No Data Found'),
        IconButton(
          onPressed: () {
            BlocProvider.of<DatabaseCubit>(context).scanQRCode();
          },
          icon: Icon(FontAwesomeIcons.qrcode),
        ),
      ],
    );
  }

  Widget _buildDefaultState(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<DatabaseCubit>(context).scanQRCode();
      },
      icon: Icon(FontAwesomeIcons.qrcode),
    );
  }
}
