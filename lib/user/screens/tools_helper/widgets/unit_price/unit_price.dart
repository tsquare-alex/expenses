import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../general/themes/app_colors.dart';
import '../../../../../general/themes/cubit/app_theme_cubit.dart';
import '../../../../../general/widgets/DefaultButton.dart';

class UnitPriceScreen extends StatefulWidget {
  @override
  _UnitPriceScreenState createState() => _UnitPriceScreenState();
}

class _UnitPriceScreenState extends State<UnitPriceScreen> {
  TextEditingController quantityController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();

  double unitPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
          ),
        ),
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            :MyColors.white,

        centerTitle: true,
        title: MyText(title: tr(context, "unitPrice"),
          color:context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              :MyColors.black,
          size: 20,fontWeight: FontWeight.bold,),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: tr(context, "amount"),
              ),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              controller: totalPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: tr(context, "totalPrice"),
              ),
            ),
            SizedBox(height: 32.h),
            DefaultButton(
              color:  context.watch<AppThemeCubit>().isDarkMode
                  ? AppDarkColors.primary
                  : MyColors.primary,

              fontSize: 20,
              fontWeight: FontWeight.bold,
              title:'${tr(context, "calculate")}',
              onTap: (){
                calculateUnitPrice();
              },
            ),

            Text(
              '${tr(context, "unitPrice")}: $unitPrice جنيه',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void calculateUnitPrice() {
    try {
      double quantity = double.parse(quantityController.text);
      double totalPrice = double.parse(totalPriceController.text);

      if (quantity > 0 && totalPrice > 0) {
        double calculatedUnitPrice = totalPrice / quantity;
        setState(() {
          unitPrice = calculatedUnitPrice;
        });
      } else {
        showErrorMessage('الرجاء إدخال قيم صحيحة.');
      }
    } catch (e) {
      showErrorMessage('حدث خطأ أثناء الحساب.');
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('خطأ'),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('موافق'),
            ),
          ],
        );
      },
    );
  }
}
