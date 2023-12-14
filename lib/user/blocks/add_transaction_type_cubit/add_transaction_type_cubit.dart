
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
      var transactionType = Hive.box<TransactionTypeModel>(ApiNames.kTransactionTypes);
      transactionType.add(model);
      print(transactionType.values);
      emit(AddTransactionTypeSuccessState());
      print('success');
  }
}
