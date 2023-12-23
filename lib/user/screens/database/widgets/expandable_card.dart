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
    // print('==================================================');
    //
    // print(widget.databaseData.image);
    // print('==================================================');

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DatabaseDetails(
              databaseData: widget.databaseData,
              onDataChanged: () {
                // This callback will be called when data is changed in DatabaseDetails
                setState(() {});
              },
            ),
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
                        Row(
                          children: [
                            MyText(
                              title: widget.databaseData.country,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(width: 8),
                            MyText(
                              title: widget.databaseData.city,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(width: 8),
                            MyText(
                              title: widget.databaseData.governorate,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.databaseData.department.isNotEmpty)
                      MyText(
                        title: widget.databaseData.department,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.emailAddress.isNotEmpty)
                      MyText(
                        title: widget.databaseData.emailAddress,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.adjective.isNotEmpty)
                      MyText(
                        title: widget.databaseData.adjective,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.firstName.isNotEmpty)
                      MyText(
                        title: widget.databaseData.firstName,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.secondName.isNotEmpty)
                      MyText(
                        title: widget.databaseData.secondName,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.workName.isNotEmpty)
                      MyText(
                        title: widget.databaseData.workName,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.street.isNotEmpty)
                      MyText(
                        title: widget.databaseData.street,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.buildingNumber.isNotEmpty)
                      MyText(
                        title: widget.databaseData.buildingNumber,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.apartmentNumber.isNotEmpty)
                      MyText(
                        title: widget.databaseData.apartmentNumber,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.postalNumber.isNotEmpty)
                      MyText(
                        title: widget.databaseData.postalNumber,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.eventTitle.isNotEmpty)
                      MyText(
                        title: widget.databaseData.eventTitle,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.eventDate.isNotEmpty)
                      MyText(
                        title: widget.databaseData.eventDate,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.eventDetails.isNotEmpty)
                      MyText(
                        title: widget.databaseData.eventDetails,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.notes.isNotEmpty)
                      MyText(
                        title: widget.databaseData.notes,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.web.isNotEmpty)
                      MyText(
                        title: widget.databaseData.web,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.facebook.isNotEmpty)
                      MyText(
                        title: widget.databaseData.facebook,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.instagram.isNotEmpty)
                      MyText(
                        title: widget.databaseData.instagram,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.youtube.isNotEmpty)
                      MyText(
                        title: widget.databaseData.youtube,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    if (widget.databaseData.messenger.isNotEmpty)
                      MyText(
                        title: widget.databaseData.messenger,
                        color: MyColors.primary,
                        size: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
