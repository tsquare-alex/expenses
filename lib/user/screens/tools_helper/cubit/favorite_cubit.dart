import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expenses/user/models/favorite_model/favorite_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../general/constants/constants.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitialState());
  List<FavoriteModel> _favoriteModels = [];

  void toggleFavoriteStatus(String toolName, String imagePath) async {
    try {
      await Hive.openBox<FavoriteModel>(favoriteTools);
      var favoriteBox = Hive.box<FavoriteModel>(favoriteTools);

      if (isFavorite(toolName)) {
        favoriteBox.delete(toolName);
      } else {
        if (favoriteBox.length < 4) {
          favoriteBox.put(toolName, FavoriteModel(toolName: toolName, imagePath: imagePath));
        } else {
          emit(FavoriteExceededLimitState());
          return;
        }
      }

      List<FavoriteModel> updatedFavorites = favoriteBox.values.toList();
      emit(FavoriteUpdatedState(favoriteTools: updatedFavorites));
    } catch (e) {
      emit(FavoriteErrorState(errorMessage: e.toString()));
    }
  }


  // void toggleFavoriteStatus(String toolName) async {
  //   try {
  //     await Hive.openBox<FavoriteModel>(favoriteTools);
  //     var favoriteBox = Hive.box<FavoriteModel>(favoriteTools);
  //     if (favoriteBox.containsKey(toolName)) {
  //       favoriteBox.delete(toolName);
  //     } else {
  //       if (favoriteBox.length < 4) {
  //         favoriteBox.put(toolName, FavoriteModel(toolName: toolName));
  //       } else {
  //         emit(FavoriteExceededLimitState());
  //         return;
  //       }
  //     }
  //     List<FavoriteModel> updatedFavorites = favoriteBox.values.toList();
  //     emit(FavoriteUpdatedState(favoriteTools: updatedFavorites));
  //   } catch (e) {
  //     emit(FavoriteErrorState(errorMessage: e.toString()));
  //   }
  // }

  bool isFavorite(String toolName) {
    var favoriteBox = Hive.box<FavoriteModel>(favoriteTools);
    return favoriteBox.containsKey(toolName);
  }

  // Remove emit from here
  List<FavoriteModel> getFavoriteModels() {
    try {
      var favoriteBox = Hive.box<FavoriteModel>(favoriteTools);
      List<FavoriteModel> updatedFavorites = favoriteBox.values.toList();
      emit(FavoriteUpdatedState(favoriteTools: updatedFavorites)); // Emit here when necessary
      return updatedFavorites;
    } catch (e) {
      emit(FavoriteErrorState(errorMessage: e.toString()));
      return [];
    }
  }
}

