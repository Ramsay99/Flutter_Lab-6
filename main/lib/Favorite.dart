import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main/game.dart';

class Favorite {
  static List favList = [];

  void favBtnPreesed(Game game){
    if(favList.any((element) => element == game)){
      game.removeFromFav();
    }
    else{
      game.addToFav();
    }
  }

  IconData favIconStateChange(Game game){
    if(favList.any((element) => element == game)){
      return Icons.favorite;
    }
    else{
      return Icons.heart_broken;
    }
  }
}
