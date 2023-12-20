import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general/constants/MyColors.dart';
import '../../../../general/models/data_base_model/data_base_model.dart';
import '../../../../general/widgets/MyText.dart';

class DatabaseDetails extends StatefulWidget {
  const DatabaseDetails({Key? key, required this.databaseData,}) : super(key: key);

  final DatabaseModel databaseData;

  @override
  _DatabaseDetailsState createState() => _DatabaseDetailsState();
}

class _DatabaseDetailsState extends State<DatabaseDetails> {
  late TextEditingController companyNameController;
  late String editedCompanyName;

  @override
  void initState() {
    super.initState();
    companyNameController = TextEditingController(text: widget.databaseData.company);
    editedCompanyName = widget.databaseData.company;
  }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 25),
          CircleAvatar(
            radius: 35.0,
            child: Image.asset(
              "assets/images/user.png",
              fit: BoxFit.cover,
            ),
          ),
          MyText(title: "تحرير", color: MyColors.primary, size: 15.sp, alien: TextAlign.center),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                buildEditCard("النوع", widget.databaseData.category),
                buildEditCard("الاسم", widget.databaseData.firstName),
                buildEditCard("الهاتف", widget.databaseData.phoneNumber),
                buildEditCard("العنوان", widget.databaseData.city),
                buildEditCard("البريد الإلكتروني", widget.databaseData.emailAddress),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEditCard(String fieldName, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(title: value, color: MyColors.primary, size: 15.sp),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _showEditDialog(context, fieldName, value),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showEditDialog(BuildContext context, String fieldName, String initialValue) async {
    companyNameController.text = initialValue;
    editedCompanyName = initialValue;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("تعديل $fieldName"),
          content: TextField(
            controller: companyNameController,
            decoration: InputDecoration(
              labelText: "$fieldName",
            ),
            onChanged: (value) {
              setState(() {
                editedCompanyName = value;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("إلغاء"),
            ),
            ElevatedButton(
              onPressed: () {
                // setState(() {
                //   if (fieldName == "النوع") {
                //     widget.databaseData.company = editedCompanyName;
                //   } else if (fieldName == "الاسم") {
                //     widget.databaseData.firstName = editedCompanyName;
                //   } else if (fieldName == "الهاتف") {
                //     widget.databaseData.phoneNumber = editedCompanyName;
                //   } else if (fieldName == "العنوان") {
                //     widget.databaseData.city = editedCompanyName;
                //   } else if (fieldName == "البريد الإلكتروني") {
                //     widget.databaseData.emailAddress = editedCompanyName;
                //   }
                // });
                // Navigator.pop(context, widget.databaseData);
              },
              child: Text("حفظ"),
              style: ElevatedButton.styleFrom(
                primary: MyColors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}