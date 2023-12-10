import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/models/data_base_model/data_base_model.dart';
import '../../../../general/widgets/MyText.dart';
import '../cubit/database_cubit.dart';
import 'database_details.dart';

class ExpandableCard extends StatefulWidget {
  final DataBaseModel databaseData;


  const ExpandableCard({Key? key, required this.databaseData,})
      : super(key: key);

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DatabaseDetails(databaseData: widget.databaseData),
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
                  CircleAvatar(
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
                          title: widget.databaseData.companyName,
                          color: MyColors.primary,
                          size: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            MyText(
                              title: widget.databaseData.type,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            MyText(
                              title: widget.databaseData.phone,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        MyText(
                          title: widget.databaseData.address,
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
                      title: widget.databaseData.name,
                      color: MyColors.primary,
                      size: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    MyText(
                      title: widget.databaseData.email,
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
