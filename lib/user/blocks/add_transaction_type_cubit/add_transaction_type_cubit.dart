
import 'package:expenses/general/utilities/utils_functions/ApiNames.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_type_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'add_transaction_type_state.dart';

class AddTransactionTypeCubit extends Cubit<AddTransactionTypeState> {
  AddTransactionTypeCubit() : super(AddTransactionTypeInitial());

  static AddTransactionTypeCubit get(context) => BlocProvider.of(context);

  List<TransactionTypeModel> transactionType = [];

  addTransactionType(TransactionTypeModel model) async{
    emit(AddTransactionTypeLoadingState());
    print(';ss');
    try{
      final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
      // var transactionType = Hive.box<TransactionTypeModel>(ApiNames.kTransactionTypes);
      box.add(model);
      print(box.values.length);
      fetchData();
      emit(AddTransactionTypeSuccessState());
      print('success');
      transactionType = box.values.cast<TransactionTypeModel>().toList();
      print(transactionType[1].name);
      await box.close();
      fetchData();
    }catch (e){
      emit(AddTransactionTypeErrorState());
    }

  }

  Future<void> fetchData() async {
    final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
    try {
      transactionType = box.values.map((dynamic value) {
        if (value is TransactionTypeModel) {
          return value;
        } else {
          return TransactionTypeModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();

    } catch (e) {
      print('Error fetching data from Hive: $e');
    } finally {
      await box.close();
    }
  }

  // Future<void> fetchData() async {
  //   final box = await Hive.openBox<TransactionTypeModel>(ApiNames.kTransactionTypes);
  //   transactionType = box.values.cast<TransactionTypeModel>().toList();
  //   await box.close();
  // }

  // Future<void> addData() async {
  //   final box = await Hive.openBox('myBox');
  //   final newPerson = Person()..name = 'New Person'..age = 25;
  //   box.add(newPerson);
  //   await box.close();
  //   fetchData(); // Refresh data after adding
  // }

  // void clearBoxData() async {
  //   final box = await Hive.openBox('myBox');
  //
  //   try {
  //     // Clear all data in the box
  //     await box.clear();
  //     print('Box data cleared successfully');
  //   } catch (e) {
  //     print('Error clearing box data: $e');
  //   } finally {
  //     // Close the Hive box
  //     await box.close();
  //   }
  // }
}
