import 'package:equatable/equatable.dart';
import 'package:expenses/general/constants/constants.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../general/models/data_base_model/data_base_model.dart';


part 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(DatabaseInitial());


  List<DatabaseModel>? dataBase;

  fetchAllDatabase(){
    emit(DatabaseInitial());
    var databaseData = Hive.box<DatabaseModel>(database);
    dataBase = databaseData.values.toList();
    emit(DatabaseSuccess());
  }
}
