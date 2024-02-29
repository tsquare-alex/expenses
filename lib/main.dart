import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:expenses/general/MyApp.dart';
import 'package:expenses/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:expenses/general/models/bag_model/bag_model.dart';
import 'package:expenses/general/models/country_model/country_model.dart';
import 'package:expenses/general/models/currency_model/currency_model.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/general/utilities/utils_functions/utils.dart';
import 'package:expenses/local_notifications.dart';
import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:expenses/simple_bloc_observer.dart';
import 'package:expenses/user/models/auth_model/authentication_info.dart';
import 'package:expenses/user/models/cart_model/add_cart_model.dart';
import 'package:expenses/user/models/cart_model/cart_content_model.dart';
import 'package:expenses/user/models/cart_model/cart_type_model.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:expenses/user/models/favorite_model/favorite_model.dart';
import 'package:expenses/user/models/dropdown_model/dropdown_model.dart';
import 'package:expenses/user/models/radio_model/radio_model.dart';
import 'package:expenses/user/models/note_model/note_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_content_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_type_model.dart';
import 'package:expenses/user/screens/budget/data/model/budget_model.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_category/category_model.dart';
import 'package:flutter/material.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:googleapis/driveactivity/v2.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:workmanager/workmanager.dart';
import 'firebase_options.dart';
import 'general/constants/constants.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Hive.initFlutter();
  await LocalNotifications.init();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Hive.registerAdapter(TransactionTypeModelAdapter());
  Hive.registerAdapter(TransactionContentModelAdapter());
  Hive.registerAdapter(AddTransactionModelAdapter());
  Hive.registerAdapter(DropdownModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(WalletModelAdapter());
  Hive.registerAdapter(DatabaseModelAdapter());
  Hive.registerAdapter(FavoriteModelAdapter());
  Hive.registerAdapter(AuthenticationInfoAdapter());
  Hive.registerAdapter(CountryModelAdapter());
  Hive.registerAdapter(AddCartModelAdapter());
  Hive.registerAdapter(CartContentModelAdapter());
  Hive.registerAdapter(CartTypeModelAdapter());
  Hive.registerAdapter(RadioModelAdapter());
  Hive.registerAdapter(CurrencyModelAdapter());
  Hive.registerAdapter(BudgetModelAdapter());
  Hive.registerAdapter(BagModelAdapter());

  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<FavoriteModel>(favoriteTools);
  await Hive.openBox<AuthenticationInfo>("authentication_box");
  await Hive.openBox<BudgetModel>("budgetBox");
  await Hive.openBox<BagModel>("bagBox");
  await Hive.openBox<CurrencyModel>('currencyBox');
  await Hive.openBox<CountryModel>('countryBox');
  await Hive.openBox<CategoryModel>("walletCategoryModel");
  await Hive.openBox<WalletModel>(walletDatabaseBox);
  await Hive.openBox<DatabaseModel>(database);
  await Hive.openBox<CountryModel>("countryBox");
  await Hive.openBox<NoteModel>(noteKey);

  await initializeDateFormatting('en');

 // Utils.repeatTransaction();
 Utils.repeatTargetTransaction();
 // Utils.repeatWallet();

  runApp(BlocProvider(
    create: (BuildContext context) => LangCubit(),
    child: Phoenix(child: const MyApp()),
  ));
}
