abstract class LengthConverterState {}

class InitialLengthConverterState extends LengthConverterState {}

class ConvertedLengthConverterState extends LengthConverterState {
  final double result;
  final String selectedConversion;

  ConvertedLengthConverterState(this.result, this.selectedConversion);
}

class ToggledDropdownConverterState extends LengthConverterState {
  final String selectedConversion;

  ToggledDropdownConverterState({required this.selectedConversion});


}
