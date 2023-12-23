import 'package:flutter_bloc/flutter_bloc.dart';

import 'length_converter_state.dart';

class LengthConverterCubit extends Cubit<LengthConverterState> {
  LengthConverterCubit() : super( InitialLengthConverterState());

  String selectedConversion = 'cmToM';

  void convertLength(double inputValue) {
    double result = 0.0;

    if (inputValue != null) {
      if (selectedConversion == 'cmToM') {
        result = inputValue / 100.0; // 1 meter = 100 centimeters
      } else if (selectedConversion == 'mToKilo') {
        result = inputValue / 1000.0; // 1 kilometer = 1000 meters
      } else if (selectedConversion == 'mToCm') {
        result = inputValue * 100.0; // 1 meter = 100 centimeters
      } else if (selectedConversion == 'cmToKilo') {
        result = inputValue / 100000.0; // 1 kilometer = 100000 centimeters
      } else if (selectedConversion == 'kiloToM') {
        result = inputValue * 1000.0; // 1 kilometer = 1000 meters
      } else if (selectedConversion == 'kiloToCm') {
        result = inputValue * 100000.0; // 1 kilometer = 100000 centimeters
      }
    }

    emit(ConvertedLengthConverterState(result, selectedConversion));
  }



  void toggleDropdown(String selectedConversion) {
    this.selectedConversion = selectedConversion;
    emit(ToggledDropdownConverterState(selectedConversion: selectedConversion));
  }


  void reset() {
    emit(InitialLengthConverterState());
  }
}

