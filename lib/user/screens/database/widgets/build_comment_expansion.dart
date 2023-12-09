import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/validation.dart';

class BuildCommentExpansion extends StatefulWidget {
  const BuildCommentExpansion({Key? key, required this.commentController, required this.commentFormKey}) : super(key: key);
  final TextEditingController commentController ;
  final GlobalKey<FormState> commentFormKey ;

  @override
  State<BuildCommentExpansion> createState() => _BuildCommentExpansionState();
}

class _BuildCommentExpansionState extends State<BuildCommentExpansion> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.commentFormKey,
      child: ExpansionTile(
        leading: Icon(
          Icons.edit_note_sharp,
          color: MyColors.primary,
        ),
        title: MyText(title: "ملاحظات", color: MyColors.primary, size: 15.sp),
        children: [
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(
                hintText: "ملاحظة1",
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder()),
            controller: widget.commentController,
            maxLines: 3,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            readOnly: true,
            decoration: const InputDecoration(
              hintText: "التاريخ",
            ),
            controller: widget.commentController,
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  String? newComment = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      String comment = '';
                      return SimpleDialog(
                        title: const Text('أضافة ملاحظة'),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              validator: (value) => validateField(value),

                              decoration: const InputDecoration(
                                labelText: 'ملاحظة جديد',
                              ),
                              controller: widget.commentController,
                              onChanged: (value) {
                                comment = value;
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
                                  if (comment.isNotEmpty) {
                                    Navigator.pop(context, comment);
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

                  if (newComment != null) {
                    setState(() {
                      widget.commentController.text = newComment;
                    });
                  }
                },
                child: Row(
                  children: [
                    const Icon(Icons.add_circle_outline_rounded,
                        color: Colors.red),
                    const SizedBox(width: 7),
                    MyText(
                      title: "أضافة ملاحظة",
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
          Text("The Comment is: ${widget.commentController.text}"),
        ],
      ),
    );
  }
}
