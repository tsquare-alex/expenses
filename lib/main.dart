import 'package:expenses/general/MyApp.dart';
import 'package:expenses/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
      BlocProvider(
        create: (BuildContext context) => LangCubit(),
        child:  Phoenix(child: const MyApp()),
      )
  );
}
