// import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
// import 'package:expenses/general/packages/localization/Localizations.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../general/constants/MyColors.dart';
// import '../../../../general/constants/validation.dart';
// import '../../../../general/widgets/MyText.dart';
//
//
//
// class BuildNamesExpansion extends StatefulWidget {
//   const BuildNamesExpansion({
//     Key? key,
//     required this.namesFormKey,
//     required this.designationController,
//     required this.firstNameController,
//     required this.lastNameController,
//   }) : super(key: key);
//
//   final GlobalKey<FormState> namesFormKey;
//   final TextEditingController designationController;
//   final TextEditingController firstNameController;
//   final TextEditingController lastNameController;
//
//
//   @override
//   State<BuildNamesExpansion> createState() => _BuildNamesExpansionState();
// }
//
// class _BuildNamesExpansionState extends State<BuildNamesExpansion> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: widget.namesFormKey,
//       autovalidateMode:  AutovalidateMode.onUserInteraction,
//       child: ExpansionTile(
//         leading: Icon(Icons.person, color: MyColors.primary),
//         title: MyText(
//           title:tr(context,'databaseAddNames'),
//           color: MyColors.primary,
//           size: 15.sp,
//         ),
//         children: [
//           GenericTextField(
//             contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//             controller: widget.designationController,
//             fieldTypes: FieldTypes.normal,
//             type: TextInputType.emailAddress,
//             action: TextInputAction.next,
//             validate: (value)=> validateField(value),
//             label: tr(context, "databaseAddNamesAdjective"),
//             margin: const EdgeInsets.only(top: 20),
//           ),
//           GenericTextField(
//             contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//             controller: widget.firstNameController,
//             fieldTypes: FieldTypes.normal,
//             type: TextInputType.emailAddress,
//             action: TextInputAction.next,
//             validate: (value)=> validateField(value),
//             label: tr(context, "databaseAddNamesFirstName"),
//             margin: const EdgeInsets.only(top: 20),
//           ),
//           GenericTextField(
//             contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//             controller: widget.lastNameController,
//             fieldTypes: FieldTypes.normal,
//             type: TextInputType.emailAddress,
//             action: TextInputAction.next,
//             validate: (value)=> validateField(value),
//             label: tr(context, "databaseAddNamesSecondName"),
//             margin: const EdgeInsets.only(top: 20),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
//
//
