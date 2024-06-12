import 'package:flutter/material.dart';
import 'package:movie/model/index.dart';

class CommonProvider extends ChangeNotifier {
  List<MovieModel> movies = [];
  List<int> wishListIds = [];
  int currentIdx = 0;
  bool isLoggedin = false;
  void setMovies(List<MovieModel> data) {
    movies = data;
    notifyListeners();
  }

  bool isWishMovie(MovieModel data) {
    return wishListIds.any((element) => element == data.id);
  }

  List <MovieModel> get wishMovies=> movies.where((element)=>isWishMovie(element)).toList();

  void addWishList(int id) {
    if (wishListIds.contains(id)) {
      wishListIds.remove(id);
    } else {
      wishListIds.add(id);
    }
    notifyListeners();
  }

  void changeCurrentIdx(int idx) {
    currentIdx = idx;
    notifyListeners();
  }

  void Login() {
    isLoggedin = true;
    notifyListeners();
  }

  void Logout() {
    isLoggedin = false;
    notifyListeners();
  }
}
