import 'dart:typed_data';

import 'package:expenses/general/constants/constants.dart';
import 'package:expenses/user/screens/database/cubit/database_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:expenses/user/models/database_model/database_model.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/widgets/MyText.dart';
import '../cubit/add_database_cubit/add_data_base_cubit.dart';

class DatabaseDetails extends StatefulWidget {
  const DatabaseDetails({Key? key, required this.databaseData, required this.onDataChanged}) : super(key: key);

  final DatabaseModel databaseData;
  final Function() onDataChanged; // Add this line

  @override
  _DatabaseDetailsState createState() => _DatabaseDetailsState();
}

class _DatabaseDetailsState extends State<DatabaseDetails> {
  late TextEditingController categoryController;
  late TextEditingController adjectiveController;
  late TextEditingController firstNameController;
  late TextEditingController secondNameController;
  late TextEditingController phoneController;
  late TextEditingController workPositionController;
  late TextEditingController departmentController;
  late TextEditingController companyController;
  late TextEditingController countryController;
  late TextEditingController governorateController;
  late TextEditingController cityController;
  late TextEditingController streetController;
  late TextEditingController buildingNumberController;
  late TextEditingController apartmentNumberController;
  late TextEditingController postalController;
  late TextEditingController emailController;
  late TextEditingController dateLocationController;
  late TextEditingController dateTimeController;
  late TextEditingController dateDetailsController;
  late TextEditingController commentController;
  late TextEditingController socialWebController;
  late TextEditingController facebookController;
  late TextEditingController instagramController;
  late TextEditingController youtubeController;
  late TextEditingController messengerController;
  // late TextEditingController theSocialController;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with data from AddDatabase screen
    categoryController = TextEditingController(text: widget.databaseData.category);
    adjectiveController = TextEditingController(text: widget.databaseData.adjective);
    firstNameController = TextEditingController(text: widget.databaseData.firstName);
    secondNameController = TextEditingController(text: widget.databaseData.secondName);
    phoneController = TextEditingController(text: widget.databaseData.phoneNumber);
    workPositionController = TextEditingController(text: widget.databaseData.workName);
    departmentController = TextEditingController(text: widget.databaseData.department);
    companyController = TextEditingController(text: widget.databaseData.company);
    countryController = TextEditingController(text: widget.databaseData.country);
    governorateController = TextEditingController(text: widget.databaseData.governorate);
    cityController = TextEditingController(text: widget.databaseData.city);
    streetController = TextEditingController(text: widget.databaseData.street);
    buildingNumberController = TextEditingController(text: widget.databaseData.buildingNumber);
    apartmentNumberController = TextEditingController(text: widget.databaseData.apartmentNumber);
    postalController = TextEditingController(text: widget.databaseData.postalNumber);
    emailController = TextEditingController(text: widget.databaseData.emailAddress);
    dateLocationController = TextEditingController(text: widget.databaseData.eventTitle);
    dateTimeController = TextEditingController(text: widget.databaseData.eventDate);
    dateDetailsController = TextEditingController(text: widget.databaseData.eventDetails);
    commentController = TextEditingController(text: widget.databaseData.notes);
    socialWebController = TextEditingController(text: widget.databaseData.web);
    facebookController = TextEditingController(text: widget.databaseData.facebook);
    instagramController = TextEditingController(text: widget.databaseData.instagram);
    youtubeController = TextEditingController(text: widget.databaseData.youtube);
    messengerController = TextEditingController(text: widget.databaseData.messenger);
    // theSocialController = TextEditingController(text: widget.databaseData.theSocialController);
  }
  AddDataBaseCubit dataBaseCubit = AddDataBaseCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primary,
        title: MyText(
          title: widget.databaseData.company,
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
              ElevatedButton(
                onPressed: () {
                  // Handle QR scan logic if needed
                },
                child: Text('Scan QR'),
              ),
              SizedBox(height: 20.0),
              // Display QR code result if needed
              Text("QR Code Result: --"),
              // Display Image
              BlocBuilder<AddDataBaseCubit, AddDataBaseState>(
                bloc: dataBaseCubit,
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () async {
                      // await myCubit.getImage();
                      await dataBaseCubit.getImage();
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25.0,
                          child: Image.memory(
                            widget.databaseData.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        MyText(
                          title: "أضف صورة",
                          color: MyColors.primary,
                          size: 12.sp,
                        ),
                        if(state is AddDataBaseImageSuccess)
                          Container(
                              height: 100,
                              width: 100,
                              child: Image.memory(dataBaseCubit.imageBytes!)),
                        // dataBaseCubit.imageBytes != null ? Container(
                        //     height: 100,
                        //     width: 100,
                        //     child: Image.memory(dataBaseCubit.imageBytes!)) : Container(),
                        // if (myCubit.state is MyExpansionAddImageSuccess) // Check if image is picked
                        //   Container(
                        //     width: 100, // Set the width according to your design
                        //     height: 100, // Set the height according to your design
                        //     child: Image.memory((myCubit.state as MyExpansionAddImageSuccess).pickedImage),
                        //   ),
                      ],
                    ),
                  );
                },
              ),
              // Display Edit Cards for each field
              buildTextFormField("Category", categoryController),
              buildTextFormField("Adjective", adjectiveController),
              buildTextFormField("First Name", firstNameController),
              buildTextFormField("Second Name", secondNameController),
              buildTextFormField("Phone Number", phoneController),
              buildTextFormField("Work Position", workPositionController),
              buildTextFormField("Department", departmentController),
              buildTextFormField("Company", companyController),
              buildTextFormField("Country", countryController),
              buildTextFormField("Governorate", governorateController),
              buildTextFormField("City", cityController),
              buildTextFormField("Street", streetController),
              buildTextFormField("Building Number", buildingNumberController),
              buildTextFormField("Apartment Number", apartmentNumberController),
              buildTextFormField("Postal Number", postalController),
              buildTextFormField("Email Address", emailController),
              buildTextFormField("Date Location", dateLocationController),
              buildTextFormField("Date Time", dateTimeController),
              buildTextFormField("Date Details", dateDetailsController),
              buildTextFormField("Comment", commentController),
              buildTextFormField("Social Web", socialWebController),
              buildTextFormField("Facebook", facebookController),
              buildTextFormField("Instagram", instagramController),
              buildTextFormField("Youtube", youtubeController),
              buildTextFormField("Messenger", messengerController),
              // buildTextFormField("The Social", theSocialController),

              ElevatedButton(
                onPressed: () {
                  // Save changes logic
                  saveChanges(context);
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
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageContainer() {
    return GestureDetector(
      onTap: () async {
        // Handle image selection logic if needed
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 25.0,
            child: Image.asset(
              "assets/images/user.png",
              fit: BoxFit.cover,
            ),
          ),
          MyText(
            title: "أضف صورة",
            color: MyColors.primary,
            size: 12.sp,
          ),
          // Display the selected image if available
          // Use widget.databaseData.image or any other field that contains the image data
          if (widget.databaseData.image != null)
            Container(
              height: 100,
              width: 100,
              child: Image.memory(widget.databaseData.image),
            ),
        ],
      ),
    );
  }

  Widget buildTextFormField(String fieldName, TextEditingController controller) {
    return Card(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: "$fieldName",
        ),
      ),
    );
  }
  void saveChanges(BuildContext context) async {
    // Update the data in the widget
    setState(() {
      widget.databaseData.category = categoryController.text;
      widget.databaseData.adjective = adjectiveController.text;
      widget.databaseData.firstName = firstNameController.text;
      widget.databaseData.secondName = secondNameController.text;
      widget.databaseData.phoneNumber = phoneController.text;
      widget.databaseData.workName = workPositionController.text;
      widget.databaseData.department = departmentController.text;
      widget.databaseData.company = companyController.text;
      widget.databaseData.country = countryController.text;
      widget.databaseData.governorate = governorateController.text;
      widget.databaseData.city = cityController.text;
      widget.databaseData.street = streetController.text;
      widget.databaseData.buildingNumber = buildingNumberController.text;
      widget.databaseData.apartmentNumber = apartmentNumberController.text;
      widget.databaseData.postalNumber = postalController.text;
      widget.databaseData.emailAddress = emailController.text;
      widget.databaseData.eventTitle = dateLocationController.text;
      widget.databaseData.eventDate = dateTimeController.text;
      widget.databaseData.eventDetails = dateDetailsController.text;
      widget.databaseData.notes = commentController.text;
      widget.databaseData.web = socialWebController.text;
      widget.databaseData.facebook = facebookController.text;
      widget.databaseData.instagram = instagramController.text;
      widget.databaseData.youtube = youtubeController.text;
      widget.databaseData.messenger = messengerController.text;
    });

    // Update image if it's changed
    if (dataBaseCubit.imageBytes != null) {
      widget.databaseData.image = Uint8List.fromList(dataBaseCubit.imageBytes!);
    }

    // Save changes in Hive
    var databaseDataBox = await Hive.openBox<DatabaseModel>(databaseBox);
    databaseDataBox.put(widget.databaseData.key, widget.databaseData);

    // Fetch updated data in the previous screen
    context.read<DatabaseCubit>().fetchAllDatabase(); // Use context.read directly
    // Trigger the callback to rebuild ExpandableCard
    widget.onDataChanged(); // Add this line

    // Navigate back to the previous screen
    Navigator.pop(context);
  }

