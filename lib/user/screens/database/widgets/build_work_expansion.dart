import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/constants/validation.dart';
import '../../../../general/widgets/MyText.dart';

class BuildWorkExpansion extends StatelessWidget {
  const BuildWorkExpansion({Key? key, required this.workPositionController, required this.departmentController, required this.companyController,required this.workPlaceFormKey}) : super(key: key);
  final GlobalKey<FormState> workPlaceFormKey;

  final TextEditingController workPositionController;
  final TextEditingController departmentController;
  final TextEditingController companyController;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: workPlaceFormKey,
      child: ExpansionTile(
        leading: Icon(Icons.work_outline_sharp, color: MyColors.primary),
        title: MyText(title: "العمل", color: MyColors.primary, size: 15.sp),
        children: [
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: workPositionController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            validate: (value)=> validateField(value),
            label: tr(context, "databaseJobTitle"),
            margin: const EdgeInsets.only(top: 20),
          ),
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: departmentController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            validate: (value)=> validateField(value),
            label: tr(context, "databaseDepartment"),
            margin: const EdgeInsets.only(top: 20),
          ),
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: companyController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            validate: (value)=> validateField(value),
            label: tr(context, "databaseCompany"),
            margin: const EdgeInsets.only(top: 20),
          ),



        ],
      ),
    );
  }
}
