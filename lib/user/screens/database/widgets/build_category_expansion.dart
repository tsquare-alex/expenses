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
  List<String> categories = ['categoryPlace', 'categoryPerson', 'categoryItem'];
  String? newCategory;
  String? selectedCategory;

  TextEditingController newCategoryController = TextEditingController();
  String getLocalizedCategory(String category, BuildContext context) {
    String localizedCategory = tr(context, category);
    return localizedCategory.isNotEmpty ? localizedCategory : category;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.categoryFormKey,
      child: ExpansionTile(
        leading: Icon(Icons.ac_unit, color: MyColors.primary),
        title: MyText(title: tr(context, "category"), color: MyColors.primary, size: 15.sp),
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              String category = categories[index];
              String localizedCategory = getLocalizedCategory(category, context);

              return ListTile(
                title: Text(localizedCategory),
                leading: Radio<String>(
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
              );
            },
          ),

          ListTile(
            title: MyText(title: tr(context, "categoryAddNewCategory"), color: MyColors.primary, size: 12.sp),
            onTap: () async {
              newCategoryController.clear(); // Clear the text field when opening the dialog
              newCategory = await showDialog<String>(
                context: context,
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: MyText(title: tr(context, "categoryAddNewCategory"), color: MyColors.primary, size: 12.sp),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: newCategoryController, // Use the new controller
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
                  selectedCategory = newCategory;
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

// class _BuildCategoryExpansionState extends State<BuildCategoryExpansion> {
//   List<String> categories = ['categoryPlace',
//   "categoryPerson",
//   "categoryItem",
//   ];
//   String? newCategory;
//   String? selectedCategory; // Added variable to track the selected category
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: widget.categoryFormKey,
//       child: ExpansionTile(
//         leading: Icon(Icons.ac_unit, color: MyColors.primary),
//         title: MyText(title: tr(context, "category"), color: MyColors.primary, size: 15.sp),
//         children: [
//           ListView.builder(
//             shrinkWrap: true,
//             itemCount: categories.length,
//             itemBuilder: (context, index) {
//               String category = categories[index];
//               return ListTile(
//                 title: Text(tr(context, category)),
//                 leading: Radio<String>(
//                   value: category,
//                   groupValue: selectedCategory,
//                   onChanged: (value) {
//                     setState(() {
//                       selectedCategory = value;
//                       widget.categoryController.text = tr(context, value!);
//                       print(widget.categoryController.text);
//                     });
//                   },
//                 ),
//               );
//             },
//           ),
//           ListTile(
//             title: MyText(title: tr(context, "categoryAddNewCategory"), color: MyColors.primary, size: 12.sp),
//             onTap: () async {
//               newCategory = await showDialog<String>(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return SimpleDialog(
//                     title: MyText(title: tr(context, "categoryAddNewCategory"), color: MyColors.primary, size: 12.sp),
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: TextFormField(
//                           controller: widget.categoryController,
//                           validator: (value) => validateField(value),
//                           decoration: const InputDecoration(
//                             labelText: 'التصنيف الجديد',
//                           ),
//                           onChanged: (value) {
//                             newCategory = value;
//                           },
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: const Text('إلغاء'),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               if (widget.categoryFormKey.currentState?.validate() == true &&
//                                   !categories.contains(newCategory)) {
//                                 Navigator.pop(context, newCategory);
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text('يرجى إدخال تصنيف غير مكرر وغير فارغ.'),
//                                   ),
//                                 );
//                               }
//                             },
//                             child: const Text('إضافة'),
//                           ),
//                         ],
//                       ),
//                     ],
//                   );
//                 },
//               );
//
//               if (newCategory != null) {
//                 setState(() {
//                   categories.add(newCategory!);
//                   selectedCategory = newCategory; // Set the selected category here
//                   widget.categoryController.text = newCategory!;
//                 });
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }



