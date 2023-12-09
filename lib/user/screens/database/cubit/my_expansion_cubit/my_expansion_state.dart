part of 'my_expansion_cubit.dart';

@immutable
abstract class MyExpansionState {}

class MyExpansionInitial extends MyExpansionState {}
class MyExpansionLoading extends MyExpansionState {}
class MyExpansionSuccess extends MyExpansionState {}
class MyExpansionError extends MyExpansionState {
  final String message;

  MyExpansionError({required this.message});
}
