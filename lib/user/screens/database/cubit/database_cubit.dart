import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:expenses/general/constants/constants.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../general/models/data_base_model/data_base_model.dart';


part 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(DatabaseInitial());

  final CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection('your_collection_name');

  String _documentNumber = '';
  String _documentData = '';
  String _scanResult = 'QR Code Result';

  Future<void> fetchDataFromFirestore(String documentNumber) async {
    try {
      emit(DatabaseLoading());

      DocumentSnapshot documentSnapshot =
      await _collectionReference.doc(documentNumber).get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>?;

        if (data != null) {
          String formattedData = '';

          data.entries.forEach((entry) {
            formattedData += '${entry.key}: ${entry.value}\n';
          });

          emit(DatabaseDataFirestoreLoaded(
            documentNumber: documentNumber,
            documentData: formattedData,
          ));
        }
      } else {
        emit(DatabaseScannedResult(scanResult: documentNumber));
      }
    } catch (e) {
      emit(DatabaseError(errorMessage: 'Error fetching data from Firestore: $e'));
    }
  }

  Future<void> scanQRCode() async {
    try {
      var result = await BarcodeScanner.scan();
      String documentNumber = result.rawContent ?? 'Cancelled';

      emit(DatabaseScannedResult(scanResult: documentNumber));

      // Fetch data from Firebase based on the scanned QR code result
      await fetchDataFromFirestore(documentNumber);
    } on Exception catch (e) {
      emit(DatabaseError(errorMessage: 'Failed to scan QR Code: $e'));
    }
  }
  //
  // Future<void> fetchDataFromFirestore(String documentNumber) async {
  //   try {
  //     emit(DatabaseLoading());
  //
  //     DocumentSnapshot documentSnapshot =
  //     await _collectionReference.doc(documentNumber).get();
  //
  //     if (documentSnapshot.exists) {
  //       var data = documentSnapshot.data() as Map<String, dynamic>?;
  //
  //       if (data != null) {
  //         String formattedData = '';
  //
  //         data.entries.forEach((entry) {
  //           formattedData += '${entry.key}: ${entry.value}\n';
  //         });
  //
  //         emit(DatabaseDataFirestoreLoaded(
  //           documentNumber: documentNumber,
  //           documentData: formattedData,
  //           scanResult: _scanResult,
  //         ));
  //       }
  //     } else {
  //       emit(DatabaseScannedResult(scanResult: documentNumber));
  //     }
  //   } catch (e) {
  //     emit(DatabaseError(errorMessage: 'Error fetching data from Firestore: $e'));
  //   }
  // }
  //
  // Future<void> scanQRCode() async {
  //   try {
  //     var result = await BarcodeScanner.scan();
  //     String documentNumber = result.rawContent ?? 'Cancelled';
  //
  //     emit(DatabaseScannedResult(scanResult: documentNumber));
  //
  //     // Fetch data from Firebase based on the scanned QR code result
  //     await fetchDataFromFirestore(documentNumber);
  //   } on Exception catch (e) {
  //     emit(DatabaseError(errorMessage: 'Failed to scan QR Code: $e'));
  //   }
  // }

  Future<void> deleteDatabaseItem(DatabaseModel item) async {
    try {
      var databaseDataBox = await Hive.openBox<DatabaseModel>(database);
      await databaseDataBox.delete(item.key);

      // Fetch updated data after deletion
      var updatedData = databaseDataBox.values.toList();
      emit(DatabaseDataLoaded(dataBaseModel: updatedData));
      emit(DeleteDatabaseSuccess());
    } catch (e) {
      print("Error deleting item: $e");
      emit(DatabaseError(errorMessage: "Error deleting item: $e"));
    }
  }

  List<DatabaseModel>? dataBase;

  fetchAllDatabase(){
    emit(DatabaseInitial());
    var databaseData = Hive.box<DatabaseModel>(database);
    dataBase = databaseData.values.toList();
    emit(DatabaseSuccess());
  }
}
