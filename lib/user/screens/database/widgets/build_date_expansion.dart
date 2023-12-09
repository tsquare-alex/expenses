import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/constants/validation.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildDateExpansion extends StatefulWidget {
  const BuildDateExpansion({Key? key, required this.dateFormKey, required this.dateLocationController, required this.dateTimeController, required this.dateDetailsController, required this.dateController}) : super(key: key);
  final GlobalKey<FormState> dateFormKey;
  final TextEditingController dateLocationController ;
  final TextEditingController dateTimeController ;
  final TextEditingController dateDetailsController ;
  final TextEditingController dateController ;

  @override
  State<BuildDateExpansion> createState() => _BuildDateExpansionState();
}

class _BuildDateExpansionState extends State<BuildDateExpansion> {
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: widget.dateFormKey,
      child: ExpansionTile(

        leading: Icon(
          Icons.date_range_outlined,
          color: MyColors.primary,
        ),
        title: MyText(title: "تاريخ هام", color: MyColors.primary, size: 15.sp),
        children: [
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "عنوان المناسبة"),
            controller: widget.dateLocationController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "تاريخ المناسبة"),
            controller: widget.dateTimeController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "تفاصيل المناسبة"),
            controller: widget.dateDetailsController,
            onChanged: (value) {},
            maxLines: 5,
          ),
          TextFormField(
            validator: (value) => validateField(value),

            readOnly: true,
            decoration: const InputDecoration(
              hintText: "التاريخ",
            ),
            controller: widget.dateController,
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  String? newDate = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      String date = '';
                      return SimpleDialog(
                        title: const Text('أضافة عنوان'),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              validator: (value) => validateField(value),

                              decoration: const InputDecoration(
                                labelText: 'العنوان الجديد',
                              ),
                              controller: widget.dateController,
                              onChanged: (value) {
                                date = value;
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
                                  if (date.isNotEmpty) {
                                    Navigator.pop(context, date);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('يرجى إدخال عنوان جديد.'),
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

                  if (newDate != null) {
                    setState(() {
                      widget.dateController.text = newDate;
                    });
                  }
                },
                child: Row(
                  children: [
                    const Icon(Icons.add_circle_outline_rounded,
                        color: Colors.red),
                    const SizedBox(width: 7),
                    MyText(
                      title: "أضافة تاريخ",
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
          const SizedBox(height: 20),
          Text("The Date is: ${widget.dateController.text}"),
        ],
      ),
    );
  }
}
