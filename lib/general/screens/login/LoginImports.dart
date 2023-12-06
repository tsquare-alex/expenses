import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenses/general/helper/configration/CustomButtonAnimation.dart';
import 'package:expenses/general/helper/storage/Storage.dart';
import 'package:expenses/general/models/user_model/user_model.dart';
import 'package:expenses/general/packages/generic_bloc/generic_cubit.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/HeaderLogo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/login_widgets_imports.dart';

part 'Login.dart';
part 'LoginData.dart';
