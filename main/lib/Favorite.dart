import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main/game.dart';

class Favorite {
  static List favList = [];

  void favBtnPreesed(Game game) {
    if (isGameInFav(game)) {
      game.removeFromFav();
    } else {
      game.addToFav();
    }
  }
  
  bool isGameInFav(Game game){
    return favList.any((element) => element == game);
  }

  IconData favIconStateChange(Game game) {
    if (isGameInFav(game)) {
      return Icons.favorite;
    } else {
      return Icons.heart_broken;
    }
  }
}
