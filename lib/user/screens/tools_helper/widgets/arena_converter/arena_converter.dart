import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubit/arena_converter_cubit.dart';

class AreaConverter extends StatelessWidget {
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Area Converter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Hero(
            tag: 'area_converter_hero',
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: inputController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Enter Area'),
                ),
                SizedBox(height: 16.0),
                BlocBuilder<AreaConverterCubit, AreaConverterState>(
                  builder: (context, state) {
                    String selectedConversion = 'sqMeterToSqKm';
                    if (state is ConvertedAreaConverterState) {
                      selectedConversion = state.selectedConversion;
                    } else if (state is ToggledDropdownConverterState) {
                      selectedConversion = state.selectedConversion;
                    }

                    return DropdownButton<String>(
                      value: selectedConversion,
                      onChanged: (value) {
                        context.read<AreaConverterCubit>().updateSelectedConversion(value!);
                      },
                      items: [
                        DropdownMenuItem(
                          value: 'sqMeterToSqKm',
                          child: MyText(title: tr(context, "convertSquareMToKiloM"),color: MyColors.primary,fontWeight: FontWeight.bold,size: 15.sp,),
                        ),
                        DropdownMenuItem(
                          value: 'sqMeterToSqMile',
                          child: MyText(title: tr(context, "convertSquareMToMile"),color: MyColors.primary,fontWeight: FontWeight.bold,size: 15.sp,),
                        ),
                        DropdownMenuItem(
                          value: 'sqMeterToHectare',
                          child: MyText(title: tr(context, "convertSquareMToHectare"),color: MyColors.primary,fontWeight: FontWeight.bold,size: 15.sp,),
                        ),
                        DropdownMenuItem(
                          value: 'sqMeterToCubicMeter',
                          child: MyText(title: tr(context, "convertSquareMToMCubic"),color: MyColors.primary,fontWeight: FontWeight.bold,size: 15.sp,),
                        ),
                        DropdownMenuItem(
                          value: 'sqMeterToSqCentimeter',
                          child: MyText(title: tr(context, "convertSquareMToSquareCM"),color: MyColors.primary,fontWeight: FontWeight.bold,size: 15.sp,),
                        ),
                        DropdownMenuItem(
                          value: 'sqMeterToSqMillimeter',
                          child: MyText(title: tr(context, "convertSquareMToSquareMill"),color: MyColors.primary,fontWeight: FontWeight.bold,size: 15.sp,),
                        ),
                        DropdownMenuItem(
                          value: 'sqMeterToSquare',
                          child: MyText(title: tr(context, "convertSquareMToSquareInch"),color: MyColors.primary,fontWeight: FontWeight.bold,size: 15.sp,),
                        ),
                        DropdownMenuItem(
                          value: 'sqMeterToSqDecimeter',
                          child: MyText(title: tr(context, "convertSquareMToSquareDeci"),color: MyColors.primary,fontWeight: FontWeight.bold,size: 15.sp,),
                        ),
                        // Add more conversion options as needed
                      ],
                    );
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String inputValue = inputController.text.trim();
                    if (inputValue.isNotEmpty) {
                      try {
                        double numericValue = double.parse(inputValue);
                        context.read<AreaConverterCubit>().convertArea(numericValue);
                      } catch (e) {
                        print('Invalid input: $e');
                      }
                    }
                  },
                  child: Text('Convert'),
                ),
                SizedBox(height: 16.0),
                BlocBuilder<AreaConverterCubit, AreaConverterState>(
                  builder: (context, state) {
                    if (state is ConvertedAreaConverterState) {
                      return TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Converted Area'),
                        readOnly: true,
                        controller: TextEditingController(text: state.result.toStringAsFixed(2)),
                      );
                    } else {
                      return Container(); // Placeholder or default widget for other states
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
