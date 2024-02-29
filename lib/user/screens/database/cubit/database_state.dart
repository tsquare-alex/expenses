// database_state.dart

part of 'database_cubit.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();

  @override
  List<Object> get props => [];
}

class DatabaseInitial extends DatabaseState {}

class DatabaseLoading extends DatabaseState {}
class DatabaseSuccess extends DatabaseState {}
class DeleteDatabaseSuccess extends DatabaseState {}
class DeleteDatabaseError extends DatabaseState {
  final String errorMessage;

  DeleteDatabaseError({required this.errorMessage});
}

class DatabaseDataLoaded extends DatabaseState {
  final List<DatabaseModel> dataBaseModel;

  DatabaseDataLoaded({required this.dataBaseModel});

}

class DatabaseError extends DatabaseState {
  final String errorMessage;

  DatabaseError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class DatabaseToggle extends DatabaseState{
  final bool isExpanded;

  DatabaseToggle({required this.isExpanded});
}

class DatabaseScannedResult extends DatabaseState {
  final String scanResult;

  DatabaseScannedResult({required this.scanResult});

  @override
  List<Object> get props => [scanResult];
}
class DatabaseDataFirestoreLoaded extends DatabaseState {
  final String documentNumber;
  final String documentData;


  DatabaseDataFirestoreLoaded({
    required this.documentNumber,
    required this.documentData,

  });


}

