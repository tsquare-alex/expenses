import 'dart:io';
import 'dart:typed_data';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/constants/constants.dart';
import 'package:expenses/general/constants/custom_%20drop_down/CustomDropDown.dart';
import 'package:expenses/general/helper/AdaptivePicker.dart';
import 'package:expenses/general/packages/generic_bloc/generic_cubit.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/general/utilities/utils_functions/utils.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:expenses/user/models/dropdown_model/dropdown_model.dart';
import 'package:expenses/user/models/transaction_model/transaction_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_content_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_type_model.dart';
import 'package:expenses/user/screens/add_transaction/widgets/add_transaction_widgets_imports.dart';
import 'package:expenses/user/screens/budget/data/model/budget_model.dart';
import 'package:expenses/user/screens/commitments/commitments_imports.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';


part 'add_transaction.dart';
part 'add_transaction_data.dart';