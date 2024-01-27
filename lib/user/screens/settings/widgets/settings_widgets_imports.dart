import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/themes/app_colors.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/utilities/utils_functions/utils.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/settings/data/api/google_drive_client.dart';
import 'package:expenses/user/screens/settings/data/repository/google_drive_client_repository.dart';
import 'package:expenses/user/screens/settings/settings_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/themes/cubit/app_theme_cubit.dart';
import '../../auth_info_cubit/auth_info_cubit.dart';

part 'build_language_bottom_sheet.dart';
part 'settings_body.dart';
part 'settings_custom_tile.dart';
part 'settings_tile_dropdown.dart';
part 'settings_tile_row.dart';
part 'settings_tile.dart';
