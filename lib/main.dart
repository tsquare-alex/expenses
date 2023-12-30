import 'package:expenses/general/MyApp.dart';
import 'package:expenses/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:expenses/general/models/bag_model/bag_model.dart';
import 'package:expenses/general/models/country_model/country_model.dart';
import 'package:expenses/general/models/currency_model/currency_model.dart';
import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:expenses/simple_bloc_observer.dart';
import 'package:expenses/user/models/auth_model/authentication_info.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:expenses/user/models/favorite_model/favorite_model.dart';
import 'package:expenses/user/models/dropdown_model/dropdown_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_content_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_type_model.dart';
import 'package:expenses/user/screens/budget/data/model/budget_model.dart';
import 'package:flutter/material.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';
import 'general/constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // myBox = await openHiveBox(ApiNames.kTransactionTypes);
  // await Hive.initFlutter();
  Hive.registerAdapter(TransactionTypeModelAdapter());
  Hive.registerAdapter(TransactionContentModelAdapter());
  Hive.registerAdapter(AddTransactionModelAdapter());
  Hive.registerAdapter(DropdownModelAdapter());
  Hive.registerAdapter(WalletModelAdapter());
  Hive.registerAdapter(DatabaseModelAdapter());
  Hive.registerAdapter(FavoriteModelAdapter());
  Hive.registerAdapter(AuthenticationInfoAdapter());
  Hive.registerAdapter(CountryModelAdapter());
  //Hive.registerAdapter(CurrencyModelAdapter());
  Hive.registerAdapter(CurrencyModelAdapter());
  Hive.registerAdapter(BudgetModelAdapter());
  Hive.registerAdapter(BagModelAdapter());
  await Hive.openBox<FavoriteModel>(favoriteTools);
  await Hive.openBox<AuthenticationInfo>("authentication_box");
  await Hive.openBox<BudgetModel>("budgetBox");
  await Hive.openBox<BagModel>("bagBox");
  await Hive.openBox<CurrencyModel>('currencyBox');
  await Hive.openBox<CountryModel>('countryBox');
  await Hive.openBox<WalletModel>(walletDatabaseBox);
  await Hive.openBox<DatabaseModel>(database);
  await Hive.openBox<CountryModel>("countryBox");
  runApp(BlocProvider(
    create: (BuildContext context) => LangCubit(),
    child: Phoenix(child: const MyApp()),
  ));
}
