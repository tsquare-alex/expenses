import 'package:expenses/general/MyApp.dart';
import 'package:expenses/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:expenses/simple_bloc_observer.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:expenses/user/models/favorite_model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';
import 'general/constants/constants.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(DatabaseModelAdapter());
  Hive.registerAdapter(FavoriteModelAdapter());

  await Hive.openBox<DatabaseModel>(databaseBox);
  await Hive.openBox<FavoriteModel>(favoriteTools);
  runApp(
      BlocProvider(
        create: (BuildContext context) => LangCubit(),
        child:  Phoenix(child: const MyApp()),
      )
  );
}
