import 'package:expenses/general/constants/validation.dart';
import 'package:expenses/user/screens/database/cubit/my_expansion_cubit/my_expansion_cubit.dart';
import 'package:expenses/user/screens/database/cubit/my_expansion_cubit/my_expansion_cubit.dart';
import 'package:expenses/user/screens/database/widgets/build_address_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_category_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_comment_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_date_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_email_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_location_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_names_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_phone_expansion.dart';
import 'package:expenses/user/screens/database/widgets/build_work_expansion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/widgets/MyText.dart';

class MyExpansionTile extends StatelessWidget {
  String? newCategory;
  MyExpansionCubit myCubit = MyExpansionCubit();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyExpansionCubit, MyExpansionState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Column(
          children: [
            BuildCategoryExpansion(
              categoryFormKey: myCubit.categoryFormKey,
              categoryController: myCubit.categoryController,
            ),
            const SizedBox(height: 16.0),
            BuildNamesExpansion(
              namesFormKey: myCubit.namesFormKey,
              designationController: myCubit.designationController,
              firstNameController: myCubit.firstNameController,
              lastNameController: myCubit.lastNameController,
            ),
            const SizedBox(height: 16.0),
            BuildPhoneExpansion(
              phoneFormKey: myCubit.phoneFormKey,
              phoneController: myCubit.phoneController,
            ),
            const SizedBox(height: 16.0),
            BuildWorkExpansion(
              workPositionController: myCubit.workPositionController,
              departmentController: myCubit.departmentController,
              companyController: myCubit.companyController,
              workPlaceFormKey: myCubit.workPlaceFormKey,
            ),
            const SizedBox(height: 16.0),
            BuildLocationExpansion(
              locationFormKey: myCubit.locationFormKey,
              countryController: myCubit.countryController,
              governorateController: myCubit.governorateController,
              cityController: myCubit.cityController,
              streetController: myCubit.streetController,
              postalController: myCubit.postalController,
              buildingNumberController: myCubit.buildingNumberController,
              apartmentNumberController: myCubit.apartmentNumberController,
              addressController: myCubit.addressController,
              theNewAddressController: myCubit.theNewAddressController,
            ),
            const SizedBox(height: 16.0),
            BuildEmailExpansion(
                emailFormKey: myCubit.emailFormKey, emailController: myCubit.emailController),
            const SizedBox(height: 16.0),
            BuildDateExpansion(dateFormKey: myCubit.dateFormKey,
                dateLocationController: myCubit.dateLocationController,
                dateTimeController: myCubit.dateTimeController,
                dateDetailsController: myCubit.dateDetailsController,
                dateController: myCubit.dateController),
            const SizedBox(height: 16.0),
            BuildCommentExpansion(commentController: myCubit.commentController,
                commentFormKey: myCubit.commentFormKey),
            const SizedBox(height: 16.0),
            BuildAddressExpansion(socialAddressFormKey: myCubit.socialAddressFormKey,
                socialWebController: myCubit.socialWebController,
                facebookController: myCubit.facebookController,
                instagramController: myCubit.instagramController,
                youtubeController: myCubit.youtubeController,
                messengerController: myCubit.messengerController,
                theSocialController: myCubit.theSocialController),
            ElevatedButton(
              onPressed: () {
                myCubit.onPressedHandler();
              },
              child: MyText(
                title: "حفظ",
                color: MyColors.white,
                size: 16,
                fontWeight: FontWeight.bold,
                alien: TextAlign.center,
              ),
              style: ElevatedButton.styleFrom(
                primary: MyColors.primary,
              ),
            ),
          ],
        );
      },
    );
  }
}


