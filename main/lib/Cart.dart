import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main/game.dart';

class Cart {
  static List cartList = [];

  void cartBtnPreesed(Game game){
    if(cartList.any((element) => element == game)){
      game.removeFromCart();
    }
    else{
      game.addToCart();
    }
  }

  IconData cartIconStateChange(Game game){
    if(cartList.any((element) => element == game)){
      return Icons.remove;
    }
    else{
      return Icons.add;
    }
  }
}
