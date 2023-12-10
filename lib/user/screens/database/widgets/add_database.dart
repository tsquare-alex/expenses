import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/widgets/MyText.dart';
import '../cubit/my_expansion_cubit/my_expansion_cubit.dart';
import 'my_expansion.dart';

class AddDatabase extends StatelessWidget {

  MyExpansionCubit myCubit = MyExpansionCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyExpansionCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: MyColors.primary,
          title: MyText(
            title: "أضافة جهة",
            color: MyColors.white,
            size: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                DottedBorder(
                  color: Colors.black,
                  strokeWidth: 2,
                  child: Column(
                    children: [
                      const Icon(Icons.camera_alt_outlined),
                      MyText(
                          title: "أضف صورة",
                          color: MyColors.primary,
                          size: 12.sp),
                    ],
                  ),
                ),
                MyExpansionTile(),
                const SizedBox(height: 16.0),

              ],
            ),
          ),
        ),
      ),
    );
  }
}