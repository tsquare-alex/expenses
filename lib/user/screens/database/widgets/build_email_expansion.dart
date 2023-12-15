import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/validation.dart';


class BuildEmailExpansion extends StatefulWidget {
   const BuildEmailExpansion({Key? key, required this.emailFormKey, required this.emailController}) : super(key: key);
  final GlobalKey<FormState> emailFormKey;
  final TextEditingController emailController;

  @override
  State<BuildEmailExpansion> createState() => _BuildEmailExpansionState();
}

class _BuildEmailExpansionState extends State<BuildEmailExpansion> {
  String? newEmailType = "شخصى";

  List<String> emailType = [
    'شخصى',
    'عمل',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.emailFormKey,
      child: ExpansionTile(
        leading: Icon(Icons.email_outlined, color: MyColors.primary),

        title: MyText(
            title:tr(context, "databaseEmail"), color: MyColors.primary, size: 15.sp),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      MyText(title: widget.emailController.text.isEmpty ? tr(context, "databaseEmail") :widget.emailController.text, color:MyColors.primary, size: 12.sp),

                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: MyColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: MyText(
                          title: "افتراضي", color: MyColors.white, size: 12.sp),
                    ),
                    DropdownButton(
                      underline: const SizedBox(),
                      value: newEmailType,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: [
                        ...emailType.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Row(
                              children: [
                                Text(items),
                                if (items == newEmailType)
                                  Icon(Icons.check, color: MyColors.primary),
                              ],
                            ),
                          );
                        }),
                        DropdownMenuItem(
                          value: 'أخرى',
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_circle_outline_rounded,
                                color: Colors.red,
                                size: 15.sp,
                              ),
                              MyText(
                                title: "أخرى",
                                color: Colors.red,
                                size: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              if ('أخرى' ==
                                  newEmailType) // Show check only for the selected item
                                Icon(Icons.check, color: MyColors.primary),
                            ],
                          ),
                        ),
                      ],
                      onChanged: (String? newValue) async {
                        if (newValue == 'أخرى') {
                          newEmailType = await showDialog<String>(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                title:  MyText(
                                    title: tr(context, "databaseAddEmail"),
                                    color: Colors.grey,
                                    size: 12.sp),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        labelText: 'البريد الجديد',
                                      ),
                                      onChanged: (value) {
                                        newEmailType = value;
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
                                        child:  MyText(
                                            title: tr(context, "cancel"),
                                            color:  MyColors.primary,
                                            size: 12.sp),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          if (newEmailType != null &&
                                              newEmailType!.isNotEmpty) {
                                            Navigator.pop(
                                                context, newEmailType);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'يرجى إدخال بريد جديد.'),
                                              ),
                                            );
                                          }
                                        },
                                        child: MyText(
                                            title: tr(context, "add"),
                                            color:  MyColors.primary,
                                            size: 12.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                          if (newEmailType != null) {
                            setState(() {
                              emailType.add(newEmailType!);
                            });
                          }
                        } else {
                          setState(() {
                            newEmailType = newValue!;
                          });
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        String? newEmail = await showDialog<String>(
                          context: context,
                          builder: (BuildContext context) {
                            String phoneNumber = '';
                            return SimpleDialog(
                              title:  MyText(
                                  title: tr(context, "databaseAddEmail"),
                                  color:  MyColors.primary,
                                  size: 12.sp),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TextFormField(
                                    validator: (value) => validateField(value),

                                    decoration:  InputDecoration(
                                      labelText: tr(context, "databaseTheNewEmail"),
                                    ),
                                    onChanged: (value) {
                                      phoneNumber = value;
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
                                      child:  MyText(
                                          title: tr(context, "cancel"),
                                          color: MyColors.primary,
                                          size: 12.sp),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (phoneNumber.isNotEmpty) {
                                          Navigator.pop(context, phoneNumber);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                             SnackBar(
                                              content:   MyText(
                                                  title: tr(context, "databaseAddEmail"),
                                                  color: MyColors.primary,
                                                  size: 12.sp),
                                            ),
                                          );
                                        }
                                      },
                                      child:  MyText(
                                          title: tr(context, "add"),
                                          color: MyColors.primary,
                                          size: 12.sp),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );

                        if (newEmail != null) {
                          setState(() {
                            widget.emailController.text = newEmail;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.add_circle_outline_rounded,
                              color: Colors.red),
                          const SizedBox(width: 7),

                          MyText(
                            title: tr(context, "databaseAddEmail"),
                            color: Colors.red,
                            size: 12.sp,
                            fontWeight: FontWeight.bold,
                            alien: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
