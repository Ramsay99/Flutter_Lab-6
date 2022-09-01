import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main/game.dart';

class Cart {
  String _text = "Add to Cart";
  static List cartList = [];

  String getTextState() {
    return _text;
  }

  void cartBtnPreesed(Game game) {
    if (cartList.any((element) => element == game)) {
      game.removeFromCart();
    } else {
      game.addToCart();
    }
  }

  IconData cartIconStateChange(Game game) {
    bool isGameInCart = cartList.any((element) => element == game);
    cartTextState(isGameInCart);
    if (isGameInCart) {
      return Icons.remove;
    } else {
      return Icons.add;
    }
  }

  void cartTextState(bool isInCart) {
    if (isInCart) {
      _text = "Remove from Cart";
    } else {
      _text = "Add to Cart";
    }
  }
}
