import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        backgroundColor: MyColors.primary,
        centerTitle: true,
        title: MyText(title: tr(context, "percentage"), color: Colors.white, size: 18.sp,fontWeight: FontWeight.bold,),
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
                    child: MyText(title: '${tr(context, "result")}: ${result.toStringAsFixed(2)}',color: MyColors.primary,size: 18.sp),
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
