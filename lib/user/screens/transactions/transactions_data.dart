part of 'transactions_imports.dart';

class TransactionsData{

  List<TransactionModel> model = [
    TransactionModel(
      id: 9,
      name: "expense",
      image: Res.expense,
    ),
    TransactionModel(
      id: 10,
      name: "target",
      image: Res.budget,
    ),
    TransactionModel(
      id: 11,
      name: "cashTransactions",
      image: Res.cashTransactions,
    ),
    TransactionModel(
      id: 12,
      name: "recurringTransactions",
      image: Res.repeatedTransactions,
    ),
  ];
}