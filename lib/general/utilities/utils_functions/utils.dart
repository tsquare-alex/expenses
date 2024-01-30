import 'dart:io';
import 'dart:typed_data';

import 'package:expenses/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:expenses/general/constants/constants.dart';
import 'package:expenses/general/helper/configration/DecorationUtils.dart';
import 'package:expenses/general/helper/storage/Storage.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class Utils {
  static void changeLanguage(String lang, BuildContext context) {
    DecorationUtils.lang = lang;
    Storage.setLang(lang);
    context.read<LangCubit>().onUpdateLanguage(lang);
  }

  static Future<Uint8List?> getImage(bool isCamera) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (image != null) {
      // File imageFile = File(image.path);
      return await _getImageBytes(image);
    }
    return null;
  }

  static Future<Uint8List> _getImageBytes(XFile image) async {
    return await image.readAsBytes();
  }

  static Future<void> saveJsonToFile(String fileName, String jsonString) async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$fileName');

    await file.writeAsString(jsonString);
  }

  static Future<String> readJsonFromFile(String fileName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$fileName');

    if (await file.exists()) {
      return await file.readAsString();
    } else {
      return '';
    }
  }

  static int calculateDifferenceInDays(DateTime modelDateTime) {
    DateTime now = DateTime.now();
    Duration difference = modelDateTime.difference(now);
    return difference.inDays.abs();
  }

  static int calculateDifferenceInWeeks(DateTime modelDateTime) {
    DateTime now = DateTime.now();
    Duration difference = modelDateTime.difference(now);
    return (difference.inDays.abs() / 7).floor();
  }

  static int calculateDifferenceInMonths(DateTime modelDateTime) {
    DateTime now = DateTime.now();
    double differenceInDays = now.difference(modelDateTime).inDays.toDouble();
    double differenceInMonths =
        differenceInDays / 30; // Assuming 30 days per month
    return differenceInMonths.floor();
  }

  static int calculateDifferenceInQuarterYears(DateTime modelDateTime) {
    DateTime now = DateTime.now();
    double differenceInMonths = now.difference(modelDateTime).inDays / 30;
    double differenceInQuarterYears =
        differenceInMonths / 3; // Assuming 3 months per quarter-year
    return differenceInQuarterYears.floor();
  }

  static int calculateDifferenceInSemiAnnually(DateTime modelDateTime) {
    DateTime now = DateTime.now();
    double differenceInMonths = now.difference(modelDateTime).inDays / 30;
    double differenceInQuarterYears =
        differenceInMonths / 6; // Assuming 3 months per quarter-year
    return differenceInQuarterYears.floor();
  }

  static int calculateDifferenceInAnnually(DateTime modelDateTime) {
    DateTime now = DateTime.now();
    double differenceInMonths = now.difference(modelDateTime).inDays / 30;
    double differenceInQuarterYears =
        differenceInMonths / 12; // Assuming 3 months per quarter-year
    return differenceInQuarterYears.floor();
  }

  static void repeatTransaction() async {
    var box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    var list = box.values.toList();
    print(list.length);
    print("object8");
    for (AddTransactionModel item in list) {
      var now = DateTime.now();
      print("object3");
      var date = DateFormat("dd/MM/yyyy", "en").parse(item.transactionDate!);
      int counter = calculateDifferenceInDays(date);
      int weeksCounter = calculateDifferenceInWeeks(date);
      int monthsCounter = calculateDifferenceInMonths(date);
      int quaterCounter = calculateDifferenceInQuarterYears(date);
      int semiAnnuallyCounter = calculateDifferenceInSemiAnnually(date);
      int annuallyCounter = calculateDifferenceInAnnually(date);
      print("counter $counter}");
      if (item.repeated != null && item.transactionName != "الاهداف المالية المستهدفة") {
        print("object4");
        if (item.repeated?.name == "daily" && item.transactionName != "الاهداف المالية المستهدفة") {
          for (int i = 0; i < counter; i++) {
            AddTransactionModel newModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: DateFormat("hh:mm aa", "en").format(DateTime(
                  now.year,
                  now.month,
                  now.day,
                  TimeOfDay.now().hour,
                  TimeOfDay.now().minute)),
              // time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: item.notify,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: item.repeated,
              transactionDate:
                  DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            var targetModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: null,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: item.startDate,
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: null,
              transactionDate: item.transactionDate,
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            print(item.key);
            if(counter == 1){
            }else if (counter >0 && counter!=1){
              box.put(item.key.toString(), targetModel);
            }
            print("counter $counter");
            print("object5");
            double total = double.parse(item.total!);
            if (total <= item.incomeSource!.totalBalance!) {
              print("object6");
              var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
              var walletList = walletBox.values.toList();
              WalletModel? targetModel = walletList.firstWhere(
                (model) => model.name == item.incomeSource?.name,
              );
              print("object ${targetModel.name}");
              targetModel.totalBalance = targetModel.totalBalance! - total;
              print("balance ${targetModel.totalBalance!}");
              await walletBox.put(targetModel.key, targetModel);
              print(item.incomeSource!.totalBalance!);
              box.add(newModel);
            } else {
              CustomToast.showSimpleToast(msg: "msg");
            }
          }
        }
        else if (item.repeated?.name == "weekly" && item.transactionName != "الاهداف المالية المستهدفة") {
          for (int i = 0; i < weeksCounter; i++) {
            AddTransactionModel newModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: DateFormat("hh:mm aa", "en").format(DateTime(
                  now.year,
                  now.month,
                  now.day,
                  TimeOfDay.now().hour,
                  TimeOfDay.now().minute)),
              // time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: item.notify,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: item.repeated,
              transactionDate:
                  DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            var targetModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: null,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: item.startDate,
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: null,
              transactionDate: item.transactionDate,
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            box.put(item.key, targetModel);
            print("counter $counter");
            print("object5");
            double total = double.parse(item.total!);
            if (total <= item.incomeSource!.totalBalance!) {
              print("object6");
              var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
              var walletList = walletBox.values.toList();
              WalletModel? targetModel = walletList.firstWhere(
                (model) => model.name == item.incomeSource?.name,
              );
              print("object ${targetModel.name}");
              targetModel.totalBalance = targetModel.totalBalance! - total;
              print("balance ${targetModel.totalBalance!}");
              await walletBox.put(targetModel.key, targetModel);
              print(item.incomeSource!.totalBalance!);
              box.add(newModel);
            } else {
              CustomToast.showSimpleToast(msg: "msg");
            }
          }
        }
        else if (item.repeated?.name == "monthly" && item.transactionName != "الاهداف المالية المستهدفة") {
          for (int i = 0; i < monthsCounter; i++) {
            AddTransactionModel newModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: DateFormat("hh:mm aa", "en").format(DateTime(
                  now.year,
                  now.month,
                  now.day,
                  TimeOfDay.now().hour,
                  TimeOfDay.now().minute)),
              // time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: item.notify,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: item.repeated,
              transactionDate:
                  DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            var targetModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: null,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: item.startDate,
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: null,
              transactionDate: item.transactionDate,
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            box.put(item.key, targetModel);
            print("counter $counter");
            print("object5");
            double total = double.parse(item.total!);
            if (total <= item.incomeSource!.totalBalance!) {
              print("object6");
              var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
              var walletList = walletBox.values.toList();
              WalletModel? targetModel = walletList.firstWhere(
                (model) => model.name == item.incomeSource?.name,
              );
              print("object ${targetModel.name}");
              targetModel.totalBalance = targetModel.totalBalance! - total;
              print("balance ${targetModel.totalBalance!}");
              await walletBox.put(targetModel.key, targetModel);
              print(item.incomeSource!.totalBalance!);
              box.add(newModel);
            } else {
              CustomToast.showSimpleToast(msg: "msg");
            }
          }
        }
        else if (item.repeated?.name == "quarterly" && item.transactionName != "الاهداف المالية المستهدفة") {
          for (int i = 0; i < quaterCounter; i++) {
            AddTransactionModel newModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: DateFormat("hh:mm aa", "en").format(DateTime(
                  now.year,
                  now.month,
                  now.day,
                  TimeOfDay.now().hour,
                  TimeOfDay.now().minute)),
              // time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: item.notify,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: item.repeated,
              transactionDate:
                  DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            var targetModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: null,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: item.startDate,
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: null,
              transactionDate: item.transactionDate,
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            box.put(item.key, targetModel);
            print("counter $counter");
            print("object5");
            double total = double.parse(item.total!);
            if (total <= item.incomeSource!.totalBalance!) {
              print("object6");
              var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
              var walletList = walletBox.values.toList();
              WalletModel? targetModel = walletList.firstWhere(
                (model) => model.name == item.incomeSource?.name,
              );
              print("object ${targetModel.name}");
              targetModel.totalBalance = targetModel.totalBalance! - total;
              print("balance ${targetModel.totalBalance!}");
              await walletBox.put(targetModel.key, targetModel);
              print(item.incomeSource!.totalBalance!);
              box.add(newModel);
            } else {
              CustomToast.showSimpleToast(msg: "msg");
            }
          }
        }
        else if (item.repeated?.name == "SemiAnnually" && item.transactionName != "الاهداف المالية المستهدفة") {
          for (int i = 0; i < semiAnnuallyCounter; i++) {
            AddTransactionModel newModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: DateFormat("hh:mm aa", "en").format(DateTime(
                  now.year,
                  now.month,
                  now.day,
                  TimeOfDay.now().hour,
                  TimeOfDay.now().minute)),
              // time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: item.notify,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: item.repeated,
              transactionDate:
                  DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            var targetModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: null,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: item.startDate,
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: null,
              transactionDate: item.transactionDate,
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            box.put(item.key, targetModel);
            print("counter $counter");
            print("object5");
            double total = double.parse(item.total!);
            if (total <= item.incomeSource!.totalBalance!) {
              print("object6");
              var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
              var walletList = walletBox.values.toList();
              WalletModel? targetModel = walletList.firstWhere(
                (model) => model.name == item.incomeSource?.name,
              );
              print("object ${targetModel.name}");
              targetModel.totalBalance = targetModel.totalBalance! - total;
              print("balance ${targetModel.totalBalance!}");
              await walletBox.put(targetModel.key, targetModel);
              print(item.incomeSource!.totalBalance!);
              box.add(newModel);
            } else {
              CustomToast.showSimpleToast(msg: "msg");
            }
          }
        }
        else if (item.repeated?.name == "annually" && item.transactionName != "الاهداف المالية المستهدفة") {
          for (int i = 0; i < annuallyCounter; i++) {
            AddTransactionModel newModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: DateFormat("hh:mm aa", "en").format(DateTime(
                  now.year,
                  now.month,
                  now.day,
                  TimeOfDay.now().hour,
                  TimeOfDay.now().minute)),
              // time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: item.notify,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: item.repeated,
              transactionDate:
                  DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            var targetModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: null,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: item.startDate,
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: null,
              transactionDate: item.transactionDate,
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            box.put(item.key, targetModel);
            print("counter $counter");
            print("object5");
            double total = double.parse(item.total!);
            if (total <= item.incomeSource!.totalBalance!) {
              print("object6");
              var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
              var walletList = walletBox.values.toList();
              WalletModel? targetModel = walletList.firstWhere(
                (model) => model.name == item.incomeSource?.name,
              );
              print("object ${targetModel.name}");
              targetModel.totalBalance = targetModel.totalBalance! - total;
              print("balance ${targetModel.totalBalance!}");
              await walletBox.put(targetModel.key, targetModel);
              print(item.incomeSource!.totalBalance!);
              box.add(newModel);
            } else {
              CustomToast.showSimpleToast(msg: "msg");
            }
          }
        }
      }
    }
  }

  static void repeatTargetTransaction() async {
    var box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    var list = box.values.toList();
    print(list.length);
    print("object8");
    for (AddTransactionModel item in list) {
      var now = DateTime.now();
      print("object3");
      var date = DateFormat("dd/MM/yyyy", "en").parse(item.transactionDate!);
      int counter = calculateDifferenceInDays(date);
      int weeksCounter = calculateDifferenceInWeeks(date);
      int monthsCounter = calculateDifferenceInMonths(date);
      int quaterCounter = calculateDifferenceInQuarterYears(date);
      int semiAnnuallyCounter = calculateDifferenceInSemiAnnually(date);
      int annuallyCounter = calculateDifferenceInAnnually(date);
      print("counter $counter}");
      if (item.repeated != null) {
        print("object4");
        if (item.repeated?.name == "daily" && item.transactionName == "الاهداف المالية المستهدفة") {
          for (int i = 0; i < counter; i++) {
            var targetModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: item.notify,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue! + item.requiredValue!,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: item.startDate,
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: item.repeated,
              transactionDate: item.transactionDate,
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            box.put(item.key, targetModel);
            print("counter $counter");
            print("object5");
            double total = item.requiredValue!;
            if (total <= item.incomeSource!.totalBalance!) {
              print("object6");
              var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
              var walletList = walletBox.values.toList();
              WalletModel? targetModel = walletList.firstWhere(
                    (model) => model.name == item.incomeSource?.name,
              );
              print("object ${targetModel.name}");
              targetModel.totalBalance = targetModel.totalBalance! - total;
              print("balance ${targetModel.totalBalance!}");
              await walletBox.put(targetModel.key, targetModel);
              print(item.incomeSource!.totalBalance!);
            } else {
              CustomToast.showSimpleToast(msg: "msg");
            }
          }
        }
        else if (item.repeated?.name == "weekly" && item.transactionName == "الاهداف المالية المستهدفة") {
          for (int i = 0; i < weeksCounter; i++) {
            AddTransactionModel newModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: DateFormat("hh:mm aa", "en").format(DateTime(
                  now.year,
                  now.month,
                  now.day,
                  TimeOfDay.now().hour,
                  TimeOfDay.now().minute)),
              // time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: item.notify,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: item.repeated,
              transactionDate:
              DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            var targetModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: null,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: item.startDate,
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: null,
              transactionDate: item.transactionDate,
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            box.put(item.key, targetModel);
            print("counter $counter");
            print("object5");
            double total = double.parse(item.total!);
            if (total <= item.incomeSource!.totalBalance!) {
              print("object6");
              var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
              var walletList = walletBox.values.toList();
              WalletModel? targetModel = walletList.firstWhere(
                    (model) => model.name == item.incomeSource?.name,
              );
              print("object ${targetModel.name}");
              targetModel.totalBalance = targetModel.totalBalance! - total;
              print("balance ${targetModel.totalBalance!}");
              await walletBox.put(targetModel.key, targetModel);
              print(item.incomeSource!.totalBalance!);
              box.add(newModel);
            } else {
              CustomToast.showSimpleToast(msg: "msg");
            }
          }
        }
        else if (item.repeated?.name == "monthly" && item.transactionName == "الاهداف المالية المستهدفة") {
          for (int i = 0; i < monthsCounter; i++) {
            AddTransactionModel newModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: DateFormat("hh:mm aa", "en").format(DateTime(
                  now.year,
                  now.month,
                  now.day,
                  TimeOfDay.now().hour,
                  TimeOfDay.now().minute)),
              // time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: item.notify,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: item.repeated,
              transactionDate:
              DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            var targetModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: null,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: item.startDate,
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: null,
              transactionDate: item.transactionDate,
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            box.put(item.key, targetModel);
            print("counter $counter");
            print("object5");
            double total = double.parse(item.total!);
            if (total <= item.incomeSource!.totalBalance!) {
              print("object6");
              var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
              var walletList = walletBox.values.toList();
              WalletModel? targetModel = walletList.firstWhere(
                    (model) => model.name == item.incomeSource?.name,
              );
              print("object ${targetModel.name}");
              targetModel.totalBalance = targetModel.totalBalance! - total;
              print("balance ${targetModel.totalBalance!}");
              await walletBox.put(targetModel.key, targetModel);
              print(item.incomeSource!.totalBalance!);
              box.add(newModel);
            } else {
              CustomToast.showSimpleToast(msg: "msg");
            }
          }
        }
        else if (item.repeated?.name == "quarterly" && item.transactionName == "الاهداف المالية المستهدفة") {
          for (int i = 0; i < quaterCounter; i++) {
            AddTransactionModel newModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: DateFormat("hh:mm aa", "en").format(DateTime(
                  now.year,
                  now.month,
                  now.day,
                  TimeOfDay.now().hour,
                  TimeOfDay.now().minute)),
              // time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: item.notify,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: item.repeated,
              transactionDate:
              DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            var targetModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: null,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: item.startDate,
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: null,
              transactionDate: item.transactionDate,
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            box.put(item.key, targetModel);
            print("counter $counter");
            print("object5");
            double total = double.parse(item.total!);
            if (total <= item.incomeSource!.totalBalance!) {
              print("object6");
              var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
              var walletList = walletBox.values.toList();
              WalletModel? targetModel = walletList.firstWhere(
                    (model) => model.name == item.incomeSource?.name,
              );
              print("object ${targetModel.name}");
              targetModel.totalBalance = targetModel.totalBalance! - total;
              print("balance ${targetModel.totalBalance!}");
              await walletBox.put(targetModel.key, targetModel);
              print(item.incomeSource!.totalBalance!);
              box.add(newModel);
            } else {
              CustomToast.showSimpleToast(msg: "msg");
            }
          }
        }
        else if (item.repeated?.name == "SemiAnnually" && item.transactionName == "الاهداف المالية المستهدفة") {
          for (int i = 0; i < semiAnnuallyCounter; i++) {
            AddTransactionModel newModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: DateFormat("hh:mm aa", "en").format(DateTime(
                  now.year,
                  now.month,
                  now.day,
                  TimeOfDay.now().hour,
                  TimeOfDay.now().minute)),
              // time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: item.notify,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: item.repeated,
              transactionDate:
              DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            var targetModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: null,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: item.startDate,
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: null,
              transactionDate: item.transactionDate,
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            box.put(item.key, targetModel);
            print("counter $counter");
            print("object5");
            double total = double.parse(item.total!);
            if (total <= item.incomeSource!.totalBalance!) {
              print("object6");
              var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
              var walletList = walletBox.values.toList();
              WalletModel? targetModel = walletList.firstWhere(
                    (model) => model.name == item.incomeSource?.name,
              );
              print("object ${targetModel.name}");
              targetModel.totalBalance = targetModel.totalBalance! - total;
              print("balance ${targetModel.totalBalance!}");
              await walletBox.put(targetModel.key, targetModel);
              print(item.incomeSource!.totalBalance!);
              box.add(newModel);
            } else {
              CustomToast.showSimpleToast(msg: "msg");
            }
          }
        }
        else if (item.repeated?.name == "annually" && item.transactionName == "الاهداف المالية المستهدفة") {
          for (int i = 0; i < annuallyCounter; i++) {
            AddTransactionModel newModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: DateFormat("hh:mm aa", "en").format(DateTime(
                  now.year,
                  now.month,
                  now.day,
                  TimeOfDay.now().hour,
                  TimeOfDay.now().minute)),
              // time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: item.notify,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: item.repeated,
              transactionDate:
              DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            var targetModel = AddTransactionModel(
              image: item.image,
              total: item.total,
              amount: item.amount,
              time: item.time,
              description: item.description,
              putReminderInWallet: item.putReminderInWallet,
              notify: null,
              requiredValue: item.requiredValue,
              initialValue: item.initialValue,
              transactionName: item.transactionName,
              priority: item.priority,
              endDate: item.endDate,
              startDate: item.startDate,
              targetValue: item.targetValue,
              transactionType: item.transactionType,
              brandName: item.brandName,
              repeated: null,
              transactionDate: item.transactionDate,
              unit: item.unit,
              incomeSource: item.incomeSource,
              transactionContent: item.transactionContent,
              budget: item.budget,
              cashTransactionType: item.cashTransactionType,
              completedNotify: item.completedNotify,
              database: item.database,
              ratio: item.ratio,
              targetType: item.targetType,
            );
            box.put(item.key, targetModel);
            print("counter $counter");
            print("object5");
            double total = double.parse(item.total!);
            if (total <= item.incomeSource!.totalBalance!) {
              print("object6");
              var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
              var walletList = walletBox.values.toList();
              WalletModel? targetModel = walletList.firstWhere(
                    (model) => model.name == item.incomeSource?.name,
              );
              print("object ${targetModel.name}");
              targetModel.totalBalance = targetModel.totalBalance! - total;
              print("balance ${targetModel.totalBalance!}");
              await walletBox.put(targetModel.key, targetModel);
              print(item.incomeSource!.totalBalance!);
              box.add(newModel);
            } else {
              CustomToast.showSimpleToast(msg: "msg");
            }
          }
        }
      }
    }
  }
}
