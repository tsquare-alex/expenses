import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(LangInitial());

  onUpdateLanguage(String lang){
    emit(LangUpdateState(Locale(lang)));
  }

}
