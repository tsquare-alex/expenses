import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/blocks/login_cubit/login_cubit.dart';
import 'package:expenses/general/blocks/login_cubit/login_states.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/helper/storage/Storage.dart';
import 'package:expenses/general/packages/generic_bloc/generic_cubit.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/screens/login/LoginImports.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/general/widgets/LoadingButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



part 'BuildLoginForm.dart';
part 'BuildLoginButton.dart';
part 'BuildDontHaveAccount.dart';
part 'BuildForgetPasswordView.dart';