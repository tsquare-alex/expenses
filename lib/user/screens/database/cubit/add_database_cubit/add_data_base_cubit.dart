import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../../general/constants/constants.dart';

part 'add_data_base_state.dart';

class AddDataBaseCubit extends Cubit<AddDataBaseState> {
  AddDataBaseCubit() : super(AddDataBaseInitial());

  addDataBase(DatabaseModel dataBase)async{
    emit(AddDataBaseLoading());
    try{
      var dataBaseBox = Hive.box<DatabaseModel>(database);
      await dataBaseBox.add(dataBase);
      // await dataBaseBox.clear();
      emit(AddDataBaseSuccess());
    }catch(e){
      emit(AddDataBaseFailure(errorMessage: e.toString()));
    }
  }
  Uint8List? imageBytes;
  getImage(BuildContext context) async {
    try {
      final ImagePicker picker = ImagePicker();

      // Show a dialog to let the user choose between gallery and camera
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose Image Source"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    final XFile? imageGallery = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (imageGallery != null) {
                      imageBytes = await _getImageBytes(imageGallery);
                      emit(AddDataBaseImageSuccess());
                    }
                  },
                  child: Text("Gallery"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    final XFile? imageCamera = await picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (imageCamera != null) {
                      imageBytes = await _getImageBytes(imageCamera);
                      emit(AddDataBaseImageSuccess());
                    }
                  },
                  child: Text("Camera"),
                ),
              ],
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
  // getImage() async {
  //   try {
  //     final ImagePicker picker = ImagePicker();
  //     final XFile? imageCamera = await picker.pickImage(
  //         source: ImageSource.camera);
  //
  //     if (imageCamera != null) {
  //       imageBytes = await _getImageBytes(imageCamera);
  //       emit(AddDataBaseImageSuccess());
  //     } else {}
  //   } catch (e) {}
  // }

  Future<Uint8List> _getImageBytes(XFile image) async {
    return await image.readAsBytes();
  }

  // Add a method to add data to Firestore (if needed)
  Future<void> addDataToFirestore(DatabaseModel dataBase) async {
    try {
      final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('collection_name');

      // Assuming you want to use a unique document ID from Hive for Firestore
      String documentId = await _addDataToFirestore(dataBase);

      print('Data added to Firestore with document ID: $documentId');
    } catch (e) {
      print('Error adding data to Firestore: $e');
    }
  }

  Future<String> _addDataToFirestore(DatabaseModel dataBase) async {
    final CollectionReference _collectionReference =
    FirebaseFirestore.instance.collection('collection_name');

    // Generate a unique document ID (e.g., using Hive box length)
    int documentId = Hive.box<DatabaseModel>(database).length;

    // Add data to Firestore
    await _collectionReference.doc('$documentId').set({
      'name': "montaser",
      'phone': "01205680016",
      'email': "mon@gmail.com",
      // Add more fields as needed
    });

    return '$documentId';
  }
  String _documentNumber = '';
  String _documentData = '';
  String scanResult = 'QR Code Result';
  // Future<void> scanBarcode() async {
  //   try {
  //     final qrCode = await FlutterBarcodeScanner.scanBarcode(
  //       '#ff6666',
  //       'Cancel',
  //       true,
  //       ScanMode.QR,
  //     );
  //
  //     // if (!mounted) return;
  //
  //     emit(AddDataBaseScanResult(scanResult: qrCode));
  //
  //     print("QRCode_Result:--");
  //     print(qrCode);
  //
  //     // Fetch data from Firebase based on the scanned QR code result
  //     await fetchDataFromFirestore(qrCode);
  //   } on PlatformException {
  //     emit(AddDataBaseFailure(errorMessage: 'Failed to scan QR Code.'));
  //   }
  // }

  // Add a method to fetch data from Firestore (if needed)
  Future<void> fetchDataFromFirestore(String documentNumber) async {
    try {
      final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('collection_name');

      DocumentSnapshot documentSnapshot =
      await _collectionReference.doc(documentNumber).get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>?;

        if (data != null) {
          String formattedData = '';

          data.entries.forEach((entry) {
            formattedData += '${entry.key}: ${entry.value}\n';
          });

          emit(AddDataBaseFirestoreDataSuccess( formattedData: formattedData));
        }
      } else {
        print('No data found for document number $documentNumber');
        emit(AddDataBaseFirestoreDataFailure( errorMessage:'No data found',));
      }
    } catch (e) {
      print('Error fetching data from Firestore: $e');
      emit(AddDataBaseFirestoreDataFailure( errorMessage:'Error fetching data'));
    }
  }


}
