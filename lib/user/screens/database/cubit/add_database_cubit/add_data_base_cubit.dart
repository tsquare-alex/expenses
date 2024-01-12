
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../general/constants/constants.dart';
import '../../../../models/database_model/database_model.dart';

part 'add_data_base_state.dart';

class AddDataBaseCubit extends Cubit<AddDataBaseState> {
  AddDataBaseCubit() : super(AddDataBaseInitial());

  final TextEditingController categoryController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController socialAddressController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();

  ByteData? qrBytes;

  // Future<void> generateAndSaveQRCode(DatabaseModel dataBase) async {
  //   emit(AddDataBaseLoading());
  //   try {
  //     var dataBaseBox = Hive.box<DatabaseModel>('your_database_name');
  //
  //     // Set QR code data in the model
  //     dataBase.qrCodeData = dataBase.generateQRCodeData();
  //
  //     // Generate QR code image
  //     final QrPainter painter = QrPainter(
  //       data: dataBase.qrCodeData ?? '',
  //       version: QrVersions.auto,
  //     );
  //
  //     // Convert image to bytes
  //     final img = await painter.toImageData(200.0);
  //     qrBytes = ByteData.view(Uint8List.fromList(img!.buffer.asUint8List()).buffer);
  //
  //     if (qrBytes != null) {
  //       dataBase.image = qrBytes!.buffer.asUint8List();
  //       dataBase.qrCodeImage = qrBytes!.buffer.asUint8List();
  //
  //       // Save data with QR code in Hive
  //       await dataBaseBox.add(dataBase);
  //
  //       emit(AddDataBaseSuccess());
  //     } else {
  //       emit(AddDataBaseFailure(errorMessage: 'Failed to generate QR code.'));
  //     }
  //   } catch (e) {
  //     emit(AddDataBaseFailure(errorMessage: e.toString()));
  //   }
  // }
  Future<void> generateAndSaveQRCode(DatabaseModel dataBase) async {
    emit(AddDataBaseLoading());
    try {
      var dataBaseBox = Hive.box<DatabaseModel>(database);

      // Set QR code data in the model
      dataBase.qrCodeData = dataBase.generateQRCodeData();

      // Generate QR code image
      final QrPainter painter = QrPainter(
        data: dataBase.qrCodeData ?? '',
        version: QrVersions.auto,
      );

      // Convert image to bytes
      final img = await painter.toImageData(200.0);
      qrBytes = ByteData.view(Uint8List.fromList(img!.buffer.asUint8List()).buffer);

      if (qrBytes != null) {
        dataBase.image = qrBytes!.buffer.asUint8List();
        dataBase.qrCodeImage = qrBytes!.buffer.asUint8List();

        // Save data with QR code in Hive
        await dataBaseBox.add(dataBase);

        emit(AddDataBaseSuccess());
      } else {
        emit(AddDataBaseFailure(errorMessage: 'Failed to generate QR code.'));
      }
    } catch (e) {
      emit(AddDataBaseFailure(errorMessage: e.toString()));
    }
  }

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

  Future<void> getImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageCamera = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (imageCamera != null) {
      imageBytes = await _getImageBytes(imageCamera);
      emit(AddDataBaseImageSuccess());
    }
  }

  Future<void> getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageGallery = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageGallery != null) {
      imageBytes = await _getImageBytes(imageGallery);
      emit(AddDataBaseImageSuccess());
    }
  }

  Future<Uint8List> _getImageBytes(XFile image) async {
    return await image.readAsBytes();
  }
}
