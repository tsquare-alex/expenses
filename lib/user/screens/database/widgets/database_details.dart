// import 'dart:typed_data';
//
// import 'package:expenses/general/constants/constants.dart';
// import 'package:expenses/general/constants/validation.dart';
// import 'package:expenses/general/packages/localization/Localizations.dart';
// import 'package:expenses/user/screens/database/cubit/database_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:expenses/user/models/database_model/database_model.dart';
// import 'package:intl/intl.dart';
//
// import '../../../../general/constants/MyColors.dart';
// import '../../../../general/widgets/MyText.dart';
// import '../cubit/add_database_cubit/add_data_base_cubit.dart';
//
// class DatabaseDetails extends StatefulWidget {
//   const DatabaseDetails({Key? key, required this.databaseData, required this.onDataChanged}) : super(key: key);
//
//   final DatabaseModel databaseData;
//   final Function() onDataChanged; // Add this line
//
//   @override
//   _DatabaseDetailsState createState() => _DatabaseDetailsState();
// }
//
// class _DatabaseDetailsState extends State<DatabaseDetails> {
//   late TextEditingController categoryController;
//   late TextEditingController adjectiveController;
//   late TextEditingController firstNameController;
//   late TextEditingController secondNameController;
//   late TextEditingController phoneController;
//   late TextEditingController workPositionController;
//   late TextEditingController departmentController;
//   late TextEditingController companyController;
//   late TextEditingController countryController;
//   late TextEditingController governorateController;
//   late TextEditingController cityController;
//   late TextEditingController streetController;
//   late TextEditingController buildingNumberController;
//   late TextEditingController apartmentNumberController;
//   late TextEditingController postalController;
//   late TextEditingController emailController;
//   late TextEditingController dateLocationController;
//   late TextEditingController dateTimeController;
//   late TextEditingController dateDetailsController;
//   late TextEditingController commentController;
//   late TextEditingController socialWebController;
//   late TextEditingController facebookController;
//   late TextEditingController instagramController;
//   late TextEditingController youtubeController;
//   late TextEditingController messengerController;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize controllers with data from AddDatabase screen
//     // categoryController = TextEditingController(text: widget.databaseData.category);
//     // adjectiveController = TextEditingController(text: widget.databaseData.adjective);
//     // firstNameController = TextEditingController(text: widget.databaseData.firstName);
//     // secondNameController = TextEditingController(text: widget.databaseData.secondName);
//     // phoneController = TextEditingController(text: widget.databaseData.phoneNumber);
//     // workPositionController = TextEditingController(text: widget.databaseData.workName);
//     // departmentController = TextEditingController(text: widget.databaseData.department);
//     // companyController = TextEditingController(text: widget.databaseData.company);
//     // countryController = TextEditingController(text: widget.databaseData.country);
//     // governorateController = TextEditingController(text: widget.databaseData.governorate);
//     // cityController = TextEditingController(text: widget.databaseData.city);
//     // streetController = TextEditingController(text: widget.databaseData.street);
//     // buildingNumberController = TextEditingController(text: widget.databaseData.buildingNumber);
//     // apartmentNumberController = TextEditingController(text: widget.databaseData.apartmentNumber);
//     // postalController = TextEditingController(text: widget.databaseData.postalNumber);
//     // emailController = TextEditingController(text: widget.databaseData.emailAddress);
//     // dateLocationController = TextEditingController(text: widget.databaseData.eventTitle);
//     // dateTimeController = TextEditingController(text: widget.databaseData.eventDate);
//     // dateDetailsController = TextEditingController(text: widget.databaseData.eventDetails);
//     // commentController = TextEditingController(text: widget.databaseData.notes);
//     // socialWebController = TextEditingController(text: widget.databaseData.web);
//     // facebookController = TextEditingController(text: widget.databaseData.facebook);
//     // instagramController = TextEditingController(text: widget.databaseData.instagram);
//     // youtubeController = TextEditingController(text: widget.databaseData.youtube);
//     // messengerController = TextEditingController(text: widget.databaseData.messenger);
//     // theSocialController = TextEditingController(text: widget.databaseData.theSocialController);
//   }
//   AddDataBaseCubit dataBaseCubit = AddDataBaseCubit();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: MyColors.primary,
//         title: MyText(
//           title: tr(context, "databaseDetails"),
//           color: MyColors.white,
//           size: 18.sp,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle QR scan logic if needed
//                 },
//                 child: Text('Scan QR'),
//               ),
//               SizedBox(height: 20.0),
//               // Display QR code result if needed
//               Text("QR Code Result: --"),
//               // Display Image
//               BlocBuilder<AddDataBaseCubit, AddDataBaseState>(
//                 bloc: dataBaseCubit,
//                 builder: (context, state) {
//                   return GestureDetector(
//                     onTap: () async {
//                       // await myCubit.getImage();
//                       // await dataBaseCubit.getImage(context);
//                     },
//                     // child: Column(
//                     //   children: [
//                     //     widget.databaseData.image.isNotEmpty
//                     //         ? CircleAvatar(
//                     //       radius: 50.0,
//                     //       backgroundImage: MemoryImage(widget.databaseData.image),
//                     //       // child: Image.memory(widget.databaseData.image),
//                     //     )
//                     //         : CircleAvatar(
//                     //       radius: 25.0,
//                     //       child: Image.asset(
//                     //         "assets/images/user.png",
//                     //         fit: BoxFit.cover,
//                     //       ),
//                     //     ),
//                     //     MyText(
//                     //       title: "أضف صورة",
//                     //       color: MyColors.primary,
//                     //       size: 12.sp,
//                     //     ),
//                     //     if(state is AddDataBaseImageSuccess)
//                     //       Container(
//                     //           height: 100,
//                     //           width: 100,
//                     //           child: Image.memory(dataBaseCubit.imageBytes!)),
//                     //     // dataBaseCubit.imageBytes != null ? Container(
//                     //     //     height: 100,
//                     //     //     width: 100,
//                     //     //     child: Image.memory(dataBaseCubit.imageBytes!)) : Container(),
//                     //     // if (myCubit.state is MyExpansionAddImageSuccess) // Check if image is picked
//                     //     //   Container(
//                     //     //     width: 100, // Set the width according to your design
//                     //     //     height: 100, // Set the height according to your design
//                     //     //     child: Image.memory((myCubit.state as MyExpansionAddImageSuccess).pickedImage),
//                     //     //   ),
//                     //   ],
//                     // ),
//                   );
//                 },
//               ),
//               // Display Edit Cards for each field
//               buildTextFormField("category", categoryController),
//               buildTextFormField("databaseAddNamesAdjective", adjectiveController),
//               buildTextFormField("databaseAddNamesFirstName", firstNameController),
//               buildTextFormField("databaseAddNamesSecondName", secondNameController),
//               buildTextFormField("databasePhoneNumbers", phoneController),
//               buildTextFormField("databaseJobTitle", workPositionController),
//               buildTextFormField("databaseDepartment", departmentController),
//               buildTextFormField("databaseCompany", companyController),
//               buildTextFormField("databaseAddressCountry", countryController),
//               buildTextFormField("databaseAddressGovernorate", governorateController),
//               buildTextFormField("databaseAddressCity", cityController),
//               buildTextFormField("databaseAddressStreet", streetController),
//               buildTextFormField("databaseAddressBuildingNumber", buildingNumberController),
//               buildTextFormField("databaseAddressApartmentNumber", apartmentNumberController),
//               buildTextFormField("databaseAddressPostal", postalController),
//               buildTextFormField("databaseEmail", emailController),
//               buildTextFormField("databaseEventTitle", dateLocationController),
//               // buildTextFormField("Date Time", dateTimeController),
//               buildDateTimePicker("databaseEventDate", dateTimeController),
//               buildTextFormField("databaseEventDetails", dateDetailsController),
//               buildTextFormField("databaseComment", commentController),
//               buildTextFormField("databaseSocialAddressWeb", socialWebController),
//               buildTextFormField("databaseSocialAddressFacebook", facebookController),
//               buildTextFormField("databaseSocialAddressInstagram", instagramController),
//               buildTextFormField("databaseSocialAddressYoutube", youtubeController),
//               buildTextFormField("databaseSocialAddressMessenger", messengerController),
//               // buildTextFormField("The Social", theSocialController),
//
//               ElevatedButton(
//                 onPressed: () {
//                   // Save changes logic
//                   saveChanges(context);
//                 },
//                 child: MyText(
//                   title: "حفظ",
//                   color: MyColors.white,
//                   size: 16,
//                   fontWeight: FontWeight.bold,
//                   alien: TextAlign.center,
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   primary: MyColors.primary,
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Widget buildImageContainer() {
//   //   return GestureDetector(
//   //     onTap: () async {
//   //       // Handle image selection logic if needed
//   //     },
//   //     child: Column(
//   //       children: [
//   //         widget.databaseData.image.isNotEmpty
//   //             ? CircleAvatar(
//   //           radius: 25.0,
//   //           // backgroundImage: MemoryImage(widget.databaseData.image),
//   //           // child: Image.memory(widget.databaseData.image),
//   //         )
//   //             : CircleAvatar(
//   //           radius: 25.0,
//   //           child: Image.asset(
//   //             "assets/images/user.png",
//   //             fit: BoxFit.cover,
//   //           ),
//   //         ),
//   //         MyText(
//   //           title: "أضف صورة",
//   //           color: MyColors.primary,
//   //           size: 12.sp,
//   //         ),
//   //         // Display the selected image if available
//   //         // Use widget.databaseData.image or any other field that contains the image data
//   //         if (widget.databaseData.image != null)
//   //           Container(
//   //             height: 100,
//   //             width: 100,
//   //             child: Image.memory(widget.databaseData.image),
//   //           ),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//   Widget buildTextFormField(String fieldName, TextEditingController controller) {
//     return Card(
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           // labelText: "$fieldName",
//           labelText: tr(context, "$fieldName"),
//         ),
//       ),
//     );
//   }
//   void saveChanges(BuildContext context) async {
//     // Update the data in the widget
//     // setState(() {
//     //   widget.databaseData.category = categoryController.text;
//     //   widget.databaseData.adjective = adjectiveController.text;
//     //   widget.databaseData.firstName = firstNameController.text;
//     //   widget.databaseData.secondName = secondNameController.text;
//     //   widget.databaseData.phoneNumber = phoneController.text;
//     //   widget.databaseData.workName = workPositionController.text;
//     //   widget.databaseData.department = departmentController.text;
//     //   widget.databaseData.company = companyController.text;
//     //   widget.databaseData.country = countryController.text;
//     //   widget.databaseData.governorate = governorateController.text;
//     //   widget.databaseData.city = cityController.text;
//     //   widget.databaseData.street = streetController.text;
//     //   widget.databaseData.buildingNumber = buildingNumberController.text;
//     //   widget.databaseData.apartmentNumber = apartmentNumberController.text;
//     //   widget.databaseData.postalNumber = postalController.text;
//     //   widget.databaseData.emailAddress = emailController.text;
//     //   widget.databaseData.eventTitle = dateLocationController.text;
//     //   widget.databaseData.eventDate = dateTimeController.text;
//     //   widget.databaseData.eventDetails = dateDetailsController.text;
//     //   widget.databaseData.notes = commentController.text;
//     //   widget.databaseData.web = socialWebController.text;
//     //   widget.databaseData.facebook = facebookController.text;
//     //   widget.databaseData.instagram = instagramController.text;
//     //   widget.databaseData.youtube = youtubeController.text;
//     //   widget.databaseData.messenger = messengerController.text;
//     // });
//
//     // Update image if it's changed
//     if (dataBaseCubit.imageBytes != null) {
//       widget.databaseData.image = Uint8List.fromList(dataBaseCubit.imageBytes!);
//     }
//
//     // Save changes in Hive
//     var databaseDataBox = await Hive.openBox<DatabaseModel>(database);
//     databaseDataBox.put(widget.databaseData.key, widget.databaseData);
//
//     // Fetch updated data in the previous screen
//     context.read<DatabaseCubit>().fetchAllDatabase(); // Use context.read directly
//     // Trigger the callback to rebuild ExpandableCard
//     widget.onDataChanged(); // Add this line
//
//     // Navigate back to the previous screen
//     Navigator.pop(context);
//   }
//
//
//
//   Widget buildDateTimePicker(String fieldName, TextEditingController controller) {
//     return Card(
//       child: GestureDetector(
//         onTap: () async {
//           DateTime? pickedDate = await showDatePicker(
//             context: context,
//             initialDate: DateTime.now(),
//             firstDate: DateTime(2000),
//             lastDate: DateTime(2101),
//           );
//
//           if (pickedDate != null) {
//             TimeOfDay? pickedTime = await showTimePicker(
//               context: context,
//               initialTime: TimeOfDay.now(),
//             );
//
//             if (pickedTime != null) {
//               DateTime pickedDateTime = DateTime(
//                 pickedDate.year,
//                 pickedDate.month,
//                 pickedDate.day,
//                 pickedTime.hour,
//                 pickedTime.minute,
//               );
//
//               String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(pickedDateTime);
//
//               setState(() {
//                 controller.text = formattedDateTime;
//               });
//             }
//           }
//         },
//         child: AbsorbPointer(
//           child: TextFormField(
//             validator: (value) => validateField(value),
//             readOnly: true,
//             decoration: InputDecoration(
//               labelText: tr(context, "$fieldName"),
//             ),
//             controller: controller,
//             onChanged: (value) {},
//           ),
//         ),
//       ),
//     );
//   }
//
// }
// import 'dart:typed_data';
//
// import 'package:expenses/general/constants/constants.dart';
// import 'package:expenses/general/constants/validation.dart';
// import 'package:expenses/general/packages/localization/Localizations.dart';
// import 'package:expenses/user/screens/database/cubit/database_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:expenses/user/models/database_model/database_model.dart';
// import 'package:intl/intl.dart';
//
// import '../../../../general/constants/MyColors.dart';
// import '../../../../general/widgets/MyText.dart';
// import '../cubit/add_database_cubit/add_data_base_cubit.dart';
//
// class DatabaseDetails extends StatefulWidget {
//   const DatabaseDetails({Key? key, required this.databaseData, required this.onDataChanged}) : super(key: key);
//
//   final DatabaseModel databaseData;
//   final Function() onDataChanged; // Add this line
//
//   @override
//   _DatabaseDetailsState createState() => _DatabaseDetailsState();
// }
//
// class _DatabaseDetailsState extends State<DatabaseDetails> {
//   late TextEditingController categoryController;
//   late TextEditingController nameController;
//   late TextEditingController phoneController;
//   late TextEditingController addressController;
//   late TextEditingController socialAddressController;
//   late TextEditingController noteController;
//   late TextEditingController emailController;
//   late TextEditingController dateController;
//   late TextEditingController jobController;
//
//   AddDataBaseCubit dataBaseCubit = AddDataBaseCubit();
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize controllers with data from DatabaseModel
//     categoryController = TextEditingController(text: widget.databaseData.category);
//     nameController = TextEditingController(text: widget.databaseData.name);
//     phoneController = TextEditingController(text: widget.databaseData.phone);
//     addressController = TextEditingController(text: widget.databaseData.address);
//     socialAddressController = TextEditingController(text: widget.databaseData.socialAddress);
//     noteController = TextEditingController(text: widget.databaseData.note);
//     emailController = TextEditingController(text: widget.databaseData.emailAddress);
//     dateController = TextEditingController(text: widget.databaseData.date);
//     jobController = TextEditingController(text: widget.databaseData.job);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: MyColors.primary,
//         title: MyText(
//           title: tr(context, "databaseDetails"),
//           color: MyColors.white,
//           size: 18.sp,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // ... Other widgets ...
//
//               // Display Edit Cards for each field
//               buildTextFormField("category", categoryController),
//               buildTextFormField("name", nameController),
//               buildTextFormField("phone", phoneController),
//               buildTextFormField("address", addressController),
//               buildTextFormField("socialAddress", socialAddressController),
//               buildTextFormField("note", noteController),
//               buildTextFormField("emailAddress", emailController),
//               buildTextFormField("date", dateController),
//               buildTextFormField("job", jobController),
//
//               // ... Other widgets ...
//
//               ElevatedButton(
//                 onPressed: () {
//                   // Save changes logic
//                   saveChanges(context);
//                 },
//                 child: MyText(
//                   title: "حفظ",
//                   color: MyColors.white,
//                   size: 16,
//                   fontWeight: FontWeight.bold,
//                   alien: TextAlign.center,
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   primary: MyColors.primary,
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void saveChanges(BuildContext context) async {
//     // Update the data in the widget
//     widget.databaseData.category = categoryController.text;
//     widget.databaseData.name = nameController.text;
//     widget.databaseData.phone = phoneController.text;
//     widget.databaseData.address = addressController.text;
//     widget.databaseData.socialAddress = socialAddressController.text;
//     widget.databaseData.note = noteController.text;
//     widget.databaseData.emailAddress = emailController.text;
//     widget.databaseData.date = dateController.text;
//     widget.databaseData.job = jobController.text;
//
//     // Update image if it's changed
//     if (dataBaseCubit.imageBytes != null) {
//       widget.databaseData.image = Uint8List.fromList(dataBaseCubit.imageBytes!);
//     }
//
//     // Save changes in Hive
//     var databaseDataBox = await Hive.openBox<DatabaseModel>(database);
//     databaseDataBox.put(widget.databaseData.key, widget.databaseData);
//
//     // Fetch updated data in the previous screen
//     context.read<DatabaseCubit>().fetchAllDatabase(); // Use context.read directly
//     // Trigger the callback to rebuild ExpandableCard
//     widget.onDataChanged(); // Add this line
//
//     // Navigate back to the previous screen
//     Navigator.pop(context);
//   }
//
//   Widget buildTextFormField(String fieldName, TextEditingController controller) {
//     return Card(
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: tr(context, "$fieldName"),
//         ),
//       ),
//     );
//   }
// }
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/constants.dart';
import 'package:expenses/general/constants/validation.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/user/screens/database/cubit/database_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:intl/intl.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/themes/cubit/app_theme_cubit.dart';
import '../../../../general/widgets/MyText.dart';
import '../cubit/add_database_cubit/add_data_base_cubit.dart';
import 'build_category_expansion.dart';

class DatabaseDetails extends StatefulWidget {
  const DatabaseDetails({Key? key, required this.databaseData, required this.onDataChanged}) : super(key: key);

  final DatabaseModel databaseData;
  final Function() onDataChanged; // Add this line

  @override
  _DatabaseDetailsState createState() => _DatabaseDetailsState();
}

class _DatabaseDetailsState extends State<DatabaseDetails> {
  late TextEditingController categoryController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController socialAddressController;
  late TextEditingController noteController;
  late TextEditingController emailController;
  late TextEditingController dateController;
  late TextEditingController jobController;
  late TextEditingController facebookController;
  late TextEditingController whatsappController;
  late TextEditingController instagramController;
  late TextEditingController twitterController;
  late TextEditingController youtubeController;

  AddDataBaseCubit dataBaseCubit = AddDataBaseCubit();
  Future<void> deleteItem(BuildContext context) async {
    try {
      await context.read<DatabaseCubit>().deleteDatabaseItem(widget.databaseData);

      Navigator.pop(context);
    } catch (e) {
      print("Error deleting item: $e");
      // Handle the error as needed
    }
  }

  Future<void> _showImageSourceDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose an image source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text("Camera"),
                  onTap: () {
                    Navigator.of(context).pop();
                    dataBaseCubit.getImageFromCamera();
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: const Text("Gallery"),
                  onTap: () {
                    Navigator.of(context).pop();
                    dataBaseCubit.getImageFromGallery();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  void initState() {
    super.initState();

    // Initialize controllers with data from DatabaseModel
    categoryController = TextEditingController(text: widget.databaseData.category);
    nameController = TextEditingController(text: widget.databaseData.name);
    phoneController = TextEditingController(text: widget.databaseData.phone);
    addressController = TextEditingController(text: widget.databaseData.address);
    socialAddressController = TextEditingController(text: widget.databaseData.socialAddress);
    noteController = TextEditingController(text: widget.databaseData.note);
    emailController = TextEditingController(text: widget.databaseData.emailAddress);
    dateController = TextEditingController(text: widget.databaseData.date);
    jobController = TextEditingController(text: widget.databaseData.job);
    facebookController = TextEditingController(text: widget.databaseData.facebook);
    whatsappController = TextEditingController(text: widget.databaseData.whatsapp);
    instagramController = TextEditingController(text: widget.databaseData.instagram);
    twitterController = TextEditingController(text: widget.databaseData.twitter);
    youtubeController = TextEditingController(text: widget.databaseData.youtube);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primary,
        title: MyText(
          title: tr(context, "databaseDetails"),
          color: MyColors.white,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
                BuildCategoryExpansion(
                  categoryFormKey: dataBaseCubit.categoryFormKey,
                  categoryController: categoryController,
                ),
              if (widget.databaseData.category!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${tr(context, "category")}: ${widget.databaseData.category}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              buildTextFormField("name", nameController),
              buildTextFormField("phone", phoneController),
              buildTextFormField("address", addressController),
              buildTextFormField("databaseSocialAddress", socialAddressController),
              buildTextFormField("note", noteController),
              buildTextFormField("databaseEmail", emailController),
              buildCalendarPicker("date", dateController, context),
              buildTextFormField("databaseJob", jobController),
              buildTextFormField("databaseSocialAddressFacebook", facebookController),
              buildTextFormField("databaseSocialAddressWhatsapp", whatsappController),
              buildTextFormField("databaseSocialAddressInstagram", instagramController),
              buildTextFormField("databaseSocialAddressTwitter", twitterController),
              buildTextFormField("databaseSocialAddressYoutube", youtubeController),
              const SizedBox(height: 20),
            DefaultButton(title: tr(context, "addImage",),
            fontSize: 20.sp,
            onTap: ()async{
              await _showImageSourceDialog();
            },
            ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      saveChanges(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.primary,
                    ),
                    child: MyText(
                      title: "حفظ",
                      color: MyColors.white,
                      size: 16,
                      fontWeight: FontWeight.bold,
                      alien: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await  deleteItem(context);
                      BlocProvider.of<DatabaseCubit>(context)
                          .fetchAllDatabase();
                      AutoRouter.of(context).pop();

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: MyText(
                      title: tr(context, "deleteData"),
                      color: MyColors.white,
                      size: 16,
                      fontWeight: FontWeight.bold,
                      alien: TextAlign.center,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16.0),

            ],
          ),
        ),
      ),
    );
  }
  void saveChanges(BuildContext context) async {
    widget.databaseData.category = categoryController.text;
    widget.databaseData.name = nameController.text;
    widget.databaseData.phone = phoneController.text;
    widget.databaseData.address = addressController.text;
    widget.databaseData.socialAddress = socialAddressController.text;
    widget.databaseData.note = noteController.text;
    widget.databaseData.emailAddress = emailController.text;
    widget.databaseData.date = dateController.text;
    widget.databaseData.job = jobController.text;
    widget.databaseData.facebook = facebookController.text;
    widget.databaseData.whatsapp = whatsappController.text;
    widget.databaseData.instagram = instagramController.text;
    widget.databaseData.twitter = twitterController.text;
    widget.databaseData.youtube = youtubeController.text;

    // Update image if it's changed
    if (dataBaseCubit.imageBytes != null) {
      widget.databaseData.image = Uint8List.fromList(dataBaseCubit.imageBytes!);
    }

    // Save changes in Hive
    var databaseDataBox = await Hive.openBox<DatabaseModel>(database);
    databaseDataBox.put(widget.databaseData.key, widget.databaseData);


    widget.onDataChanged();

    Navigator.pop(context);
  }
  Widget buildCalendarPicker(String fieldName, TextEditingController controller, BuildContext context) {
    return Card(
      surfaceTintColor: Colors.transparent,
      child: GestureDetector(
        onTap: () async {
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            helpText: tr(context, "Select date"),
            errorFormatText: tr(context, "Invalid date format"),
            errorInvalidText: tr(context, "Invalid date"),
            fieldLabelText: tr(context, "Enter date"),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: ColorScheme.light(
                    primary: MyColors.primary,
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      primary: MyColors.primary,
                    ),
                  ),
                ),
                child: child!,
              );
            },
          );
          if (pickedDate != null) {
            setState(() {
              String formattedDate = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
              controller.text = formattedDate;
            });
          }
        },
        child: AbsorbPointer(
          child: GenericTextField(
            controller: controller,
            label:  tr(context, "$fieldName"),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
            hintColor: context
                .watch<AppThemeCubit>()
                .isDarkMode
                ? MyColors.white
                : MyColors.black,
            action: TextInputAction.none,
            validate: (String? value) => validateField(value),
          ),
        ),
      ),
    );
  }


  Widget buildTextFormField(String fieldName, TextEditingController controller) {
    return Card(
      surfaceTintColor: Colors.transparent,
      child: GenericTextField(
        controller: controller,
       label:  tr(context, "$fieldName"),
        fieldTypes: FieldTypes.normal,
        textColor: context
            .watch<AppThemeCubit>()
            .isDarkMode
            ? MyColors.white
            : MyColors.black,
        hintColor: context
            .watch<AppThemeCubit>()
            .isDarkMode
            ? MyColors.white
            : MyColors.black,
        type: TextInputType.text,
        action: TextInputAction.none,
        validate: (String? value) => validateField(value),
      ),
    );
  }
}
