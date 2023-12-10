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

  List<String> categories = [
    'موقع',
    'شركة',
    'محل',
    'مكتب',
    'جهة',
    'عنوان',
  ];
  String? newCategory;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.categoryFormKey,
      child: ExpansionTile(
        leading: Icon(Icons.ac_unit, color: MyColors.primary),
        title: MyText(title: tr(context, "category"), color: MyColors.primary, size: 15.sp),
        children: [
          for (String category in categories)
            ListTile(
              title: Text(category),
              leading: Radio<String>(
                value: category,
                groupValue: widget.categoryController.text,
                onChanged: (value) {
                  setState(() {
                    widget.categoryController.text = value!;
                    print(widget.categoryController.text);
                  });
                },
              ),
            ),


          ListTile(
            title:  MyText(title:tr(context, "categoryAddNewCategory"),color: MyColors.primary,size: 12.sp),
            onTap: () async {
              newCategory = await showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title:  MyText(title:tr(context, "categoryAddNewCategory"),color: MyColors.primary,size: 12.sp),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: widget.categoryController,
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
                              if (widget.categoryFormKey.currentState?.validate() == true &&
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
                  widget.categoryController.text = newCategory!;
                });
              }
            },
          ),

        ],
      ),
    );
  }
}


