import 'package:hive/hive.dart';
part 'budget_model.g.dart';

@HiveType(typeId: 30)
class BudgetModel extends HiveObject {
  @HiveField(0)
  double budgetValue;
  @HiveField(1)
  String transactionName;
  @HiveField(2)
  String waletName;
  @HiveField(3)
  String startBudget;
  @HiveField(4)
  String? transactionRepeat;
  @HiveField(5)
  double? percentValue;
  @HiveField(6)
  String endBudget;
  @HiveField(7)
  String addNote;
  @HiveField(8)
  bool? notification;
  @HiveField(9)
  bool? favoitate;
  @HiveField(10)
  double? transactionValue;
  BudgetModel(
      {required this.budgetValue,
      required this.transactionName,
      required this.waletName,
      required this.startBudget,
      this.transactionRepeat,
      this.percentValue,
      required this.endBudget,
      required this.addNote,
      this.notification,
      this.favoitate,
      this.transactionValue});

  Map<String, dynamic> toJson() {
    return {
      'budgetValue': budgetValue,
      'transactionName': transactionName,
      'waletName': waletName,
      'startBudget': startBudget,
      'transactionRepeat': transactionRepeat,
      'percentValue': percentValue,
      'endBudget': endBudget,
      'addNote': addNote,
      'notification': notification,
      'favoitate': favoitate,
      'transactionValue': transactionValue,
    };
  }


  factory BudgetModel.fromJson(Map<String, dynamic> json) {
    return BudgetModel(
      budgetValue: json['budgetValue']??0.0,
      transactionName: json['transactionName']?? '',
      waletName: json['waletName']??'',
      startBudget: json['startBudget']??'',
      transactionRepeat: json['transactionRepeat']??'',
      percentValue: json['percentValue']??0.0,
      endBudget: json['endBudget']??'',
      addNote: json['addNote']??'',
      notification: json['notification']??false,
      favoitate: json['favoitate']??false,
      transactionValue: json['transactionValue']??0.0,
    );
  }
}
