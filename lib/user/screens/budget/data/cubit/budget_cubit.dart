import 'package:expenses/res.dart';
import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:expenses/user/models/transaction_model/transaction_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_content_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_type_model.dart';
import 'package:expenses/user/screens/budget/data/cubit/budget_state.dart';
import 'package:expenses/user/screens/budget/data/model/budget_model.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../../general/constants/constants.dart';

class BudgetCubit extends Cubit<BudgetState> {

  List<TransactionTypeModel> commitmentsList = [];
  Future<void> initTransactionData() async {
    final remoteCashTransactionBox = await Hive.openBox<TransactionTypeModel>("cashTransactionBox");
    final remoteTransactionBox = await Hive.openBox<TransactionTypeModel>("transactionBox");
    final remoteShoppingBox = await Hive.openBox<TransactionTypeModel>("transactionShoppingBox");
    final remoteTargetBox = await Hive.openBox<TransactionTypeModel>("targetBox");
    var remoteCashBoxItems = remoteCashTransactionBox.values.cast<TransactionTypeModel>().toList();
    var remoteTargetBoxItems = remoteTargetBox.values.cast<TransactionTypeModel>().toList();
    var remoteCommitmentBoxItems = remoteTransactionBox.values.cast<TransactionTypeModel>().toList();
    var remoteShoppingBoxItems = remoteShoppingBox.values.cast<TransactionTypeModel>().toList();
    var remoteCashTransactionContent = transactions[3].content;
    var remoteCommitmentContent = transactions[0].content;
    var remoteShoppingContent = transactions[1].content;
    var remoteTargetContent = transactions[2].content;
    transactionShopping.clear();
    commitmentsList.clear();
    transactionTargetBBox.clear();
    cashTransactionBox.clear();
    for (var item in remoteCashTransactionContent!) {
      if (!remoteCashBoxItems.any((element) => element.key != item.key)) {
        remoteCashTransactionBox.add(item);
      }
    }
    for (var item in remoteCommitmentContent!) {
      if (!remoteCommitmentBoxItems.any((element) => element.key != item.key)) {
        remoteTransactionBox.add(item);
      }
    }
    for (var item in remoteShoppingContent!) {
      if (!remoteShoppingBoxItems.any((element) => element.key != item.key)) {
        remoteShoppingBox.add(item);
      }
    }
    for (var item in remoteTargetContent!) {
      if (!remoteTargetBoxItems.any((element) => element.key != item.key)) {
        remoteTargetBox.add(item);
      }
    }
    getTransactionsData();
  }

