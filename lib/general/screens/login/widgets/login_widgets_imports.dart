import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/blocks/login_cubit/login_cubit.dart';
import 'package:expenses/general/blocks/login_cubit/login_states.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/helper/storage/Storage.dart';
import 'package:expenses/general/packages/generic_bloc/generic_cubit.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/screens/login/LoginImports.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/general/widgets/LoadingButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../user/screens/auth_info_cubit/auth_info_cubit.dart';
import '../../../../user/screens/auth_info_cubit/auth_screen.dart';
import '../../../constants/constants.dart';



part 'BuildLoginForm.dart';
part 'BuildLoginButton.dart';
part 'BuildDontHaveAccount.dart';
part 'BuildForgetPasswordView.dart';
part 'build_login_skip.dart';