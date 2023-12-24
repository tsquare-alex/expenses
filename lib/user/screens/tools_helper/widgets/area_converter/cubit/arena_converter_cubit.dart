import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'arena_converter_state.dart';

class AreaConverterCubit extends Cubit<AreaConverterState> {
  AreaConverterCubit() : super(const InitialAreaConverterState());

  String selectedConversion = 'sqMeterToSqKm';

  void convertArea(double inputValue) {
    double result = 0.0;

    if (inputValue != null) {
      if (selectedConversion == 'sqMeterToSqKm') {
        result = inputValue / 1e6; // 1 square kilometer = 1,000,000 square meters
      } else if (selectedConversion == 'sqMeterToSqMile') {
        result = inputValue / 2.58999e6; // 1 square mile = 2,589,990.2 square meters
      } else if (selectedConversion == 'sqMeterToHectare') {
        result = inputValue / 10000; // 1 hectare = 10,000 square meters
      } else if (selectedConversion == 'sqMeterToCubicMeter') {
        // Assuming a default thickness or height of 1 meter for the conversion
        result = inputValue; // 1 square meter = 1 cubic meter with a thickness/height of 1 meter
      } else if (selectedConversion == 'sqMeterToSqCentimeter') {
        result = inputValue * 10000; // 1 square meter = 10,000 square centimeters
      } else if (selectedConversion == 'sqMeterToSqMillimeter') {
        result = inputValue * 1e6; // 1 square meter = 1,000,000 square millimeters
      } else if (selectedConversion == 'sqMeterToSquare') {
        result = inputValue * 1550.0031; // 1 square meter = 1550.0031 square inches
      } else if (selectedConversion == 'sqMeterToSqD0ecimeter') {
        result = inputValue * 100; // 1 square meter = 100 square decimeters
      }
      // Add more conversion options as needed
    }

    emit(ConvertedAreaConverterState(result, selectedConversion));
  }



  void updateSelectedConversion(String selectedConversion) {
    this.selectedConversion = selectedConversion;
    emit(ToggledDropdownConverterState(selectedConversion: selectedConversion));
  }
}

