import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

part 'my_expansion_state.dart';

class MyExpansionCubit extends Cubit<MyExpansionState> {
  MyExpansionCubit() : super(MyExpansionInitial());

  //Todo: Form key
  final GlobalKey<FormState> namesExpansionKey = GlobalKey<FormState>();
  final GlobalKey<FormState> categoryFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> namesFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> workPlaceFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> locationFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> dateFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> commentFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> socialAddressFormKey = GlobalKey<FormState>();

  final TextEditingController categoryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  //todo:For The Name's
  final TextEditingController designationController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  //todo:For The workPlace
  final TextEditingController workPositionController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController companyController = TextEditingController();

  // todo: For The Location
  final TextEditingController countryController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildingNumberController =
  TextEditingController();
  final TextEditingController apartmentNumberController =
  TextEditingController();
  final TextEditingController postalController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController theNewAddressController = TextEditingController();

  //todo:For The Date
  final TextEditingController dateLocationController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  final TextEditingController dateDetailsController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  //todo: for Comments
  final TextEditingController commentController = TextEditingController();

  //todo: for Email

  final TextEditingController emailController = TextEditingController();

  //todo: for Social Address
  final TextEditingController socialWebController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController youtubeController = TextEditingController();
  final TextEditingController messengerController = TextEditingController();
  final TextEditingController theSocialController = TextEditingController();


  bool isNameDataEmpty() {
    return
      designationController.text.isEmpty ||
          firstNameController.text.isEmpty ||
          lastNameController.text.isEmpty;
  }

  bool isCategoryDataEmpty() {
    return categoryController.text.isEmpty;
  }

  bool isPhoneNumbersDataEmpty() {
    return phoneController.text.isEmpty;
  }

  bool isWorkDataEmpty() {
    return workPositionController.text.isEmpty ||
        departmentController.text.isEmpty || companyController.text.isEmpty;
  }

  bool isAddressDataEmpty() {
    return addressController.text.isEmpty;
  }

  bool isDateDataEmpty() {
    return dateLocationController.text.isEmpty ||
        dateTimeController.text.isEmpty ||
        dateDetailsController.text.isEmpty || dateController.text.isEmpty;
  }

  bool isCommentDataEmpty() {
    return commentController.text.isEmpty;
  }

  bool isSocialAddressDataEmpty() {
    return socialWebController.text.isEmpty || facebookController.text.isEmpty
        || instagramController.text.isEmpty || youtubeController.text.isEmpty
        || messengerController.text.isEmpty || theSocialController.text.isEmpty;
  }

  void onPressedHandler() {
    String errorMessage = "";
    List<Map<Function, String>> validationMap = [
      {isCategoryDataEmpty: "التصنيف فارغ تأكد من مليه"},
      {isNameDataEmpty: "الاسماء فارغة تأكد من مليها"},
      {isPhoneNumbersDataEmpty: "رقم الهاتف فارغ تأكد من مليه"},
      {isWorkDataEmpty: "بيانات العمل فارغة تأكد من مليها"},
      {isAddressDataEmpty: "بيانات العنوان فارغة تأكد من مليها"},
      {isDateDataEmpty: "بيانات التاريخ فارغة تأكد من مليها"},
      {isCommentDataEmpty: "بيانات المحلاظات فارغة تأكد من مليها"},
      {
        isSocialAddressDataEmpty: "بيانات العناوين الاكلتورنية فارغة تأكد من مليها"
      },
    ];

    for (var validationEntry in validationMap) {
      for (var entry in validationEntry.entries) {
        if (entry.key()) {
          // If validation fails, set the error message and break out of the loop
          errorMessage = entry.value;
          break;
        }
      }
      if (errorMessage.isNotEmpty) {
        break; // Break out of the outer loop if we have an error message
      }
    }

    if (errorMessage.isEmpty) {
      emit(MyExpansionSuccess());
    } else {
      // Fluttertoast.showToast(
      //     msg: errorMessage,
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );
      emit(MyExpansionError(message: errorMessage));
    }
  }
  }


