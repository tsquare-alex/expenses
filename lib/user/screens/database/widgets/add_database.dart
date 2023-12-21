import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:expenses/user/screens/database/cubit/add_database_cubit/add_data_base_cubit.dart';
import 'package:expenses/user/screens/database/cubit/add_database_cubit/add_data_base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/widgets/MyText.dart';
import '../cubit/my_expansion_cubit/my_expansion_cubit.dart';
import '../database_imports.dart';
import 'build_address_expansion.dart';
import 'build_category_expansion.dart';
import 'build_comment_expansion.dart';
import 'build_date_expansion.dart';
import 'build_email_expansion.dart';
import 'build_location_expansion.dart';
import 'build_names_expansion.dart';
import 'build_phone_expansion.dart';
import 'build_work_expansion.dart';
import 'my_expansion.dart';

class AddDatabase extends StatefulWidget {
  @override
  State<AddDatabase> createState() => _AddDatabaseState();
}

class _AddDatabaseState extends State<AddDatabase> {
  MyExpansionCubit myCubit = MyExpansionCubit();

  Uint8List? imageBytes;

  getImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? imageCamera = await picker.pickImage(
          source: ImageSource.camera);

      if (imageCamera != null) {
        imageBytes = await _getImageBytes(imageCamera);
        setState(() {

        });
      } else {}
    } catch (e) {}
  }

  Future<Uint8List> _getImageBytes(XFile image) async {
    return await image.readAsBytes();
  }

  var getResult = 'QR Code Result';

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }

  AddDataBaseCubit dataBaseCubit = AddDataBaseCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddDataBaseCubit(),
      child: BlocListener<AddDataBaseCubit, AddDataBaseState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: Scaffold(
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
                  ElevatedButton(
                    onPressed: () {
                      scanQRCode();
                    },
                    child: Text('Scan QR'),
                  ),
                  SizedBox(height: 20.0,),
                  Text(getResult),
                  BlocBuilder<AddDataBaseCubit, AddDataBaseState>(
                    bloc: dataBaseCubit,
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () async {
                          // await myCubit.getImage();
                          await dataBaseCubit.getImage();
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              child: Image.asset(
                                "assets/images/user.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            MyText(
                              title: "أضف صورة",
                              color: MyColors.primary,
                              size: 12.sp,
                            ),
                            if(state is AddDataBaseImageSuccess)
                              Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.memory(dataBaseCubit.imageBytes!)),
                            // dataBaseCubit.imageBytes != null ? Container(
                            //     height: 100,
                            //     width: 100,
                            //     child: Image.memory(dataBaseCubit.imageBytes!)) : Container(),
                            // if (myCubit.state is MyExpansionAddImageSuccess) // Check if image is picked
                            //   Container(
                            //     width: 100, // Set the width according to your design
                            //     height: 100, // Set the height according to your design
                            //     child: Image.memory((myCubit.state as MyExpansionAddImageSuccess).pickedImage),
                            //   ),
                          ],
                        ),
                      );
                    },
                  ),

                  // MyExpansionTile(),
                  BuildCategoryExpansion(
                    categoryFormKey: myCubit.categoryFormKey,
                    categoryController: myCubit.categoryController,
                  ),
                  const SizedBox(height: 16.0),
                  BuildNamesExpansion(
                    namesFormKey: myCubit.namesFormKey,
                    designationController: myCubit.designationController,
                    firstNameController: myCubit.firstNameController,
                    lastNameController: myCubit.lastNameController,
                  ),
                  const SizedBox(height: 16.0),
                  BuildPhoneExpansion(
                    phoneFormKey: myCubit.phoneFormKey,
                    phoneController: myCubit.phoneController,
                  ),
                  const SizedBox(height: 16.0),
                  BuildWorkExpansion(
                    workPositionController: myCubit.workPositionController,
                    departmentController: myCubit.departmentController,
                    companyController: myCubit.companyController,
                    workPlaceFormKey: myCubit.workPlaceFormKey,
                  ),
                  const SizedBox(height: 16.0),
                  BuildLocationExpansion(
                    locationFormKey: myCubit.locationFormKey,
                    countryController: myCubit.countryController,
                    governorateController: myCubit.governorateController,
                    cityController: myCubit.cityController,
                    streetController: myCubit.streetController,
                    postalController: myCubit.postalController,
                    buildingNumberController: myCubit.buildingNumberController,
                    apartmentNumberController:
                    myCubit.apartmentNumberController,
                    addressController: myCubit.addressController,
                    theNewAddressController: myCubit.theNewAddressController,
                  ),
                  const SizedBox(height: 16.0),
                  BuildEmailExpansion(
                      emailFormKey: myCubit.emailFormKey,
                      emailController: myCubit.emailController),
                  const SizedBox(height: 16.0),
                  BuildDateExpansion(
                      dateFormKey: myCubit.dateFormKey,
                      dateLocationController: myCubit.dateLocationController,
                      dateTimeController: myCubit.dateTimeController,
                      dateDetailsController: myCubit.dateDetailsController,
                      dateController: myCubit.dateController),
                  const SizedBox(height: 16.0),
                  BuildCommentExpansion(
                      commentController: myCubit.commentController,
                      commentFormKey: myCubit.commentFormKey),
                  const SizedBox(height: 16.0),
                  BuildAddressExpansion(
                      socialAddressFormKey: myCubit.socialAddressFormKey,
                      socialWebController: myCubit.socialWebController,
                      facebookController: myCubit.facebookController,
                      instagramController: myCubit.instagramController,
                      youtubeController: myCubit.youtubeController,
                      messengerController: myCubit.messengerController,
                      theSocialController: myCubit.theSocialController),
                  ElevatedButton(
                    onPressed: () {
                      myCubit.onPressedHandler();

                      var dataBase = DatabaseModel(
                        name: "${myCubit.firstNameController.text} ${myCubit.lastNameController.text}",
                        category: myCubit.categoryController.text,
                        adjective: myCubit.designationController.text,
                        firstName: myCubit.firstNameController.text,
                        secondName: myCubit.lastNameController.text,
                        phoneNumber: myCubit.phoneController.text,
                        workName: myCubit.workPositionController.text,
                        department: myCubit.departmentController.text,
                        company: myCubit.companyController.text,
                        country: myCubit.countryController.text,
                        governorate: myCubit.governorateController.text,
                        city: myCubit.cityController.text,
                        street: myCubit.streetController.text,
                        buildingNumber: myCubit.buildingNumberController.text,
                        apartmentNumber: myCubit.apartmentNumberController.text,
                        postalNumber: myCubit.postalController.text,
                        emailAddress: myCubit.emailController.text,
                        eventTitle: myCubit.dateLocationController.text,
                        eventDate: myCubit.dateTimeController.text,
                        eventDetails: myCubit.dateDetailsController.text,
                        notes: myCubit.commentController.text,
                        web: myCubit.socialWebController.text,
                        facebook: myCubit.facebookController.text,
                        instagram: myCubit.instagramController.text,
                        youtube: myCubit.youtubeController.text,
                        messenger: myCubit.messengerController.text,
                        image: dataBaseCubit.imageBytes ?? Uint8List.fromList([]),
                      );
                      if (myCubit.state is MyExpansionError) {

                      } else {
                        BlocProvider.of<AddDataBaseCubit>(context).addDataBase(
                            dataBase);
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => Database()));
                      }
                    },
                    child: MyText(
                      title: "حفظ",
                      color: MyColors.white,
                      size: 16,
                      fontWeight: FontWeight.bold,
                      alien: TextAlign.center,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.primary,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
