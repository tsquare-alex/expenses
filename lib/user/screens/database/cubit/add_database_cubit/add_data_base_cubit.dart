import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
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
      var dataBaseBox = Hive.box<DatabaseModel>(databaseBox);
      await dataBaseBox.add(dataBase);
      // await dataBaseBox.clear();
      emit(AddDataBaseSuccess());
    }catch(e){
      emit(AddDataBaseFailure(errorMessage: e.toString()));
    }
  }
  Uint8List? imageBytes;

  getImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? imageCamera = await picker.pickImage(
          source: ImageSource.camera);

      if (imageCamera != null) {
        imageBytes = await _getImageBytes(imageCamera);
        emit(AddDataBaseImageSuccess());
      } else {}
    } catch (e) {}
  }

  Future<Uint8List> _getImageBytes(XFile image) async {
    return await image.readAsBytes();
  }

}
