import 'package:bloc/bloc.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:hive_flutter/adapters.dart';
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


}
