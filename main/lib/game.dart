// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:main/Cart.dart';
import 'package:main/Favorite.dart';

class Game {
  static const double NOT_DEFINED = -1;
  static const String DEFAULT_IMG =
      "https://images.pexels.com/photos/1888015/pexels-photo-1888015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  static List allGames = [];
  String _name = "Game Name";
  double _price = NOT_DEFINED;
  String _imageLocation = DEFAULT_IMG;
  double _salePercentage = 1;

  Game(
      {required String gameName,
      required double gamePrice,
      String imageLocation = DEFAULT_IMG,
      double salePercentage = 1}) {
    _name = gameName;
    _price = gamePrice;
    _imageLocation = imageLocation;
    _salePercentage = salePercentage;
    allGames.add(this);
    print("${_name.toUpperCase()} ,has been Added Successsfully!");
  }

  String getName() {
    return _name;
  }

  double getPrice() {
    return _price;
  }

  void setSalePercentage(double salePercentage) {
    _salePercentage = salePercentage;
  }

  double getPriceAfterSale() {
    return _price * _salePercentage;
  }

  String getImage() {
    return _imageLocation;
  }

  bool isAddedToFav() {
    return Favorite.favList.any((element) => element == this);
  }

  void addToFav() {
    Favorite.favList.add(this);
    print("$_name Added to Fav.");
  }

  void removeFromFav() {
    Favorite.favList.remove(this);
    print("$_name Removed from Fav.");
  }

  bool isAddedToCart() {
    return Cart.cartList.any((element) => element == this);
  }

  void addToCart() {
    Cart.cartList.add(this);
    print("$_name Added to Cart.");
  }

  void removeFromCart() {
    Cart.cartList.remove(this);
    print("$_name Removed from Cart.");
  }

  String getAdditionsToNameTitle() {
    return isAddedToFav_MsgTitle() + isAddedToCart_MsgTitle();
  }

  String isAddedToFav_MsgTitle() {
    if (isAddedToFav()) {
      return " ,Added to Fav";
    } else {
      return "";
    }
  }

  String isAddedToCart_MsgTitle() {
    if (isAddedToCart()) {
      return " ,Added to Cart";
    } else {
      return "";
    }
  }
}
