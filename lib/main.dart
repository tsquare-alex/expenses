import 'package:expenses/general/MyApp.dart';
import 'package:expenses/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:expenses/general/utilities/utils_functions/ApiNames.dart';
import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:expenses/user/models/dropdown_model/dropdown_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_content_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_type_model.dart';
import 'package:flutter/material.dart';
import 'package:expenses/simple_bloc_observer.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:expenses/user/screens/wallet/widgets/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'firebase_options.dart';

// Box? myBox;

// Future<Box> openHiveBox(String boxName) async{
//   if(!Hive.isBoxOpen(boxName)){
//     Hive.init((await getApplicationDocumentsDirectory()).path);
//   }
//   return await Hive.openBox(boxName);
// }
import 'general/MyApp.dart';
import 'general/blocks/lang_cubit/lang_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(WalletModelAdapter());
  await Hive.openBox<WalletModel>(databaseBox);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  // myBox = await openHiveBox(ApiNames.kTransactionTypes);
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionTypeModelAdapter());
  Hive.registerAdapter(TransactionContentModelAdapter());
  Hive.registerAdapter(AddTransactionModelAdapter());
  Hive.registerAdapter(DropdownModelAdapter());

  runApp(
      BlocProvider(
        create: (BuildContext context) => LangCubit(),
        child:  Phoenix(child: const MyApp()),
      )
  );
  );
  runApp(BlocProvider(
    create: (BuildContext context) => LangCubit(),
    child: Phoenix(child: const MyApp()),
  ));
}
