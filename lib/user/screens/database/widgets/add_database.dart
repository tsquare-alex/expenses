import 'dart:convert';
import 'dart:typed_data';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/constants/validation.dart';
import '../../../../general/packages/input_fields/GenericTextField.dart';
import '../../../../general/packages/localization/Localizations.dart';
import '../../../../general/widgets/MyText.dart';
import '../cubit/add_database_cubit/add_data_base_cubit.dart';
import '../cubit/my_expansion_cubit/my_expansion_cubit.dart';
import 'build_category_expansion.dart';

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
      scannedData = ScannedData(
        category: qrCodeValues[0],
        name: qrCodeValues[1],
        phone: qrCodeValues[2],
        address: qrCodeValues[3],
        socialAddress: qrCodeValues[4],
        note: qrCodeValues[5],
          emailAddress: qrCodeValues[8],
          date: qrCodeValues[9],
          job: qrCodeValues[10]
      );


      // Now, you can use these values where needed, such as replacing text form field values.
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
                      color: MyColors.black,
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
                      type: TextInputType.emailAddress,
                      action: TextInputAction.next,
                      validate: (value) => validateField(value),
                      label: tr(context, "enterName"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: tr(context, "phoneNumber"),
                      color: MyColors.black,
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
                      controller: dataBaseCubit.phoneController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.phone,
                      action: TextInputAction.next,
                      validate: (value) => validateField(value),
                      label: tr(context, "enterPhone"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: tr(context, "databaseJob"),
                      color: MyColors.black,
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
                      color: MyColors.black,
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
                      color: MyColors.black,
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
                      color: MyColors.black,
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
                      controller: dataBaseCubit.dateController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.name,
                      action: TextInputAction.next,
                      validate: (value) => validateField(value),
                      label: tr(context, "databaseImportantHistory"),
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
                      color: MyColors.black,
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
                      color: MyColors.black,
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
                                  color: MyColors.black,
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
                              child: Image.asset(Res.cameraIc),
                            ),
                            const SizedBox(width: 20,),
                            Container(
                              height: 30.0,
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            const SizedBox(width: 20,),
                            GestureDetector(
                              onTap: () async {
                                await dataBaseCubit.getImageFromGallery();
                              },
                              child: Image.asset(Res.galleryIc),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12,),
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
                        child: Image.asset(Res.bardCodeIc),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              DefaultButton(title: tr(context, "add"),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  onTap: () async {
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
                  socialAddress:
                  dataBaseCubit.socialAddressController.text.isNotEmpty
                      ? dataBaseCubit.socialAddressController.text
                      : scannedData.socialAddress,
                  note: dataBaseCubit.noteController.text.isNotEmpty
                      ? dataBaseCubit.noteController.text
                      : scannedData.note,
                  image: dataBaseCubit.imageBytes ?? Uint8List.fromList([]),
                  emailAddress: dataBaseCubit.emailAddressController.text.isNotEmpty ? dataBaseCubit.emailAddressController.text
                      : scannedData.emailAddress,
                  date: dataBaseCubit.dateController.text.isNotEmpty
                    ? dataBaseCubit.dateController.text :scannedData.date,
                  job: dataBaseCubit.jobController.text.isNotEmpty ? dataBaseCubit.jobController.text : scannedData.job
                );

                // Ensure QR code data is generated before adding to Hive
                dataBase.qrCodeData = dataBase.generateQRCodeData();

                // Continue with adding data to Hive
                await BlocProvider.of<AddDataBaseCubit>(context)
                    .addDataBase(dataBase);

                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              }),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
