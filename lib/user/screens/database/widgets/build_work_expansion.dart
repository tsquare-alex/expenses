import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/widgets/MyText.dart';

class BuildWorkExpansion extends StatelessWidget {
  const BuildWorkExpansion({Key? key, required this.workPositionController, required this.departmentController, required this.companyController,required this.workPlaceFormKey}) : super(key: key);
  final GlobalKey<FormState> workPlaceFormKey;

  String? validateField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty.';
    }
    return null;
  }
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
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "المسمى الوظيفى"),
            controller: workPositionController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "القسم"),
            controller: departmentController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "الشركة"),
            controller: companyController,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
