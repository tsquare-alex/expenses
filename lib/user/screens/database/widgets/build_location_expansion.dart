import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/widgets/MyText.dart';

class BuildLocationExpansion extends StatefulWidget {
  const BuildLocationExpansion({Key? key, required this.locationFormKey, required this.countryController, required this.governorateController, required this.cityController, required this.streetController, required this.postalController, required this.buildingNumberController, required this.apartmentNumberController, required this.addressController, required this.theNewAddressController}) : super(key: key);

  final GlobalKey<FormState> locationFormKey ;

  final TextEditingController countryController ;
  final TextEditingController governorateController ;
  final TextEditingController cityController ;
  final TextEditingController streetController ;
  final TextEditingController buildingNumberController ;
  final TextEditingController apartmentNumberController;
  final TextEditingController postalController ;
  final TextEditingController addressController ;
  final TextEditingController theNewAddressController ;

  @override
  State<BuildLocationExpansion> createState() => _BuildLocationExpansionState();
}

class _BuildLocationExpansionState extends State<BuildLocationExpansion> {
  String? validateField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.locationFormKey,
      child: ExpansionTile(
        leading: Icon(
          Icons.location_on_outlined,
          color: MyColors.primary,
        ),
        title: MyText(title: "العنوان", color: MyColors.primary, size: 15.sp),
        children: [
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "الدولة"),
            controller: widget.countryController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "المحافظة"),
            controller: widget.governorateController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "المدينة"),
            controller: widget.cityController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "الشارع"),
            controller: widget.streetController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "رقم البناية"),
            controller: widget.buildingNumberController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "رقم الشقة"),
            controller: widget.apartmentNumberController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            decoration: const InputDecoration(hintText: "الصندوق البريدى"),
            controller: widget.postalController,
            onChanged: (value) {},
          ),
          TextFormField(
            validator: (value) => validateField(value),

            readOnly: true,
            decoration: const InputDecoration(
              hintText: "العنوان",
            ),
            controller: widget.addressController,
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  String? newAddress = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      String address = '';
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
                              controller: widget.addressController,
                              onChanged: (value) {
                                address = value;
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
                                  if (address.isNotEmpty) {
                                    Navigator.pop(context, address);
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

                  if (newAddress != null) {
                    setState(() {
                      widget.theNewAddressController.text = newAddress;
                    });
                  }
                },
                child: Row(
                  children: [
                    const Icon(Icons.add_circle_outline_rounded,
                        color: Colors.red),
                    const SizedBox(width: 7),
                    MyText(
                      title: "أضافة عنوان",
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
          Text("The Address is: ${widget.theNewAddressController.text}"),
        ],
      ),
    );
  }
}
