part of 'arena_converter_cubit.dart';

@immutable
abstract class AreaConverterState extends Equatable {
  const AreaConverterState();

  @override
  List<Object?> get props => [];
}

class InitialAreaConverterState extends AreaConverterState {
  const InitialAreaConverterState();
}

class ConvertedAreaConverterState extends AreaConverterState {
  final double result;
  final String selectedConversion;

  const ConvertedAreaConverterState(this.result, this.selectedConversion);

  @override
  List<Object?> get props => [result, selectedConversion];
}
class ToggledDropdownConverterState extends AreaConverterState {
  final String selectedConversion;

  ToggledDropdownConverterState({required this.selectedConversion});


}