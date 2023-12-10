import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/validation.dart';
import '../../../../general/packages/input_fields/GenericTextField.dart';

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
            title: tr(context, "databaseSocialAddress"), color: MyColors.primary, size: 15.sp),
        children: [
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: widget.socialWebController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            validate: (value)=> validateField(value),
            label: tr(context, "databaseSocialAddressWeb"),
            margin: const EdgeInsets.only(top: 20),
          ),
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: widget.facebookController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            validate: (value)=> validateField(value),
            label: tr(context, "databaseSocialAddressFacebook"),
            margin: const EdgeInsets.only(top: 20),
          ),
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: widget.instagramController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            validate: (value)=> validateField(value),
            label: tr(context, "databaseSocialAddressInstagram"),
            margin: const EdgeInsets.only(top: 20),
          ),
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: widget.youtubeController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            validate: (value)=> validateField(value),
            label: tr(context, "databaseSocialAddressYoutube"),
            margin: const EdgeInsets.only(top: 20),
          ),
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: widget.messengerController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            validate: (value)=> validateField(value),
            label: tr(context, "databaseSocialAddressMessenger"),
            margin: const EdgeInsets.only(top: 20),
          ),
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: widget.theSocialController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            validate: (value)=> validateField(value),
            label: tr(context, "databaseSocialAddressWeb"),
            margin: const EdgeInsets.only(top: 20),
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
                        title:  MyText(
                            title: tr(context, "databaseSocialAddressAddWeb"), color: MyColors.primary, size: 12.sp),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              validator: (value) => validateField(value),

                              decoration:  InputDecoration(
                                labelText: tr(context, "databaseSocialAddressAddWeb"),
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
                                child:  MyText(
                                    title: tr(context, "cancel"),
                                    color:  MyColors.primary,
                                    size: 12.sp),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (webAddress.isNotEmpty) {
                                    Navigator.pop(context, webAddress);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                       SnackBar(
                                        content:  MyText(
                                            title: tr(context, "databaseSocialAddressAddWeb"),
                                            color:  MyColors.primary,
                                            size: 12.sp),
                                      ),
                                    );
                                  }
                                },
                                child:  MyText(
                                    title: tr(context, "databaseSocialAddressAddWeb"),
                                    color:  MyColors.primary,
                                    size: 12.sp),
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
                      title: tr(context, "databaseSocialAddressAddWeb"),
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
