
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../../general/constants/constants.dart';
import '../../../../models/database_model/database_model.dart';
import 'package:path_provider/path_provider.dart';

part 'add_data_base_state.dart';

class AddDataBaseCubit extends Cubit<AddDataBaseState> {
  AddDataBaseCubit() : super(AddDataBaseInitial());

  final TextEditingController categoryController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController socialAddressController = TextEditingController();
  final TextEditingController noteController = TextEditingController();


  final GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();

  ByteData? qrBytes;



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
