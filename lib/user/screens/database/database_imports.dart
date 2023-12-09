import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/database/widgets/build_address_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_category_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_comment_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_date_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_email_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_location_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_names_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_phone_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_work_expansion.dart';
import 'package:expenses/user/screens/database/widgets/expandable_card.dart';
import 'package:expenses/user/screens/database/widgets/my_expansion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../general/models/data_base_model/data_base_model.dart';
import 'cubit/database_cubit.dart';
import 'cubit/my_expansion_cubit/my_expansion_cubit.dart';
// import 'database_data.dart';

part 'database.dart';
part 'database_data.dart';