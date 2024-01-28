import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/user/screens/tools_helper/widgets/services_tax/services_tax_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/themes/app_colors.dart';
import '../../../../../general/themes/cubit/app_theme_cubit.dart';
import '../../../../../general/widgets/DefaultButton.dart';
import '../../../../../general/widgets/MyText.dart';

class ServiceTaxCalculatorScreen extends StatefulWidget {
  @override
  _ServiceTaxCalculatorScreenState createState() => _ServiceTaxCalculatorScreenState();
}

class _ServiceTaxCalculatorScreenState extends State<ServiceTaxCalculatorScreen> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController taxRateController = TextEditingController();
  double enteredNumber = 0.0;
  double enteredTaxRate = 0.0;

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
            :MyColors.white,        centerTitle: true,
        title: MyText(title: tr(context, "tax"),  color:context.watch<AppThemeCubit>().isDarkMode
            ? MyColors.white
            :MyColors.black, size: 18.sp,fontWeight: FontWeight.bold,),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ServiceTaxCubit, double>(
          builder: (context, serviceTax) {
            double totalAmount = enteredNumber + serviceTax;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        enteredNumber = double.tryParse(value) ?? 0.0;
                      });
                    },
                    decoration: InputDecoration(labelText: tr(context, "enterNumber")),
                  ),
                  TextField(
                    controller: taxRateController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        enteredTaxRate = double.tryParse(value) ?? 0.0;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: tr(context, "enterTax"),
                      suffixText: '%', // Display % as suffix
                      suffixStyle: TextStyle(fontSize: 16.0), // Adjust font size as needed
                    ),
                  ),
                  const SizedBox(height: 50,),
                  DefaultButton(
                    color:  context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.primary
                        : MyColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    title:'${tr(context, "calculate")}',
                    onTap: (){
                      context.read<ServiceTaxCubit>().calculateServiceTax(
                        number: enteredNumber,
                        taxRate: enteredTaxRate,
                      );
                    },
                  ),
                  if (serviceTax > 0.0)
                    Column(
                      children: [
                        SizedBox(height: 16.0),
                        MyText(title: "${tr(context, "taxAmount")}: ${serviceTax.toStringAsFixed(2)}",  color:context.watch<AppThemeCubit>().isDarkMode
                            ? MyColors.white
                            :MyColors.black, size: 20.sp,fontWeight: FontWeight.bold,),
                        MyText(title: "${tr(context, "totalAmount")}: ${totalAmount.toStringAsFixed(2)}", color:context.watch<AppThemeCubit>().isDarkMode
                            ? MyColors.white
                            :MyColors.black, size: 20.sp,fontWeight: FontWeight.bold,),

                      ],
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