//   void saveChanges() async {
//     // Update the data in the widget
//     setState(() {
//       widget.databaseData.category = categoryController.text;
//       widget.databaseData.adjective = adjectiveController.text;
//       widget.databaseData.firstName = firstNameController.text;
//       widget.databaseData.secondName = secondNameController.text;
//       widget.databaseData.phoneNumber = phoneController.text;
//       widget.databaseData.workName = workPositionController.text;
//       widget.databaseData.department = departmentController.text;
//       widget.databaseData.company = companyController.text;
//       widget.databaseData.country = countryController.text;
//       widget.databaseData.governorate = governorateController.text;
//       widget.databaseData.city = cityController.text;
//       widget.databaseData.street = streetController.text;
//       widget.databaseData.buildingNumber = buildingNumberController.text;
//       widget.databaseData.apartmentNumber = apartmentNumberController.text;
//       widget.databaseData.postalNumber = postalController.text;
//       widget.databaseData.emailAddress = emailController.text;
//       widget.databaseData.eventTitle = dateLocationController.text;
//       widget.databaseData.eventDate = dateTimeController.text;
//       widget.databaseData.eventDetails = dateDetailsController.text;
//       widget.databaseData.notes = commentController.text;
//       widget.databaseData.web = socialWebController.text;
//       widget.databaseData.facebook = facebookController.text;
//       widget.databaseData.instagram = instagramController.text;
//       widget.databaseData.youtube = youtubeController.text;
//       widget.databaseData.messenger = messengerController.text;
//       // widget.databaseData.theSocialController = theSocialController.text; // Uncomment if needed
//     });
// // Update image if it's changed
//     if (dataBaseCubit.imageBytes != null) {
//       widget.databaseData.image = Uint8List.fromList(dataBaseCubit.imageBytes!);
//     }
//     // Save changes in Hive
//     var databaseDataBox = await Hive.openBox<DatabaseModel>(databaseBox);
//     databaseDataBox.put(widget.databaseData.key, widget.databaseData);
//
//   }

}
