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