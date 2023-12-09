import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/validation.dart';

class BuildAddressExpansion extends StatefulWidget {
  const BuildAddressExpansion({Key? key, required this.socialAddressFormKey, required this.socialWebController, required this.facebookController, required this.instagramController, required this.youtubeController, required this.messengerController, required this.theSocialController}) : super(key: key);

  final GlobalKey<FormState> socialAddressFormKey ;

  final TextEditingController socialWebController ;
  final TextEditingController facebookController ;
  final TextEditingController instagramController ;
  final TextEditingController youtubeController ;
  final TextEditingController messengerController ;
  final TextEditingController theSocialController ;

  @override
  State<BuildAddressExpansion> createState() => _BuildAddressExpansionState();
}

class _BuildAddressExpansionState extends State<BuildAddressExpansion> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.socialAddressFormKey,
      child: ExpansionTile(
        leading: Icon(
          Icons.web_outlined,
          color: MyColors.primary,
        ),
        title: MyText(
            title: "عناوين الكترونية", color: MyColors.primary, size: 15.sp),
        children: [
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "الموقع الالكترونى"),
            controller: widget.socialWebController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "الفيس بوك"),
            controller: widget.facebookController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "الانستجرام"),
            controller: widget.instagramController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "اليوتيوب"),
            controller: widget.youtubeController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "الماسنجر"),
            controller: widget.messengerController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            readOnly: true,
            decoration: const InputDecoration(
              hintText: "موقع الكترونى",
            ),
            controller: widget.theSocialController,
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  String? newWebAddress = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      String webAddress = '';
                      return SimpleDialog(
                        title: const Text('أضافة موقع الكترونى'),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              validator: (value) => validateField(value),

                              decoration: const InputDecoration(
                                labelText: 'الموقع الالكترونى الجديد',
                              ),
                              controller: widget.theSocialController,
                              onChanged: (value) {
                                webAddress = value;
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
                                  if (webAddress.isNotEmpty) {
                                    Navigator.pop(context, webAddress);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('يرجى إدخال موقع جديد.'),
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

                  if (newWebAddress != null) {
                    setState(() {
                      widget.theSocialController.text = newWebAddress;
                    });
                  }
                },
                child: Row(
                  children: [
                    const Icon(Icons.add_circle_outline_rounded,
                        color: Colors.red),
                    const SizedBox(width: 7),
                    MyText(
                      title: "أضافة موقع الكترونى",
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
          Text("The Social Address is: ${widget.theSocialController.text}"),
        ],
      ),
    );
  }
}
