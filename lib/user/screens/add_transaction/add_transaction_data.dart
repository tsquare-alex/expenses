part of 'add_transaction_imports.dart';

class AddTransactionData{

  GenericBloc<bool> contentCubit = GenericBloc(false);

  final GlobalKey<DropdownSearchState> transactionsDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> targetsDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> expenseDropKey = GlobalKey();


  //
  int? transactionId;
  int? targetsId;
  int? expenseId;
  DropdownModel? selectedTransactions;
  DropdownModel? selectedTargets;
  DropdownModel? selectedExpense;

  List<DropdownModel> transactions=[
    DropdownModel(
        id:0,name:"سحب"
    ),
    DropdownModel(
        id:1,name:"تحويل"
    ),
  ];

  List<DropdownModel> targets=[
    DropdownModel(
        id:0,name:"استثمار"
    ),
    DropdownModel(
        id:1,name:"توفير"
    ),
    DropdownModel(
        id:2,name:"شراء سيارة"
    ),
  ];

  List<DropdownModel> expenses=[
    DropdownModel(
        id:0,name:"الالتزامات"
    ),
    DropdownModel(
        id:1,name:"التسوق والشراء"
    ),
  ];

  Future<List<DropdownModel>> getTransactions(BuildContext context) async {
    return transactions;
  }

  void setSelectCountry(DropdownModel? model) {
    selectedTransactions = model;
    transactionId = model?.id;
  }

  Future<List<DropdownModel>> getExpense(BuildContext context) async {
    return expenses;
  }

  void setSelectExpense(DropdownModel? model) {
    selectedExpense= model;
    expenseId = model?.id;
  }

  Future<List<DropdownModel>> getTargets(BuildContext context) async {
    return targets;
  }

  void setSelectTargets(DropdownModel? model) {
    selectedTargets = model;
    targetsId = model?.id;
  }
}