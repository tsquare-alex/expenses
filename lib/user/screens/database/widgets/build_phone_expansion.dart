import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/constants/validation.dart';
import '../../../../general/themes/cubit/app_theme_cubit.dart';
import '../../../../general/widgets/MyText.dart';
class BuildPhoneExpansion extends StatefulWidget {
  BuildPhoneExpansion({Key? key, required this.mainPhoneController, required this.extraPhoneController}) : super(key: key);
 final TextEditingController mainPhoneController;
  final TextEditingController extraPhoneController;
  @override
  State<BuildPhoneExpansion> createState() => _BuildPhoneExpansionState();
}

class _BuildPhoneExpansionState extends State<BuildPhoneExpansion> {


  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(),
      // leading: Icon(Icons.phone, color: MyColors.primary),
      title: MyText(title: "أرقام الهاتف", color:  context.watch<AppThemeCubit>().isDarkMode
          ? MyColors.white
          : MyColors.black, size: 15.sp),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(title: tr(context, "phoneNumber"), color: Colors.grey, size: 12.sp),
                  const SizedBox(width: 10),

                  Expanded(
                    child: GenericTextField(
                      controller: widget.mainPhoneController,
                      label:  tr(context, "enterPhone"),
                      type: TextInputType.phone,
                      validate: (value) => validatePhoneField(value,context),

                      fieldTypes: FieldTypes.normal,
                      action: TextInputAction.next,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Extra Phone Number
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(title:  tr(context, "secondPhoneNumber"), color: Colors.grey, size: 12.sp),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GenericTextField(
                      controller: widget.extraPhoneController,
                     label:  tr(context, "enterPhone"),
                      type: TextInputType.phone,
                      validate: (value) => validatePhoneField(value,context),
                      fieldTypes: FieldTypes.normal,
                      action: TextInputAction.done,
                    ),
                  ),
                  // IconButton(
                  //   icon: Icon(Icons.add_circle_outline, color: MyColors.primary),
                  //   onPressed: () {
                  //     showDialog(
                  //       context: context,
                  //       builder: (context) => AlertDialog(
                  //         title: Text("إضافة رقم هاتف إضافي"),
                  //         content: TextField(
                  //           decoration: InputDecoration(labelText: "الرقم الجديد"),
                  //           keyboardType: TextInputType.phone,
                  //           onChanged: (value) {
                  //             setState(() {
                  //               widget.extraPhoneController.text = value;
                  //             });
                  //           },
                  //         ),
                  //         actions: [
                  //           TextButton(
                  //             onPressed: () {
                  //               Navigator.pop(context);
                  //             },
                  //             child: Text("إلغاء"),
                  //           ),
                  //           TextButton(
                  //             onPressed: () {
                  //               // يتم إضافة الرقم الجديد هنا
                  //               Navigator.pop(context);
                  //             },
                  //             child: Text("إضافة"),
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class BuildPhoneExpansion extends StatefulWidget {
//    BuildPhoneExpansion({Key? key, required this.phoneFormKey, required this.phoneController}) : super(key: key);
//   final GlobalKey<FormState> phoneFormKey;
//   final TextEditingController phoneController;
//
//   @override
//   State<BuildPhoneExpansion> createState() => _BuildPhoneExpansionState();
// }
//
// class _BuildPhoneExpansionState extends State<BuildPhoneExpansion> {
//   String? newPhoneType = "موبايل";
//
//   final List<String> phonesType = [
//     'أرضى',
//     'موبايل',
//     'فاكس',
//   ];
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Form(
//       key: widget.phoneFormKey,
//       child: ExpansionTile(
//         // key: phoneExpansionKey,
//         leading: Icon(Icons.phone, color: MyColors.primary),
//         title:
//         MyText(title: "أرقام الهاتف", color: MyColors.primary, size: 15.sp),
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 18.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     MyText(title: widget.phoneController.text.isEmpty ? "أضافة رقم" :widget.phoneController.text, color: Colors.grey, size: 12.sp),
//                     Container(
//                       padding: const EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         color: MyColors.primary,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: MyText(
//                           title: "افتراضي", color: MyColors.white, size: 12.sp),
//                     ),
//                     DropdownButton(
//                       underline: const SizedBox(),
//                       value: newPhoneType,
//                       icon: const Icon(Icons.keyboard_arrow_down),
//                       items: [
//                         ...phonesType.map((String items) {
//                           return DropdownMenuItem(
//                             value: items,
//                             child: Row(
//                               children: [
//                                 Text(items),
//                                 if (items == newPhoneType)
//                                   Icon(Icons.check, color: MyColors.primary),
//                               ],
//                             ),
//                           );
//                         }),
//                         DropdownMenuItem(
//                           value: 'أخرى',
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.add_circle_outline_rounded,
//                                 color: Colors.red,
//                                 size: 15.sp,
//                               ),
//                               MyText(
//                                 title: "أخرى",
//                                 color: Colors.red,
//                                 size: 10.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               if ('أخرى' ==
//                                   newPhoneType) // Show check only for the selected item
//                                 Icon(Icons.check, color: MyColors.primary),
//                             ],
//                           ),
//                         ),
//                       ],
//                       onChanged: (String? newValue) async {
//                         if (newValue == 'أخرى') {
//                           newPhoneType = await showDialog<String>(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return SimpleDialog(
//                                 title: const Text('إضافة رقم جديد'),
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(16.0),
//                                     child: TextField(
//                                       decoration: const InputDecoration(
//                                         labelText: 'الرقم الجديد',
//                                       ),
//                                       onChanged: (value) {
//                                         newPhoneType = value;
//                                       },
//                                     ),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       TextButton(
//                                         onPressed: () {
//                                           Navigator.pop(context);
//                                         },
//                                         child: const Text('إلغاء'),
//                                       ),
//                                       TextButton(
//                                         onPressed: () {
//                                           if (newPhoneType != null &&
//                                               newPhoneType!.isNotEmpty) {
//                                             Navigator.pop(
//                                                 context, newPhoneType);
//                                           } else {
//                                             ScaffoldMessenger.of(context)
//                                                 .showSnackBar(
//                                               const SnackBar(
//                                                 content: Text(
//                                                     'يرجى إدخال رقم جديد.'),
//                                               ),
//                                             );
//                                           }
//                                         },
//                                         child: const Text('إضافة'),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//
//                           if (newPhoneType != null) {
//                             setState(() {
//                               phonesType.add(newPhoneType!);
//                             });
//                           }
//                         } else {
//                           setState(() {
//                             newPhoneType = newValue!;
//                           });
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () async {
//                         String? newPhoneNumber = await showDialog<String>(
//                           context: context,
//                           builder: (BuildContext context) {
//                             String phoneNumber = '';
//                             return SimpleDialog(
//                               title:  Text(tr(context, "databasePhoneNumbers")),
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(16.0),
//                                   child: TextFormField(
//                                     validator: (value) => validateField(value),
//
//                                     decoration:  InputDecoration(
//                                       labelText: tr(context, "databaseTheNewNumber"),
//                                     ),
//                                     onChanged: (value) {
//                                       phoneNumber = value;
//                                     },
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     TextButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       child:  MyText(title: tr(context, "cancel"), color: MyColors.primary, size: 12.sp),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         if (phoneNumber.isNotEmpty) {
//                                           Navigator.pop(context, phoneNumber);
//                                         } else {
//                                           ScaffoldMessenger.of(context)
//                                               .showSnackBar(
//                                             const SnackBar(
//                                               content: Text(
//                                                   'يرجى إدخال رقم تليفون.'),
//                                             ),
//                                           );
//                                         }
//                                       },
//                                       child:  MyText(title: tr(context, "add"), color: MyColors.primary, size: 12.sp),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//
//                         if (newPhoneNumber != null) {
//                           setState(() {
//                             widget.phoneController.text = newPhoneNumber;
//                           });
//                         }
//                       },
//                       child: Row(
//                         children: [
//                           const Icon(Icons.add_circle_outline_rounded,
//                               color: Colors.red),
//                           const SizedBox(width: 7),
//                           MyText(
//                             title: tr(context, "databaseAddPhoneNumber"),
//                             color: Colors.red,
//                             size: 12.sp,
//                             fontWeight: FontWeight.bold,
//                             alien: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
