import 'dart:convert';

import 'package:expenses/general/models/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage{

    // static Future<void> saveUserData(UsersModel model) async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   prefs.setString("user", json.encode(model.toJson()));
    // }

  // static UsersModel getSavedUser({required BuildContext context}) {
  //   return context.read<UserCubit>().state.model;
  // }

  static Future<String?> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lang");
  }

  static Future<void> setLang(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", lang);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<String?> getSkipToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("skipToken");
  }

  static Future<void> setToken(String uId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", uId);
  }
  static Future<void> setSkipToken(String skipToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("skipToken", skipToken);
  }


}