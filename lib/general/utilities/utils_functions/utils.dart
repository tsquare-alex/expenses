import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:expenses/general/helper/configration/DecorationUtils.dart';
import 'package:expenses/general/helper/storage/Storage.dart';
import 'package:expenses/general/models/user_model/user_model.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Utils {



  static void changeLanguage(String lang, BuildContext context) {
    DecorationUtils.lang = lang;
    Storage.setLang(lang);
    context.read<LangCubit>().onUpdateLanguage(lang);
  }


}
