import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/generic_bloc/generic_cubit.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/screens/register/RegisterImports.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/LoadingButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'BuildHaveAccount.dart';
part 'BuildRegisterButton.dart';
part 'BuildRegisterInputs.dart';
part 'BuildRegisterText.dart';