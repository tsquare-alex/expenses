import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/widgets/MyText.dart';

class BuildPhoneExpansion extends StatefulWidget {
   BuildPhoneExpansion({Key? key, required this.phoneFormKey, required this.phoneController}) : super(key: key);
  final GlobalKey<FormState> phoneFormKey;
  final TextEditingController phoneController;

  @override
  State<BuildPhoneExpansion> createState() => _BuildPhoneExpansionState();
}

class _BuildPhoneExpansionState extends State<BuildPhoneExpansion> {
  String? newPhoneType = "موبايل";

  final List<String> phonesType = [
    'أرضى',
    'موبايل',
    'فاكس',
  ];

   String? validateField(String? value) {
     if (value == null || value.trim().isEmpty) {
       return 'This field cannot be empty.';
     }
     return null;
   }

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: widget.phoneFormKey,
      child: ExpansionTile(
        // key: phoneExpansionKey,
        leading: Icon(Icons.phone, color: MyColors.primary),
        title:
        MyText(title: "أرقام الهاتف", color: MyColors.primary, size: 15.sp),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(title: "أضافة رقم", color: Colors.grey, size: 12.sp),
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
                      value: newPhoneType,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: [
                        ...phonesType.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Row(
                              children: [
                                Text(items),
                                if (items == newPhoneType)
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
                                  newPhoneType) // Show check only for the selected item
                                Icon(Icons.check, color: MyColors.primary),
                            ],
                          ),
                        ),
                      ],
                      onChanged: (String? newValue) async {
                        if (newValue == 'أخرى') {
                          newPhoneType = await showDialog<String>(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                title: const Text('إضافة رقم جديد'),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        labelText: 'الرقم الجديد',
                                      ),
                                      onChanged: (value) {
                                        newPhoneType = value;
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
                                          if (newPhoneType != null &&
                                              newPhoneType!.isNotEmpty) {
                                            Navigator.pop(
                                                context, newPhoneType);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'يرجى إدخال رقم جديد.'),
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

                          if (newPhoneType != null) {
                            setState(() {
                              phonesType.add(newPhoneType!);
                            });
                          }
                        } else {
                          setState(() {
                            newPhoneType = newValue!;
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
                        String? newPhoneNumber = await showDialog<String>(
                          context: context,
                          builder: (BuildContext context) {
                            String phoneNumber = '';
                            return SimpleDialog(
                              title: const Text('إضافة رقم تليفون'),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TextFormField(
                                    validator: (value) => validateField(value),

                                    decoration: const InputDecoration(
                                      labelText: 'الرقم الجديد',
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
                                      child: const Text('إلغاء'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (phoneNumber.isNotEmpty) {
                                          Navigator.pop(context, phoneNumber);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'يرجى إدخال رقم تليفون.'),
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

                        if (newPhoneNumber != null) {
                          setState(() {
                            widget.phoneController.text = newPhoneNumber;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.add_circle_outline_rounded,
                              color: Colors.red),
                          const SizedBox(width: 7),
                          MyText(
                            title: "أضافة رقم تليفون",
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
                Text("The Phone Number is: ${widget.phoneController.text ?? ""}"),
                // Display the added phone number
              ],
            ),
          ),
        ],
      ),
    );
  }
}
