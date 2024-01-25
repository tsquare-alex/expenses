import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../general/constants/MyColors.dart';
import '../../../../../general/widgets/DefaultButton.dart';
import '../../../../../general/widgets/MyText.dart';
import 'dicount_cubit.dart';
import 'discount_state.dart';

class DiscountCalculatorScreen extends StatefulWidget {
  @override
  _DiscountCalculatorScreenState createState() => _DiscountCalculatorScreenState();
}

class _DiscountCalculatorScreenState extends State<DiscountCalculatorScreen> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  late FocusNode discountFocusNode;

  @override
  void initState() {
    super.initState();
    discountFocusNode = FocusNode();
  }

  @override
  void dispose() {
    discountFocusNode.dispose();
    numberController.dispose();
    discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        centerTitle: true,
        title: MyText(title: tr(context, "discount"), color: Colors.white, size: 18.sp,fontWeight: FontWeight.bold,),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<DiscountCubit, DiscountState>(
          builder: (context, state) {
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
                        discountFocusNode.hasFocus;
                      });
                    },
                    child: TextField(
                      controller: discountController,
                      keyboardType: TextInputType.number,
                      focusNode: discountFocusNode,
                      decoration: InputDecoration(
                        labelText: tr(context, "enterPercentage"),
                        suffixText: discountFocusNode.hasFocus ? '%' : '',
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  DefaultButton(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    title:'${tr(context, "calculate")}',
                    onTap: (){
                      context.read<DiscountCubit>().calculateDiscount(
                        number: double.tryParse(numberController.text) ?? 0.0,
                        discountPercentage: double.tryParse(discountController.text) ?? 0.0,
                      );
                    },
                  ),
                  if (state.isCalculated)
                    Column(
                      children: [
                        SizedBox(height: 16.0),
                        MyText(title: '${tr(context, "discountAmount")}: ${state.discountedAmount.toStringAsFixed(2)}',color: MyColors.primary,size: 18.sp),
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
