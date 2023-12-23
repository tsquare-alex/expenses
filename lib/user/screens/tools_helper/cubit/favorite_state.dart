part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitialState extends FavoriteState {}

class FavoriteUpdatedState extends FavoriteState {
  final List<FavoriteModel> favoriteTools;

  FavoriteUpdatedState({required this.favoriteTools});

  @override
  List<Object> get props => [favoriteTools];
}

class FavoriteExceededLimitState extends FavoriteState {}

class FavoriteErrorState extends FavoriteState {
  final String errorMessage;

  FavoriteErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
