import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_cubit.freezed.dart';
part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(const AppThemeState.initial());

  static AppThemeCubit get(context) => BlocProvider.of<AppThemeCubit>(context);

  Future<SharedPreferences> getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  Future<void> setAppTheme() async {
    final preferences = await getPreferences();
    preferences.setBool('AppTheme', isDarkMode);
  }

  Future<bool?> fetchAppTheme() async {
    final preferences = await getPreferences();
    return preferences.getBool('AppTheme');
  }

  Future<void> applyAppTheme() async {
    final isDarkModeFetched = await fetchAppTheme();
    isDarkModeFetched == null
        ? ThemeMode.light
        : _themeMode = isDarkModeFetched ? ThemeMode.dark : ThemeMode.light;
    emit(const AppThemeState.fetched());
  }

  // final _brightness =
  //     WidgetsBinding.instance.platformDispatcher.platformBrightness;

  // bool get isDarkModeSystem => _brightness == Brightness.dark;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  // void setInitialThemeMode() {
  //   isDarkModeSystem
  //       ? _themeMode = ThemeMode.dark
  //       : _themeMode = ThemeMode.light;
  // }

  void toggleTheme(bool isOn) {
    emit(const AppThemeState.initial());
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    setAppTheme();
    emit(const AppThemeState.changed());
  }

  void changeTheme() {
    emit(const AppThemeState.initial());
    _themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    setAppTheme();
    emit(const AppThemeState.changed());
  }

  String decimalValue = '0';

  Future<void> setDecimalValue() async {
    final preferences = await getPreferences();
    preferences.setString('DecimalValue', decimalValue);
  }

  Future<String?> fetchDecimalValue() async {
    final preferences = await getPreferences();
    return preferences.getString('DecimalValue');
  }

  Future<void> applyDecimalValue() async {
    final fetchedDecimalValue = await fetchDecimalValue();
    fetchedDecimalValue == null
        ? decimalValue
        : decimalValue = fetchedDecimalValue;
  }

  String saveMethod = SaveMethods.pdf.name;

  Future<void> setSaveMethod() async {
    final preferences = await getPreferences();
    preferences.setString('SaveMethod', saveMethod);
  }

  Future<String?> fetchSaveMethod() async {
    final preferences = await getPreferences();
    return preferences.getString('SaveMethod');
  }

  Future<void> applySaveMethod() async {
    final fetchedSaveMethod = await fetchSaveMethod();
    fetchedSaveMethod == null ? saveMethod : saveMethod = fetchedSaveMethod;
  }
}

enum SaveMethods {
  pdf(method: 'Pdf'),
  excel(method: 'Excel');

  final String method;
  const SaveMethods({
    required this.method,
  });
}
