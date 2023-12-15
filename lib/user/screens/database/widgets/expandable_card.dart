import 'dart:io';

import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:expenses/user/screens/database/cubit/add_database_cubit/add_data_base_cubit.dart';
import 'package:expenses/user/screens/database/cubit/add_database_cubit/add_data_base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/models/data_base_model/data_base_model.dart';
import '../../../../general/widgets/MyText.dart';
import '../cubit/database_cubit.dart';
import 'database_details.dart';

class ExpandableCard extends StatefulWidget {
  final DatabaseModel databaseData;

  const ExpandableCard({
    Key? key,
    required this.databaseData,
  }) : super(key: key);

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool isExpanded = false;
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    print('==================================================');

    print(widget.databaseData.image);
    print('==================================================');

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DatabaseDetails(databaseData: widget.databaseData),
          ),
        );
      },
      child: Card(
        color: MyColors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.databaseData.image.isNotEmpty
                      ? CircleAvatar(
                    radius: 25.0,
                    backgroundImage: MemoryImage(widget.databaseData.image),
                    // child: Image.memory(widget.databaseData.image),
                  )


                      : CircleAvatar(
                    radius: 25.0,
                    child: Image.asset(
                      "assets/images/user.png",
                      fit: BoxFit.cover,
                    ),
                  ),


                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          title: widget.databaseData.company,
                          color: MyColors.primary,
                          size: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        MyText(
                          title: widget.databaseData.category,
                          color: MyColors.primary,
                          size: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            MyText(
                              title: widget.databaseData.firstName,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            MyText(
                              title: widget.databaseData.phoneNumber,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        MyText(
                          title: widget.databaseData.city,
                          color: MyColors.primary,
                          size: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                      // print(BlocProvider.of<DatabaseCubit>(context).isExpanded);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: MyColors.primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MyText(
                            title: "تفاصيل",
                            color: MyColors.primary,
                            size: 10.sp,
                            fontWeight: FontWeight.bold,
                            alien: TextAlign.center,
                          ),
                          Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: MyColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (isExpanded)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    MyText(
                      title: widget.databaseData.department,
                      color: MyColors.primary,
                      size: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    MyText(
                      title: widget.databaseData.emailAddress,
                      color: MyColors.primary,
                      size: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
