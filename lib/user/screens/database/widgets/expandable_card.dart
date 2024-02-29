import 'dart:io';
import 'dart:typed_data';

import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:expenses/user/screens/database/cubit/add_database_cubit/add_data_base_cubit.dart';
import 'package:expenses/user/screens/database/cubit/add_database_cubit/add_data_base_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/models/data_base_model/data_base_model.dart';
import '../../../../general/themes/cubit/app_theme_cubit.dart';
import '../../../../general/widgets/MyText.dart';
import '../cubit/database_cubit.dart';
import 'database_details.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

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

  @override
  Widget build(BuildContext context) {
    print("QR Code Data: ${widget.databaseData.generateQRCodeData()}");
    print("Image Data: ${widget.databaseData.image}");
    print("Other Details: ${widget.databaseData.name}, ${widget.databaseData
        .category}, ...");


    return BlocConsumer<DatabaseCubit, DatabaseState>(
      listener: (context, state) {
        if (state is DeleteDatabaseSuccess || state is DatabaseDataLoaded) {
          // Fetch updated data or trigger a UI update
          context.read<DatabaseCubit>().fetchAllDatabase();
        }

      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DatabaseDetails(
                      databaseData: widget.databaseData,
                      onDataChanged: () {
                        setState(() {});
                      },
                    ),
              ),
            );
          },
          child: Card(
            elevation: 1,
            // surfaceTintColor: Colors.transparent,
            color: context
                .watch<AppThemeCubit>()
                .isDarkMode
                ? MyColors.greyWhite : MyColors.white,
            child: Container(
              margin: EdgeInsets.only(bottom: 16.r),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    // alignment: Alignment.bottomRight,
                    child: QrImageView(
                      data: widget.databaseData.generateQRCodeData() ?? '',
                      version: QrVersions.auto,
                      size: 200.0,
                      errorCorrectionLevel: QrErrorCorrectLevel.L,
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.databaseData.image!.isNotEmpty
                          ? CircleAvatar(
                        radius: 25.0,
                        backgroundImage: MemoryImage(widget.databaseData
                            .image!),
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
                              title: widget.databaseData.name!,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: widget.databaseData.category!,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: widget.databaseData.phone!,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: widget.databaseData.extraPhone!,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: widget.databaseData.address!,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: widget.databaseData.note!,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: widget.databaseData.job!,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: widget.databaseData.emailAddress!,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: widget.databaseData.date!,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: widget.databaseData.facebook!,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: widget.databaseData.whatsapp!,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: widget.databaseData.instagram!,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: widget.databaseData.twitter!,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            MyText(
                              title: widget.databaseData.youtube!,
                              color: MyColors.primary,
                              size: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


class DatabaseTitle extends StatelessWidget {
  const DatabaseTitle({
    super.key,
    required this.titleLocalization, required this.title,
  });

  // final ExpandableCard widget;
  final String titleLocalization;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyText(
          title: "${tr(context, titleLocalization)} :",
          color: MyColors.secondary,
          size: 15.sp,
          fontWeight: FontWeight.bold,
        ),
        MyText(
          title: title,
          color: MyColors.primary,
          size: 15.sp,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
