import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:expenses/user/screens/database/widgets/build_phone_expansion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/constants/validation.dart';
// import '../../../../general/packages/input_fields/GenericTextField.dart';
// import '../../../../general/packages/localization/Localizations.dart';
// import '../../../../general/themes/app_colors.dart';
// import '../../../../general/themes/cubit/app_theme_cubit.dart';
// import '../../../../general/widgets/MyText.dart';
// import '../cubit/add_database_cubit/add_data_base_cubit.dart';
// import '../cubit/my_expansion_cubit/my_expansion_cubit.dart';
// import 'build_category_expansion.dart';
//
// class AddDatabase extends StatefulWidget {
//   @override
//   State<AddDatabase> createState() => _AddDatabaseState();
// }
//
// class _AddDatabaseState extends State<AddDatabase> {
//   AddDataBaseCubit dataBaseCubit = AddDataBaseCubit();
//   String _scanResult = 'QR Code Result';
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//
//   Future<void> _scanQRCode() async {
//     try {
//       var result = await BarcodeScanner.scan();
//       setState(() {
//         _scanResult = result.rawContent;
//       });
//
//       print("QRCode_Result:--");
//       print(result.rawContent);
//
//       // Now, you can parse this result and get the individual values.
//       List<String> qrCodeValues = result.rawContent.split(',');
//       scannedData = ScannedData(
//           category: qrCodeValues[0],
//           name: qrCodeValues[1],
//           phone: qrCodeValues[2],
//           address: qrCodeValues[3],
//           socialAddress: qrCodeValues[4],
//           note: qrCodeValues[5],
//           emailAddress: qrCodeValues[8],
//           date: qrCodeValues[9],
//           job: qrCodeValues[10]);
//
//       // Now, you can use these values where needed, such as replacing text form field values.
//     } on PlatformException {
//       setState(() {
//         _scanResult = 'Failed to scan QR Code.';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         surfaceTintColor: Colors.transparent,
//         centerTitle: true,
//         leading: GestureDetector(
//           onTap: () => AutoRouter.of(context).pop(),
//           child: Icon(
//             Icons.arrow_back,
//             color: context.watch<AppThemeCubit>().isDarkMode
//                 ? MyColors.white
//                 : MyColors.black,
//           ),
//         ),
//         backgroundColor: context.watch<AppThemeCubit>().isDarkMode
//             ? AppDarkColors.backgroundColor
//             : MyColors.white,
//         title: MyText(
//           title: tr(context, "addDestination"),
//           color:  context.watch<AppThemeCubit>().isDarkMode
//               ? MyColors.white
//               : MyColors.black,
//           size: 18.sp,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               BuildCategoryExpansion(
//                 categoryFormKey: dataBaseCubit.categoryFormKey,
//                 categoryController: dataBaseCubit.categoryController,
//               ),
//               const SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   MyText(
//                       title: tr(context, "databaseName"),
//                       color: context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       size: 16,
//                       fontWeight: FontWeight.w500,
//                       alien: TextAlign.center),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   Flexible(
//                     child: GenericTextField(
//                       contentPadding:
//                           const EdgeInsets.symmetric(horizontal: 16),
//                       controller: dataBaseCubit.nameController,
//                       fieldTypes: FieldTypes.normal,
//                       type: TextInputType.emailAddress,
//                       action: TextInputAction.next,
//                       validate: (value) => validateField(value),
//                       label: tr(context, "enterName"),
//                       hintColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       textColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   MyText(
//                       title: tr(context, "phoneNumber"),
//                       color:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       size: 16,
//                       fontWeight: FontWeight.w500,
//                       alien: TextAlign.center),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   Flexible(
//                     child: GenericTextField(
//                       contentPadding:
//                           const EdgeInsets.symmetric(horizontal: 16),
//                       controller: dataBaseCubit.phoneController,
//                       fieldTypes: FieldTypes.normal,
//                       type: TextInputType.phone,
//                       action: TextInputAction.next,
//                       validate: (value) => validateField(value),
//                       label: tr(context, "enterPhone"),
//                       hintColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       textColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   MyText(
//                       title: tr(context, "databaseJob"),
//                       color:context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       size: 16,
//                       fontWeight: FontWeight.w500,
//                       alien: TextAlign.center),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   Flexible(
//                     child: GenericTextField(
//                       contentPadding:
//                           const EdgeInsets.symmetric(horizontal: 16),
//                       controller: dataBaseCubit.jobController,
//                       fieldTypes: FieldTypes.normal,
//                       type: TextInputType.name,
//                       action: TextInputAction.next,
//                       validate: (value) => validateField(value),
//                       label: tr(context, "databaseJob"),
//                       hintColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       textColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   MyText(
//                       title: tr(context, "address"),
//                       color: context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       size: 16,
//                       fontWeight: FontWeight.w500,
//                       alien: TextAlign.center),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   Flexible(
//                     child: GenericTextField(
//                       contentPadding:
//                           const EdgeInsets.symmetric(horizontal: 16),
//                       controller: dataBaseCubit.addressController,
//                       fieldTypes: FieldTypes.normal,
//                       type: TextInputType.name,
//                       action: TextInputAction.next,
//                       validate: (value) => validateField(value),
//                       label: tr(context, "address"),
//                       hintColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       textColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   MyText(
//                       title: tr(context, "databaseEmail"),
//                       color:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       size: 16,
//                       fontWeight: FontWeight.w500,
//                       alien: TextAlign.center),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   Flexible(
//                     child: GenericTextField(
//                       contentPadding:
//                           const EdgeInsets.symmetric(horizontal: 16),
//                       controller: dataBaseCubit.emailAddressController,
//                       fieldTypes: FieldTypes.normal,
//                       type: TextInputType.name,
//                       action: TextInputAction.next,
//                       validate: (value) => validateField(value),
//                       label: tr(context, "databaseEmail"),
//                       hintColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       textColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   MyText(
//                       title: tr(context, "databaseImportantHistory"),
//                       color: context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       size: 16,
//                       fontWeight: FontWeight.w500,
//                       alien: TextAlign.center),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   Flexible(
//                     child: GenericTextField(
//                       contentPadding:
//                           const EdgeInsets.symmetric(horizontal: 16),
//                       controller: dataBaseCubit.dateController,
//                       fieldTypes: FieldTypes.normal,
//                       type: TextInputType.name,
//                       action: TextInputAction.next,
//                       validate: (value) => validateField(value),
//                       label: tr(context, "databaseImportantHistory"),
//                       hintColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       textColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   MyText(
//                       title: tr(context, "databaseSocialAddress"),
//                       color: context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       size: 16,
//                       fontWeight: FontWeight.w500,
//                       alien: TextAlign.center),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   Flexible(
//                     child: GenericTextField(
//                       contentPadding:
//                           const EdgeInsets.symmetric(horizontal: 16),
//                       controller: dataBaseCubit.socialAddressController,
//                       fieldTypes: FieldTypes.normal,
//                       type: TextInputType.name,
//                       action: TextInputAction.next,
//                       validate: (value) => validateField(value),
//                       label: tr(context, "databaseSocialAddress"),
//                       hintColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       textColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   MyText(
//                       title: tr(context, "enterNote"),
//                       color:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       size: 16,
//                       fontWeight: FontWeight.w500,
//                       alien: TextAlign.center),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   Flexible(
//                     child: GenericTextField(
//                       contentPadding:
//                           const EdgeInsets.symmetric(horizontal: 16),
//                       controller: dataBaseCubit.noteController,
//                       fieldTypes: FieldTypes.normal,
//                       type: TextInputType.name,
//                       action: TextInputAction.next,
//                       validate: (value) => validateField(value),
//                       label: tr(context, "addNotes"),
//                       hintColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                       textColor:  context.watch<AppThemeCubit>().isDarkMode
//                           ? MyColors.white
//                           : MyColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20.0),
//               Container(
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(16),
//                           border: Border.all(
//                             color: MyColors.grey.withOpacity(0.5),
//                             width: 1,
//                           ),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 MyText(
//                                   title: tr(context, "addImage"),
//                                   color: context.watch<AppThemeCubit>().isDarkMode
//                                       ? MyColors.white
//                                       : MyColors.black,
//                                   size: 16.sp,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ],
//                             ),
//                             Spacer(),
//                             GestureDetector(
//                               onTap: () async {
//                                 await dataBaseCubit.getImageFromCamera();
//                               },
//                               child: Image.asset(Res.camera_ic),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             Container(
//                               height: 30.0,
//                               color: Colors.grey,
//                               width: 1.0,
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             GestureDetector(
//                               onTap: () async {
//                                 await dataBaseCubit.getImageFromGallery();
//                               },
//                               child: Image.asset(Res.gallery_ic),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 12,
//                     ),
//                     Container(
//                       height: 50,
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         border: Border.all(
//                           color: MyColors.grey.withOpacity(0.5),
//                           width: 1,
//                         ),
//                       ),
//                       child: GestureDetector(
//                         onTap: () async {
//                           await _scanQRCode();
//                         },
//                         child: Image.asset(Res.barcode_ic),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20.0),
//               DefaultButton(
//                   title: tr(context, "add"),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                   color:  context.watch<AppThemeCubit>().isDarkMode
//                       ? AppDarkColors.primary
//                       : MyColors.primary,
//                   onTap: () async {
//                     var dataBase = DatabaseModel(
//                         category:
//                             dataBaseCubit.categoryController.text.isNotEmpty
//                                 ? dataBaseCubit.categoryController.text
//                                 : scannedData.category,
//                         name: dataBaseCubit.nameController.text.isNotEmpty
//                             ? dataBaseCubit.nameController.text
//                             : scannedData.name,
//                         phone: dataBaseCubit.phoneController.text.isNotEmpty
//                             ? dataBaseCubit.phoneController.text
//                             : scannedData.phone,
//                         address: dataBaseCubit.addressController.text.isNotEmpty
//                             ? dataBaseCubit.addressController.text
//                             : scannedData.address,
//                         socialAddress: dataBaseCubit
//                                 .socialAddressController.text.isNotEmpty
//                             ? dataBaseCubit.socialAddressController.text
//                             : scannedData.socialAddress,
//                         note: dataBaseCubit.noteController.text.isNotEmpty
//                             ? dataBaseCubit.noteController.text
//                             : scannedData.note,
//                         image:
//                             dataBaseCubit.imageBytes ?? Uint8List.fromList([]),
//                         emailAddress:
//                             dataBaseCubit.emailAddressController.text.isNotEmpty
//                                 ? dataBaseCubit.emailAddressController.text
//                                 : scannedData.emailAddress,
//                         date: dataBaseCubit.dateController.text.isNotEmpty
//                             ? dataBaseCubit.dateController.text
//                             : scannedData.date,
//                         job: dataBaseCubit.jobController.text.isNotEmpty
//                             ? dataBaseCubit.jobController.text
//                             : scannedData.job);
//
//                     // Ensure QR code data is generated before adding to Hive
//                     dataBase.qrCodeData = dataBase.generateQRCodeData();
//
//                     // Continue with adding data to Hive
//                     await BlocProvider.of<AddDataBaseCubit>(context)
//                         .addDataBase(dataBase);
//
//                     if (context.mounted) {
//                       Navigator.of(context).pop();
//                     }
//                   }),
//               const SizedBox(height: 16.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import '../../../../general/packages/input_fields/GenericTextField.dart';
import '../../../../general/packages/localization/Localizations.dart';
import '../../../../general/themes/app_colors.dart';
import '../../../../general/themes/cubit/app_theme_cubit.dart';
import '../../../../general/widgets/MyText.dart';
import '../../../../res.dart';
import '../../../models/database_model/database_model.dart';
import '../cubit/add_database_cubit/add_data_base_cubit.dart';
import 'build_category_expansion.dart'; // Replace with the actual import path

class AddDatabase extends StatefulWidget {
  @override
  State<AddDatabase> createState() => _AddDatabaseState();
}

class _AddDatabaseState extends State<AddDatabase> {
  AddDataBaseCubit dataBaseCubit = AddDataBaseCubit();
  String _scanResult = 'QR Code Result';
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Future<void> _scanQRCode() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() {
        _scanResult = result.rawContent;
      });

      print("QRCode_Result:--");
      print(result.rawContent);

      // Now, you can parse this result and get the individual values.
      List<String> qrCodeValues = result.rawContent.split(',');

      if (qrCodeValues.length >= 9) {
        scannedData = ScannedData(
          category: qrCodeValues.length > 0 ? qrCodeValues[0] : '',
          name: qrCodeValues.length > 1 ? qrCodeValues[1] : '',
          phone: qrCodeValues.length > 2 ? qrCodeValues[2] : '',
          address: qrCodeValues.length > 3 ? qrCodeValues[3] : '',
          socialAddress: qrCodeValues.length > 4 ? qrCodeValues[4] : '',
          note: qrCodeValues.length > 5 ? qrCodeValues[5] : '',
          emailAddress: qrCodeValues.length > 6 ? qrCodeValues[6] : '',
          date: qrCodeValues.length > 7 ? qrCodeValues[7] : '',
          job: qrCodeValues.length > 8 ? qrCodeValues[8] : '',
          extraPhone: qrCodeValues.length > 9 ? qrCodeValues[9] : '',
          facebook: qrCodeValues.length > 10 ? qrCodeValues[10] : '',
          whatsapp: qrCodeValues.length > 11 ? qrCodeValues[11] : '',
          instagram: qrCodeValues.length > 12 ? qrCodeValues[12] : '',
          twitter: qrCodeValues.length > 13 ? qrCodeValues[13] : '',
          youtube: qrCodeValues.length > 14 ? qrCodeValues[14] : '',
        );
      } else {
        scannedData = ScannedData(
          category: '',
          name: '',
          phone: '',
          address: '',
          socialAddress: '',
          note: '',
          emailAddress: '',
          date: '',
          job: '',
          extraPhone: '',
          facebook: '',
          whatsapp: '',
          instagram: '',
          twitter: '',
          youtube: '',
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(tr(context, "pleaseTryAgain")),
              content: Text(tr(context, "pleaseTryAgain")),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(tr(context, "ok")),
                ),
              ],
            );
          },
        );
      }
    } on PlatformException {
      setState(() {
        _scanResult = 'Failed to scan QR Code.';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primary,
        title: MyText(
          title: "أضافة جهة",
          color: MyColors.white,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BuildCategoryExpansion(
                categoryFormKey: dataBaseCubit.categoryFormKey,
                categoryController: dataBaseCubit.categoryController,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: tr(context, "databaseName"),
                      color:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      alien: TextAlign.center),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: GenericTextField(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      controller: dataBaseCubit.nameController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.name,
                      action: TextInputAction.next,
                      validate: (value) => validateField(value),
                      label: tr(context, "enterName"),
                      hintColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      textColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
           BuildPhoneExpansion(mainPhoneController: dataBaseCubit.phoneController
               , extraPhoneController: dataBaseCubit.secondPhoneController),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: tr(context, "databaseJob"),
                      color:context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      alien: TextAlign.center),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: GenericTextField(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      controller: dataBaseCubit.jobController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.name,
                      action: TextInputAction.next,
                      validate: (value) => validateField(value),
                      label: tr(context, "databaseJob"),
                      hintColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      textColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: tr(context, "address"),
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      alien: TextAlign.center),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: GenericTextField(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      controller: dataBaseCubit.addressController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.name,
                      action: TextInputAction.next,
                      validate: (value) => validateField(value),
                      label: tr(context, "address"),
                      hintColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      textColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: tr(context, "databaseEmail"),
                      color:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      alien: TextAlign.center),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: GenericTextField(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      controller: dataBaseCubit.emailAddressController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.name,
                      action: TextInputAction.next,
                      validate: (value) => validateField(value),
                      label: tr(context, "databaseEmail"),
                      hintColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      textColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    title: tr(context, "databaseImportantHistory"),
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        : MyColors.black,
                    size: 16,
                    fontWeight: FontWeight.w500,
                    alien: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          // initialEntryMode: DatePickerEntryMode.input, // Only date without time
                          fieldLabelText: tr(context, "databaseImportantHistory"),
                          helpText: tr(context, "databaseImportantHistory"),
                          errorFormatText: tr(context, "databaseImportantHistory"),
                          errorInvalidText: tr(context, "databaseImportantHistory"),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: MyColors.primary, // Your desired color for primary
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    backgroundColor: MyColors.primary, // Your desired color for buttons
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (pickedDate != null) {
                          setState(() {
                            // Format the picked date to remove time
                            String formattedDate =
                                "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                            // Assign the formatted date directly to the dateController
                            dataBaseCubit.dateController.text = formattedDate;
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 10),
                          Text(
                            dataBaseCubit.dateController.text.isNotEmpty
                                ? dataBaseCubit.dateController.text
                                : tr(context, "selectedDate"),
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),



              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: tr(context, "databaseSocialAddress"),
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      alien: TextAlign.center),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: GenericTextField(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      controller: dataBaseCubit.socialAddressController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.name,
                      action: TextInputAction.next,
                      validate: (value) => validateField(value),
                      label: tr(context, "databaseSocialAddress"),
                      hintColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      textColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: tr(context, "facebook"),
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      alien: TextAlign.center),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: GenericTextField(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      controller: dataBaseCubit.facebookController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.name,
                      action: TextInputAction.next,
                      validate: (value) => validateField(value),
                      label: tr(context, "facebook"),
                      hintColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      textColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: tr(context, "whatsapp"),
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      alien: TextAlign.center),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: GenericTextField(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      controller: dataBaseCubit.whatsappController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.text,
                      action: TextInputAction.next,
                      validate: (value) => validateField(value),
                      label: tr(context, "whatsapp"),
                      hintColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      textColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: tr(context, "instagram"),
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      alien: TextAlign.center),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: GenericTextField(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      controller: dataBaseCubit.instagramController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.text,
                      action: TextInputAction.next,
                      validate: (value) => validateField(value),
                      label: tr(context, "instagram"),
                      hintColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      textColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: tr(context, "twitter"),
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      alien: TextAlign.center),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: GenericTextField(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      controller: dataBaseCubit.twitterController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.text,
                      action: TextInputAction.next,
                      validate: (value) => validateField(value),
                      label: tr(context, "twitter"),
                      hintColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      textColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: tr(context, "youtube"),
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      alien: TextAlign.center),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: GenericTextField(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      controller: dataBaseCubit.youtubeController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.none,
                      action: TextInputAction.next,
                      validate: (value) => validateField(value),
                      label: tr(context, "youtube"),
                      hintColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      textColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: tr(context, "enterNote"),
                      color:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      size: 16,
                      fontWeight: FontWeight.w500,
                      alien: TextAlign.center),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: GenericTextField(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      controller: dataBaseCubit.noteController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.name,
                      action: TextInputAction.next,
                      validate: (value) => validateField(value),
                      label: tr(context, "addNotes"),
                      hintColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      textColor:  context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: MyColors.grey.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyText(
                                  title: tr(context, "addImage"),
                                  color: context.watch<AppThemeCubit>().isDarkMode
                                      ? MyColors.white
                                      : MyColors.black,
                                  size: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () async {
                                await dataBaseCubit.getImageFromCamera();
                              },
                              child: Image.asset(Res.camera_ic),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 30.0,
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await dataBaseCubit.getImageFromGallery();
                              },
                              child: Image.asset(Res.gallery_ic),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: MyColors.grey.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          await _scanQRCode();
                        },
                        child: Image.asset(Res.barcode_ic),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              DefaultButton(
                  title: tr(context, "add"),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color:  context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.primary
                      : MyColors.primary,
                  onTap: () async {
                    if(dataBaseCubit.nameController.text.isNotEmpty){
                      var dataBase = DatabaseModel(
                        category: dataBaseCubit.categoryController.text.isNotEmpty
                            ? dataBaseCubit.categoryController.text
                            : scannedData.category,
                        name: dataBaseCubit.nameController.text.isNotEmpty
                            ? dataBaseCubit.nameController.text
                            : scannedData.name,
                        phone: dataBaseCubit.phoneController.text.isNotEmpty
                            ? dataBaseCubit.phoneController.text
                            : scannedData.phone,
                        address: dataBaseCubit.addressController.text.isNotEmpty
                            ? dataBaseCubit.addressController.text
                            : scannedData.address,
                        socialAddress: dataBaseCubit.socialAddressController.text.isNotEmpty
                            ? dataBaseCubit.socialAddressController.text
                            : scannedData.socialAddress,
                        note: dataBaseCubit.noteController.text.isNotEmpty
                            ? dataBaseCubit.noteController.text
                            : scannedData.note,
                        image: dataBaseCubit.imageBytes ?? Uint8List.fromList([]),
                        emailAddress:
                        dataBaseCubit.emailAddressController.text.isNotEmpty
                            ? dataBaseCubit.emailAddressController.text
                            : scannedData.emailAddress,
                        date: dataBaseCubit.dateController.text.isNotEmpty
                            ? dataBaseCubit.dateController.text
                            : scannedData.date,
                        job: dataBaseCubit.jobController.text.isNotEmpty
                            ? dataBaseCubit.jobController.text
                            : scannedData.job,
                        extraPhone: dataBaseCubit.secondPhoneController.text.isNotEmpty
                            ? dataBaseCubit.secondPhoneController.text
                            : scannedData.extraPhone,
                        facebook:  dataBaseCubit.facebookController.text.isNotEmpty
                            ? dataBaseCubit.facebookController.text
                            : scannedData.facebook,
                        whatsapp:  dataBaseCubit.whatsappController.text.isNotEmpty
                            ? dataBaseCubit.whatsappController.text
                            : scannedData.whatsapp,
                        instagram: dataBaseCubit.instagramController.text.isNotEmpty
                            ? dataBaseCubit.instagramController.text
                            : scannedData.instagram,
                        twitter: dataBaseCubit.twitterController.text.isNotEmpty
                            ? dataBaseCubit.twitterController.text
                            : scannedData.twitter,
                        youtube: dataBaseCubit.youtubeController.text.isNotEmpty
                            ? dataBaseCubit.youtubeController.text
                            : scannedData.youtube,
                      );

                      dataBase.qrCodeData = dataBase.generateQRCodeData();

                      await BlocProvider.of<AddDataBaseCubit>(context)
                          .addDataBase(dataBase);

                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    }else{
                      CustomToast.showSimpleToast(msg: "Please Enter Name");
                    }

                  },),

              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
