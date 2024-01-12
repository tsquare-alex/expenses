import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/constants/validation.dart';
import '../../../../general/packages/localization/Localizations.dart';
import '../../../../general/widgets/MyText.dart';

class BuildCategoryExpansion extends StatefulWidget {
  const BuildCategoryExpansion({Key? key,
    required this.categoryFormKey, required this.categoryController}) : super(key: key);
  final GlobalKey<FormState> categoryFormKey;
  final TextEditingController categoryController;
  @override
  State<BuildCategoryExpansion> createState() => _BuildCategoryExpansionState();
}
class _BuildCategoryExpansionState extends State<BuildCategoryExpansion> {
  List<String> categories = ["categoryImage",'categoryPlace', 'categoryItem',"categoryService", 'categoryPerson'];
  String? newCategory;
  String? selectedCategory;

  TextEditingController newCategoryController = TextEditingController();
  String getLocalizedCategory(String category, BuildContext context) {
    String localizedCategory = tr(context, category);
    return localizedCategory.isNotEmpty ? localizedCategory : category;
  }
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.categoryFormKey,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: MyColors.greyWhite,
            )
        ),
        child: ExpansionTile(
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.transparent)),
          onExpansionChanged: (bool expanding) {
            setState(() {
              isExpanded = expanding;
            });
          },
          // leading: Icon(Icons.ac_unit, color: MyColors.primary),
          title: MyText(
            title: tr(context, "category"),
            color: isExpanded ? Colors.black : MyColors.grey,
            size:  16.sp,
            fontWeight:  isExpanded ? FontWeight.bold : FontWeight.normal,
          ),          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                String category = categories[index];
                String localizedCategory = getLocalizedCategory(category, context);
                bool isSelected = selectedCategory == category;

                return ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          localizedCategory,
                          style: TextStyle(
                            color: isSelected ? MyColors.primary : Colors.black,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Radio<String>(
                        activeColor: Colors.blue,
                        value: category,
                        groupValue: selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                            widget.categoryController.text = getLocalizedCategory(value!, context);
                            print(widget.categoryController.text);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),


            // ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: categories.length,
            //   itemBuilder: (context, index) {
            //     String category = categories[index];
            //     String localizedCategory = getLocalizedCategory(category, context);
            //     return ListTile(
            //       title: Row(
            //         children: [
            //           Expanded(
            //             child: Text(localizedCategory),
            //           ),
            //           Radio<String>(
            //             value: category,
            //             groupValue: selectedCategory,
            //             onChanged: (value) {
            //               setState(() {
            //                 selectedCategory = value;
            //                 widget.categoryController.text = getLocalizedCategory(value!, context);
            //                 print(widget.categoryController.text);
            //               });
            //             },
            //           ),
            //         ],
            //       ),
            //     );
            //
            //     return ListTile(
            //       title: Text(localizedCategory),
            //       leading: Radio<String>(
            //         value: category,
            //         groupValue: selectedCategory,
            //         onChanged: (value) {
            //           setState(() {
            //             selectedCategory = value;
            //             widget.categoryController.text = getLocalizedCategory(value!, context);
            //             print(widget.categoryController.text);
            //           });
            //         },
            //       ),
            //     );
            //   },
            // ),


          ],
        ),
      ),
    );
  }
}




