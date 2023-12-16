import 'package:expenses/general/MyApp.dart';
import 'package:expenses/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:expenses/general/utilities/utils_functions/ApiNames.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_content_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_type_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'firebase_options.dart';

// Box? myBox;

// Future<Box> openHiveBox(String boxName) async{
//   if(!Hive.isBoxOpen(boxName)){
//     Hive.init((await getApplicationDocumentsDirectory()).path);
//   }
//   return await Hive.openBox(boxName);
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  // myBox = await openHiveBox(ApiNames.kTransactionTypes);
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionTypeModelAdapter());
  Hive.registerAdapter(TransactionContentModelAdapter());
  //await Hive.openBox<TransactionTypeModel>(ApiNames.kTransactionTypes);

  runApp(
      BlocProvider(
        create: (BuildContext context) => LangCubit(),
        child:  Phoenix(child: const MyApp()),
      )
  );
}
