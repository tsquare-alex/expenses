import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../general/themes/app_colors.dart';
import '../../../../../general/themes/cubit/app_theme_cubit.dart';
import 'percentage_cubit.dart';

class PercentageCalculatorScreen extends StatefulWidget {
  @override
  _PercentageCalculatorScreenState createState() => _PercentageCalculatorScreenState();
}

class _PercentageCalculatorScreenState extends State<PercentageCalculatorScreen> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController percentageController = TextEditingController();
  late FocusNode percentageFocusNode;

  @override
  void initState() {
    super.initState();
    percentageFocusNode = FocusNode();
  }

  @override
  void dispose() {
    percentageFocusNode.dispose();
    numberController.dispose();
    percentageController.dispose();
    super.dispose();
  }

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
            ? AppDarkColors.backgroundColor:MyColors.white,
        centerTitle: true,
        title: MyText(title: tr(context, "percentage"), color:context.watch<AppThemeCubit>().isDarkMode
            ? MyColors.white
            :MyColors.black,
          size: 18.sp,fontWeight: FontWeight.bold,),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<PercentageCubit, double>(
          builder: (context, result) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: tr(context, "enterNumber")),
                  ),
                  Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {
                        percentageFocusNode.hasFocus;
                      });
                    },
                    child: TextField(
                      controller: percentageController,
                      keyboardType: TextInputType.number,
                      focusNode: percentageFocusNode,
                      decoration: InputDecoration(
                        labelText: tr(context, "enterPercentage"),
                        suffixText: percentageFocusNode.hasFocus ? '%' : '',
                      ),
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
                      context.read<PercentageCubit>().calculatePercentage(
                        number: double.tryParse(numberController.text) ?? 0.0,
                        percentage: double.tryParse(percentageController.text) ?? 0.0,
                      );
                    },
                  ),
                  if (result > 0.0)
                    // const SizedBox(height: 50,),

                  Center(
                    child: MyText(title: '${tr(context, "result")}: ${result.toStringAsFixed(2)}', color:context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        :MyColors.black,size: 18.sp),
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
