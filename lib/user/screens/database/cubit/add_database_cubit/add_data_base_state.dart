part of 'add_data_base_cubit.dart';

@immutable
abstract class AddDataBaseState {}

class AddDataBaseInitial extends AddDataBaseState {}
class AddDataBaseLoading extends AddDataBaseState {}
class AddDataBaseSuccess extends AddDataBaseState {}
class AddDataBaseFailure extends AddDataBaseState {
  final String errorMessage;

  AddDataBaseFailure({required this.errorMessage});
}
