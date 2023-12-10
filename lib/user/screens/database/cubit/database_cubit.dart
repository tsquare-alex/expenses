import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../general/models/data_base_model/data_base_model.dart';


part 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(DatabaseInitial());

   List<DataBaseModel> dataBaseModel = [
     DataBaseModel("T Square", "شركة", "01234567890", "مصر الجديدة , القاهرة , مصر",
         name: "Montaser", email: "mon@gmail.com"),
     DataBaseModel("Alpha", "شركة", "01234567890", "مصر الجديدة , القاهرة , مصر",
         name: "Ahmed", email: "email@gmail.com"),
     DataBaseModel("Alpha", "شركة", "01234567890", "مصر الجديدة , القاهرة , مصر",
         name: "Ibrahim", email: "ibrahim@gmail.com"),
   ];


  bool isExpanded = false;

  void toggleExpanded() {
    isExpanded = !isExpanded;
    emit(DatabaseToggle(isExpanded: isExpanded));
  }


}
