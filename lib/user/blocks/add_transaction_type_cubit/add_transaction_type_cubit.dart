
import 'package:expenses/general/utilities/utils_functions/ApiNames.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_type_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'add_transaction_type_state.dart';

class AddTransactionTypeCubit extends Cubit<AddTransactionTypeState> {
  AddTransactionTypeCubit() : super(AddTransactionTypeInitial());

  static AddTransactionTypeCubit get(context) => BlocProvider.of(context);

  addTransactionType(TransactionTypeModel model) async{
    emit(AddTransactionTypeLoadingState());
    print(';ss');
    var transactionType = Hive.box<TransactionTypeModel>("transactionTypeBox");
    transactionType.add(model);
    print(transactionType.values.length);
    emit(AddTransactionTypeSuccessState());
    print('success');

  }

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
