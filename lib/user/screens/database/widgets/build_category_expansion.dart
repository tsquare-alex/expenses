import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/constants/validation.dart';
import '../../../../general/packages/localization/Localizations.dart';
import '../../../../general/themes/app_colors.dart';
import '../../../../general/themes/cubit/app_theme_cubit.dart';
import '../../../../general/widgets/DefaultButton.dart';
import '../../../../general/widgets/MyText.dart';





class BuildCategoryExpansion extends StatefulWidget {
  const BuildCategoryExpansion({
    Key? key,
    required this.categoryFormKey,
    required this.categoryController,
  }) : super(key: key);

  final GlobalKey<FormState> categoryFormKey;
  final TextEditingController categoryController;

  @override
  State<BuildCategoryExpansion> createState() =>
      _BuildCategoryExpansionState();
}

class _BuildCategoryExpansionState extends State<BuildCategoryExpansion> {
  List<String> categories = [
    "categoryImage",
    'categoryPlace',
    'categoryItem',
    "categoryService",
    'categoryPerson',
  ];
  String? newCategory;
  String? selectedCategory;

  TextEditingController newCategoryController = TextEditingController();
  String getLocalizedCategory(String category, BuildContext context) {
    String localizedCategory = tr(context, category);
    return localizedCategory.isNotEmpty ? localizedCategory : category;
  }

  bool isExpanded = false;
  ExpansionTileController controller = ExpansionTileController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.categoryFormKey,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: MyColors.greyWhite,
          ),
        ),
        child: ExpansionTile(
          controller: controller,
          // trailing: Icon(isExpanded ? Icons.arrow_drop_up_outlined :Icons.arrow_drop_down),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent),
          ),
          onExpansionChanged: (bool expanding) {
            setState(() {
              isExpanded = expanding;
              print(   isExpanded);

            });
          },

          title: MyText(
            title: tr(context, "category"),
            color:   context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
            size: 16.sp,
            fontWeight:
            isExpanded ? FontWeight.bold : FontWeight.normal,
          ),
          children: [
            if (isExpanded)
            ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                String category = categories[index];
                String localizedCategory =
                getLocalizedCategory(category, context);
                bool isSelected = selectedCategory == category;
                return ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          localizedCategory,
                          style: TextStyle(
                            color:
                               context.watch<AppThemeCubit>().isDarkMode
                              ? MyColors.white
                              : MyColors.black,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
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
                            widget.categoryController.text =
                                getLocalizedCategory(value!, context);
                            controller.collapse();
                            // isExpanded = false;
                          });

                          print(widget.categoryController.text);
                          // print(isExpanded);
                          // print("isExpanded after selecting radio: $isExpanded");
                        },
                      ),


                    ],
                  ),
                );
              },
            ),
            if (isExpanded)
            DefaultButton(title:tr(context, "add"),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color:   context.watch<AppThemeCubit>().isDarkMode
                    ? AppDarkColors.primary
                    : MyColors.primary,
                onTap: () async {
              _addNewCategory(context);
            }
          ),

          ],
        ),
      ),
    );
  }

  void _addNewCategory(BuildContext context) async {
    newCategoryController.clear();
    newCategory = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: MyText(
            title: tr(context, "categoryAddNewCategory"),
            color: MyColors.primary,
            size: 12.sp,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: newCategoryController,
                validator: (value) => validateField(value),
                decoration: const InputDecoration(
                  labelText: 'التصنيف الجديد',
                ),
                onChanged: (value) {
                  newCategory = value;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('إلغاء'),
                ),
                TextButton(
                  onPressed: () {
                    if (widget.categoryFormKey.currentState?.validate() ==
                        true &&
                        !categories.contains(newCategory)) {
                      Navigator.pop(context, newCategory);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('يرجى إدخال تصنيف غير مكرر وغير فارغ.'),
                        ),
                      );
                    }
                  },
                  child: const Text('إضافة'),
                ),
              ],
            ),
          ],
        );
      },
    );

    if (newCategory != null) {
      setState(() {
        categories.add(newCategory!);
        selectedCategory = newCategory;
        widget.categoryController.text = newCategory!;
      });
    }
  }
}
