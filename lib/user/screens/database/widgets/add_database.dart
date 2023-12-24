import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:expenses/user/screens/database/cubit/add_database_cubit/add_data_base_cubit.dart';
import 'package:expenses/user/screens/database/cubit/add_database_cubit/add_data_base_cubit.dart';
import 'package:expenses/user/screens/database/cubit/database_cubit.dart';
import 'package:expenses/user/screens/home/home_imports.dart';
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
  // final Function onDataChanged;
  //
  // const AddDatabase({super.key, required this.onDataChanged});
  @override
  State<AddDatabase> createState() => _AddDatabaseState();
}

class _AddDatabaseState extends State<AddDatabase> {
  MyExpansionCubit myCubit = MyExpansionCubit();


  AddDataBaseCubit dataBaseCubit = AddDataBaseCubit();


  final CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection('your_collection_name');

  String _documentNumber = '';
  String _documentData = '';
  String _scanResult = 'QR Code Result';

  Future<void> addDataToFirestore() async {
    try {
      // Document ID from scanned QR code
      String documentId = '12345678';

      // Add data to Firestore
      await _collectionReference.doc(documentId).set({
        'name': 'John Doe',
        'phone': '123-456-7890',
        'email': 'john.doe@example.com',
        // Add more fields as needed
      });

      print('Data added to Firestore with document ID: $documentId');
    } catch (e) {
      print('Error adding data to Firestore: $e');
    }
  }

  Future<void> fetchDataFromFirestore(String documentNumber) async {
    try {
      DocumentSnapshot documentSnapshot =
      await _collectionReference.doc(documentNumber).get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>?;

        if (data != null) {
          String formattedData = '';

          data.entries.forEach((entry) {
            formattedData += '${entry.key}: ${entry.value}\n';
          });

          setState(() {
            _documentData = formattedData;
          });
        }
      } else {
        print('No data found for document number $documentNumber');
        setState(() {
          _documentData = 'No data found';
        });
      }
    } catch (e) {
      print('Error fetching data from Firestore: $e');
    }
  }
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
                    onPressed: () async {
                      try {
                        final qrCode = await FlutterBarcodeScanner.scanBarcode(
                          '#ff6666',
                          'Cancel',
                          true,
                          ScanMode.QR,
                        );

                        if (!mounted) return;

                        setState(() {
                          _documentNumber = qrCode;
                          _scanResult = qrCode;
                          _documentData = '';
                        });

                        print("QRCode_Result:--");
                        print(qrCode);

                        // Fetch data from Firebase based on the scanned QR code result
                        // await fetchDataFromFirestore(_documentNumber);
                      } on PlatformException {
                        setState(() {
                          _scanResult = 'Failed to scan QR Code.';
                        });
                      }
                    },
                    child: Text('Scan QR'),
                  ),
                  SizedBox(height: 20.0,),
                  Text('Scan Result: $_scanResult'),
                  Text(
                    _documentData,
                    style: TextStyle(
                      fontFamily: 'Courier New', // Use a monospaced font
                    ),
                  ),
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
                    onPressed: () async{
                      myCubit.onPressedHandler();

                      var dataBase = DatabaseModel(
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
                        name:"${myCubit.firstNameController} ${myCubit.lastNameController}",
                      );
                      if (myCubit.state is MyExpansionError) {

                      } else {
                        await BlocProvider.of<AddDataBaseCubit>(context).addDataBase(dataBase);
                        // Emit a state indicating that data is added successfully
                        // BlocProvider.of<DatabaseCubit>(context).emit(DatabaseAdded());
                        // AutoRouter.of(context).pop();

                        if(context.mounted){
                          Navigator.of(context).pop();
                        }

                        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(index: 1)));
                       // AutoRouter.of(context).replace(HomeRoute(index: 1));
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
