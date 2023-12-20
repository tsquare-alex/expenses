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

class MyExpansionAddImageSuccess extends MyExpansionState {
  final Uint8List pickedImage; // Change this line

  MyExpansionAddImageSuccess({required this.pickedImage}); // Change this line
}

class MyExpansionAddImageLoading extends MyExpansionState {}
class MyExpansionAddImageError extends MyExpansionState {
  final String errorMessage;

  MyExpansionAddImageError({required this.errorMessage});
}
class MyExpansionImageUpdated extends MyExpansionState {
  final Uint8List imageBytes;

  MyExpansionImageUpdated({required this.imageBytes});
}
