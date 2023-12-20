import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/length_converter_cubit.dart';
import 'cubit/length_converter_state.dart';

class LengthConverter extends StatefulWidget {
  @override
  _LengthConverterState createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {
  TextEditingController inputController = TextEditingController();
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: MyText(title: "تحويل الطول", color: Colors.white, size: 15.sp,fontWeight: FontWeight.bold,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter Length'),
            ),
            const SizedBox(height: 16.0),
            BlocBuilder<LengthConverterCubit, LengthConverterState>(
              builder: (context, state) {
                String selectedConversion = 'cmToM';

                if (state is ConvertedLengthConverterState) {
                  selectedConversion = state.selectedConversion;
                } else if (state is ToggledDropdownConverterState) {
                  selectedConversion = state.selectedConversion;
                }

                return DropdownButton<String>(
                  value: selectedConversion,
                  onChanged: (value) {
                    context.read<LengthConverterCubit>().toggleDropdown(value!);
                  },
                  items:  [
                    DropdownMenuItem(
                      value: 'cmToM',
                      child: MyText(title:tr(context, "convertCMtoM"),color: MyColors.primary,size: 15.sp,),
                    ),
                    DropdownMenuItem(
                      value: 'mToCm',
                      child: MyText(title:tr(context, "convertMtoCM"),color: MyColors.primary,size: 15.sp,),
                    ),
                    DropdownMenuItem(
                      value: 'mToKilo',
                      child: MyText(title:tr(context, "convertMtoKilo"),color: MyColors.primary,size: 15.sp,),
                    ),
                    DropdownMenuItem(
                      value: 'cmToKilo',
                      child: MyText(title:tr(context, "convertCMtoKilo"),color: MyColors.primary,size: 15.sp,),
                    ),
                    DropdownMenuItem(
                      value: 'kiloToM',
                      child:  MyText(title:tr(context, "convertKiloToM"),color: MyColors.primary,size: 15.sp,),
                    ),
                    DropdownMenuItem(
                      value: 'kiloToCm',
                      child: MyText(title:tr(context, "convertKiloToCM"),color: MyColors.primary,size: 15.sp,),
                    ),
                  ],

                );
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String inputValue = inputController.text.trim();
                if (inputValue.isNotEmpty) {
                  try {
                    double numericValue = double.parse(inputValue);
                    context.read<LengthConverterCubit>().convertLength(numericValue);
                  } catch (e) {
                    print('Invalid input: $e');
                  }
                }
              },
              child:  MyText(title: tr(context, "convert"),color: MyColors.primary,fontWeight: FontWeight.bold,size: 20.sp,),
            ),
            const SizedBox(height: 16.0),
            BlocBuilder<LengthConverterCubit, LengthConverterState>(
              builder: (context, state) {
                if (state is ConvertedLengthConverterState) {
                  return TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Converted Length'),
                    readOnly: true,
                    controller: TextEditingController(text: state.result.toStringAsFixed(2)),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}




