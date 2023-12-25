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

class AddDataBaseImageSuccess extends AddDataBaseState {}

class AddDataBaseFirestoreDataSuccess extends AddDataBaseState {
  final String formattedData;

  AddDataBaseFirestoreDataSuccess({required this.formattedData});



  @override
  List<Object?> get props => [formattedData];
}

class AddDataBaseFirestoreDataFailure extends AddDataBaseState {
  final String errorMessage;

  AddDataBaseFirestoreDataFailure({required this.errorMessage});


  @override
  List<Object?> get props => [errorMessage];


}
class AddDataBaseScanResult extends AddDataBaseState {
  final String scanResult;

  AddDataBaseScanResult({required this.scanResult});
}