  Future<void> getTransactionsData() async {
    final box = await Hive.openBox<TransactionTypeModel>("cashTransactionBox");
    try {
      var list = box.values.map((dynamic value) {
        if (value is TransactionTypeModel) {
          return value;
        } else {
          return TransactionTypeModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();
      cashTransactionBox.addAll(list);
    } catch (e) {
      //
      print('Error fetching data from Hive: $e');
    }
    final commitmentBox = await Hive.openBox<TransactionTypeModel>("transactionBox");
    try {
      var list = commitmentBox.values.map((dynamic value) {
        if (value is TransactionTypeModel) {
          return value;
        } else {
          return TransactionTypeModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();
      commitmentsList.addAll(list);
    } catch (e) {
      print('Error fetching data from Hive: $e');
    }
    final shoppingBox = await Hive.openBox<TransactionTypeModel>("transactionShoppingBox");
    try {
      var list = shoppingBox.values.map((dynamic value) {
        if (value is TransactionTypeModel) {
          return value;
        } else {
          return TransactionTypeModel();
        }
      }).toList();
      transactionShopping.addAll(list);
    } catch (e) {
      print('Error fetching data from Hive: $e');
    }
    final targetBox = await Hive.openBox<TransactionTypeModel>("targetBox");
    try {
      var list = targetBox.values.map((dynamic value) {
        if (value is TransactionTypeModel) {
          return value;
        } else {
          return TransactionTypeModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();
      transactionTargetBBox.addAll(list);
    } catch (e) {
      print('Error fetching data from Hive: $e');
    } finally {
      await box.close();
    }
  }



  bool checkedValue = false;

  final TextEditingController openDateController = TextEditingController();
  final TextEditingController closeDateController = TextEditingController();
  final TextEditingController budgetBalace = TextEditingController();
  final TextEditingController budgetValueController = TextEditingController();
  final TextEditingController transactionNameController =
      TextEditingController();
  final TextEditingController walletNameController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  BudgetCubit() : super(AddBudgetInitial());

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 30));
  late WalletModel walletModel;
  late TransactionModel transactionModel;
  late List<WalletModel> wallets;
  Future<void> fetchdataFromWallet(context) async {
    var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
    List<WalletModel> data = walletBox.values.toList();
    wallets = data;
  }

  List<AddTransactionModel> transactioList=[];
  Future<void> fetchDataFromTransations(context) async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    var list = box.values.map((dynamic value) {
      if (value is AddTransactionModel) {
        return value;
      } else {
        return AddTransactionModel();
      }
    }).toList();
    transactioList = list;
    box.close();
  }

  List<TransactionTypeModel> transactionShopping=[];
  // Future<void> fetchTransactionShopping(context) async {
  //   transactionShopping.clear();
  //   final box =
  //       await Hive.openBox<TransactionTypeModel>("transactionShoppingBox");
  //   var list = box.values.map((dynamic value) {
  //     if (value is TransactionTypeModel) {
  //       return value;
  //     } else {
  //       return TransactionTypeModel();
  //     }
  //   }).toList();
  //   transactionShopping = list;
  //   box.close();
  // }

  // List<TransactionTypeModel> transactionBox=[];
  // Future<void> fetchTransactionBox(context) async {
  //   transactionBox.clear();
  //   final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
  //   var list = box.values.map((dynamic value) {
  //     if (value is TransactionTypeModel) {
  //       return value;
  //     } else {
  //       return TransactionTypeModel();
  //     }
  //   }).toList();
  //   transactionBox = list;
  //   box.close();
  // }

  List<TransactionTypeModel> transactionTargetBBox=[];
  // Future<void> fetchTransactionTargetBox(context) async {
  //   transactionTargetBBox.clear();
  //   final box = await Hive.openBox<TransactionTypeModel>("targetBox");
  //   var list = box.values.map((dynamic value) {
  //     if (value is TransactionTypeModel) {
  //       return value;
  //     } else {
  //       return TransactionTypeModel();
  //     }
  //   }).toList();
  //   transactionTargetBBox = list;
  //   box.close();
  // }

  List<TransactionTypeModel> cashTransactionBox=[];
  // Future<void> fetchCashTransaction(context) async {
  //   cashTransactionBox.clear();
  //   final box = await Hive.openBox<TransactionTypeModel>("cashTransactionBox");
  //   var list = box.values.map((dynamic value) {
  //     if (value is TransactionTypeModel) {
  //       return value;
  //     } else {
  //       return TransactionTypeModel();
  //     }
  //   }).toList();
  //   cashTransactionBox = list;
  //   box.close();
  // }

  Future addData(BudgetModel model) async {
    emit(AddBudgetLoading());
    var budgetbox = Hive.box<BudgetModel>("budgetBox");
    await budgetbox.add(model);

    try {
      emit(AddBudgetSuccess());
    } catch (e) {
      emit(AddBudgetFaliuer(message: e.toString()));
    }
  }

  Future<void> getBudgetData(context) async {
    emit(AddBudgetLoading());
    await Future.wait([
      fetchDataFromTransations(context),
      fetchdataFromWallet(context),
      initTransactionData(),
      // fetchCashTransaction(context),
      // fetchTransactionBox(context),
      // fetchTransactionTargetBox(
      //   context,
      // ),
      // fetchTransactionShopping(context)
    ]);
    emit(OpenBudget());
  }

  List<BudgetModel> budgetList = [];
  Future<void> fetchData() async {
    emit(AddBudgetInitial());
    var budgetBox = Hive.box<BudgetModel>("budgetBox");
    budgetList = budgetBox.values.toList();
    emit(SuccessFetchData(budgets: budgetList));
  }

  Future<void> budgetValue(
      AddTransactionModel transactionModel, WalletModel walletModel) async {
    double walletValue = walletModel.balance;
    double transactionValue = double.parse(transactionModel.total ?? '0');
    var res = transactionValue / walletValue;
    emit(BudgetValu(value: res));
  }

  double calculatedInitial = 0.0;

  Future<void> calcualteRatio(BuildContext context) async {
    emit(LoadingCalculat());
    var budgetBox = Hive.box<BudgetModel>("budgetBox");
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    var budgetBoxList = budgetBox.values.toList();
    var transactionBoxList = box.values.toList();
    for (int i = 0; i < budgetBoxList.length; i++) {
      calculatedInitial = 0;
      var targetBudet = budgetBoxList
          .firstWhere((element) => element.key == budgetBoxList[i].key);
      targetBudet.transactionValue = 0;
      budgetBox.put(targetBudet.key, targetBudet);

      for (int g = 0; g < transactionBoxList.length; g++) {
        if (budgetBoxList[i].transactionName ==
            transactionBoxList[g].transactionContent?.name) {
          print(budgetBoxList[i].transactionName ==
              transactionBoxList[g].transactionContent?.name);
          var targetBudet = budgetBoxList
              .firstWhere((element) => element.key == budgetBoxList[i].key);
          var total = double.parse(transactionBoxList[g].total!);
          targetBudet.transactionValue = targetBudet.transactionValue! + total;

          await budgetBox.put(targetBudet.key, targetBudet);
          fetchData();

          print(targetBudet.transactionValue);
        }
      }
    }
    emit(SuccessCalculat(calculatedValue: 15));
  }

  List<String> dummyTransaction = [
    "فاتورة كهرباء",
    "فاتورة مياه",
    "فاتورة نت",
  ];
  List<String> budgetRepate = [
    "يومياً",
    "اسبوعياً",
    "شهرياً",
    "ربع سنوياً",
    "نصف سنوياً",
    "سنوياً",
  ];

  List<TransactionModel> transactions = [
    TransactionModel(
        name: "الالتزامات",
        isSelected: true,
        image: Res.commitment,
        content: [
          TransactionTypeModel(
            name: "bills",
            image: Res.bills,
            content: [
              TransactionContentModel(
                name: "electric",
                image: Res.electric,
              ),
              TransactionContentModel(
                name: "water",
                image: Res.water,
              ),
              TransactionContentModel(
                name: "mobile",
                image: Res.mobile,
              ),
              TransactionContentModel(
                name: "telephone",
                image: Res.telephon,
              ),
              TransactionContentModel(
                name: "internet",
                image: Res.internet,
              ),
            ],
          ),
          TransactionTypeModel(
            name: "car",
            image: Res.car,
            content: [
              TransactionContentModel(
                name: "fuel",
                image: Res.fuel,
              ),
              TransactionContentModel(
                name: "garage",
                image: Res.garage,
              ),
              TransactionContentModel(
                name: "maintenance",
                image: Res.maintenance,
              ),
              TransactionContentModel(
                name: "carWash",
                image: Res.carWash,
              ),
              TransactionContentModel(
                name: "driver",
                image: Res.driver,
              ),
              TransactionContentModel(
                name: "carFare",
                image: Res.carFare,
              ),
            ],
          ),
          TransactionTypeModel(
            name: "family",
            image: Res.family,
            content: [
              TransactionContentModel(
                name: "rent",
                image: Res.rent,
              ),
              TransactionContentModel(
                name: "installments",
                image: Res.installments,
              ),
              TransactionContentModel(
                name: "insurances",
                image: Res.insurances,
              ),
              TransactionContentModel(
                name: "repair",
                image: Res.repair,
              ),
              TransactionContentModel(
                name: "services",
                image: Res.services,
              ),
            ],
          ),
          TransactionTypeModel(
            name: "donations",
            image: Res.services,
            content: [
              TransactionContentModel(
                name: "donation",
                image: Res.services,
              ),
              TransactionContentModel(
                name: "subsidies",
                image: Res.subsidies,
              ),
              TransactionContentModel(
                name: "tip",
                image: Res.insurances,
              ),
              TransactionContentModel(
                name: "charity",
                image: Res.installments,
              ),
              TransactionContentModel(
                name: "alms",
                image: Res.alms,
              ),
              TransactionContentModel(
                name: "gifts",
                image: Res.gift,
              ),
            ],
          ),
          TransactionTypeModel(
            name: "subscriptions",
            image: Res.subscriptions,
            content: [
              TransactionContentModel(
                name: "gym",
                image: Res.gym,
              ),
              TransactionContentModel(
                  name: "healthClub",
                  image: Res.hospital
              ),
              TransactionContentModel(
                name: "sportsClub",
                image: Res.sportsClub,
              ),
              TransactionContentModel(
                name: "stadium",
                image: Res.stadium,
              ),
              TransactionContentModel(
                name: "television",
                image: Res.monitor,
              ),
              TransactionContentModel(
                name: "satelliteDish",
                image: Res.dish,
              ),
            ],
          ),
          TransactionTypeModel(
            name: "education",
            image: Res.education,
            content: [
              TransactionContentModel(
                name: "trainingCourses",
                image: Res.trainingCourses,
              ),
              TransactionContentModel(
                name: "schoolExpenses",
                image: Res.subsidies,
              ),
              TransactionContentModel(
                name: "expenses",
                image: Res.carFare,
              ),
              TransactionContentModel(
                name: "specialLesson",
                image: Res.training,
              ),
              TransactionContentModel(
                name: "schoolBooks",
                image: Res.courseAssign,
              ),
              TransactionContentModel(
                name: "schoolTools",
                image: Res.schoolTools,
              ),
            ],
          ),
          TransactionTypeModel(
            name: "entertainmentTrips",
            image: Res.entertainment,
            content: [
              TransactionContentModel(
                name: "entertainment",
                image: Res.entertainment,
              ),
              TransactionContentModel(
                name: "visit",
                image: Res.visit,
              ),
              TransactionContentModel(
                name: "cinema",
                image: Res.cinema,
              ),
              TransactionContentModel(
                name: "games",
                image: Res.games,
              ),
              TransactionContentModel(
                name: "adventures",
                image: Res.adventures,
              ),
            ],
          ),
          TransactionTypeModel(
            name: "care",
            image: Res.health,
            content: [
              TransactionContentModel(
                name: "pharmaceutical",
                image: Res.health,
              ),
              TransactionContentModel(
                name: "doctors",
                image: Res.doctor,
              ),
              TransactionContentModel(
                name: "hospitals",
                image: Res.hospital,
              ),
              TransactionContentModel(
                name: "teeth",
                image: Res.teeth,
              ),
              TransactionContentModel(
                name: "analysisLaboratories",
                image: Res.labs,
              ),
              TransactionContentModel(
                name: "personalCare",
                image: Res.personalCare,
              ),
            ],
          ),
        ]
    ),
    TransactionModel(
      name: "التسوق والشراء",
      image: Res.shopping,
      content: [
        TransactionTypeModel(
          name: "supermarket",
          image: Res.superMarket,
          content: [
            TransactionContentModel(
                name: "dairy",
                image: Res.dairy
            ),
            TransactionContentModel(
                name: "cheese",
                image: Res.cheese
            ),
            TransactionContentModel(
                name: "bakedGoods",
                image: Res.bakedGoods
            ),
            TransactionContentModel(
                name: "meat",
                image: Res.meat
            ),
            TransactionContentModel(
                name: "birds",
                image: Res.birds
            ),
            TransactionContentModel(
                name: "fish",
                image: Res.fish
            ),
            TransactionContentModel(
                name: "herbs",
                image: Res.herbs
            ),
            TransactionContentModel(
                name: "vegetable",
                image: Res.vegetable
            ),
            TransactionContentModel(
                name: "fruits",
                image: Res.fruits
            ),
            TransactionContentModel(
                name: "libraryTools",
                image: Res.libraryTools
            ),
            TransactionContentModel(
                name: "legumes",
                image: Res.legumes
            ),
            TransactionContentModel(
                name: "oil",
                image: Res.oil
            ),
            TransactionContentModel(
                name: "salt",
                image: Res.salt
            ),
            TransactionContentModel(
                name: "sugar",
                image: Res.sugar
            ),
            TransactionContentModel(
                name: "vinegar",
                image: Res.vinegar
            ),
            TransactionContentModel(
                name: "chocolate",
                image: Res.chocolate
            ),
            TransactionContentModel(
                name: "candies",
                image: Res.candies
            ),

          ],
        ),
        TransactionTypeModel(
          name: "furniture",
          image: Res.furniture,
          content: [
            TransactionContentModel(
                name: "clothes",
                image: Res.clothes
            ),
            TransactionContentModel(
                name: "shoes",
                image: Res.shoes
            ),
            TransactionContentModel(
                name: "furniture1",
                image: Res.furniture1
            ),
            TransactionContentModel(
                name: "electricalDevices",
                image: Res.electricalDevices
            ),
            TransactionContentModel(
                name: "kitchenUtensils",
                image: Res.kitchenUtensils
            ),
            TransactionContentModel(
                name: "LightingTools",
                image: Res.LightingTools
            ),
            TransactionContentModel(
                name: "antiques",
                image: Res.antiques
            ),
          ],
        ),
        TransactionTypeModel(
          name: "places",
          image: Res.places,
          content: [
            TransactionContentModel(
                name: "restaurant",
                image: Res.restaurant
            ),
            TransactionContentModel(
                name: "cafe",
                image: Res.cafe
            ),
            TransactionContentModel(
                name: "mall",
                image: Res.mall
            ),
            TransactionContentModel(
                name: "shop",
                image: Res.shop
            ),
            TransactionContentModel(
                name: "factory",
                image: Res.shop
            ),
            TransactionContentModel(
                name: "workshop",
                image: Res.workshop
            ),
            TransactionContentModel(
                name: "hospital",
                image: Res.hospital1
            ),
            TransactionContentModel(
                name: "clinic",
                image: Res.clinic
            ),
            TransactionContentModel(
                name: "exhibition",
                image: Res.exhibition
            ),
          ],
        ),
        TransactionTypeModel(
          name: "online",
          image: Res.internet,
          content: [
            TransactionContentModel(
                name: "website",
                image: Res.website
            ),
            TransactionContentModel(
                name: "facebook1",
                image: Res.facebook1
            ),
            TransactionContentModel(
                name: "instagram1",
                image: Res.instagram1
            ),
            TransactionContentModel(
                name: "tikTok",
                image: Res.tikTok
            ),
            TransactionContentModel(
                name: "group",
                image: Res.group
            ),
            TransactionContentModel(
                name: "advertisements",
                image: Res.advertisements
            ),
          ],
        ),
      ],
    ),
    TransactionModel(
      name: "الاهداف المالية المستهدفة",
      image: Res.target,
      content: [
        TransactionTypeModel(
          name: "investment",
          image: Res.investment,
          content: [

          ],
        ),
        TransactionTypeModel(
          name: "saving",
          image: Res.saving,
          content: [

          ],
        ),
        TransactionTypeModel(
          name: "finishing",
          image: Res.finishing,
          content: [

          ],
        ),
        TransactionTypeModel(
          name: "buyingCar",
          image: Res.buyingCar,
          content: [

          ],
        ),
        TransactionTypeModel(
          name: "tuitionFees",
          image: Res.tuitionFees,
          content: [

          ],
        ),
      ],
    ),
    TransactionModel(
      name: "المعاملات النقدية",
      image: Res.cash,
      content: [
        TransactionTypeModel(
          name: "withdraw",
          image: Res.withdraw,
          content: [

          ],
        ),
        TransactionTypeModel(
          name: "transfer",
          image: Res.transfer,
          content: [

          ],
        ),
      ],
    ),
  ];

}
