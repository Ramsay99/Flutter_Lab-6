// ignore_for_file:  prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:main/Favorite.dart';
import 'package:main/Cart.dart';
import 'package:main/game.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sale on Games!"),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.grey,
                Colors.white,
                Colors.pink,
              ],
            ),
          ),
          child: const Home(),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Favorite favorite = Favorite();
  Cart cart = Cart();

  Game biker = Game(
      gameName: "Bikers",
      gamePrice: 60,
      imageLocation:
          "https://images.unsplash.com/photo-1582128277384-cdda7717bd12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=475&q=80",
      salePercentage: 0.9);

  Game fortnite = Game(
      gameName: "Fortnie",
      gamePrice: 1,
      imageLocation:
          "https://images.pexels.com/photos/7133640/pexels-photo-7133640.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      salePercentage: 0.9);

  Game superMario = Game(
      gameName: "Super Mario",
      gamePrice: 10,
      imageLocation:
          "https://images.pexels.com/photos/163077/mario-yoschi-figures-funny-163077.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      salePercentage: 0.9);

  Game csgo = Game(
      gameName: "CS:GO",
      gamePrice: 100,
      imageLocation:
          "https://images.pexels.com/photos/669283/pexels-photo-669283.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      salePercentage: 0.9);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Game.allGames.length,
        itemBuilder: (context, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.all(1),
                margin: EdgeInsets.fromLTRB(14, 8, 0, 0),
                child: ElevatedButton.icon(
                  style: const ButtonStyle(),
                  onPressed: () {
                    setState(() {
                      cart.cartBtnPreesed(Game.allGames[i]);
                    });
                  },
                  icon: Icon(cart.cartIconStateChange(Game.allGames[i])),
                  label: Text(cart.getTextState()),
                ),
              ),
              ListTile(
                title: Text(
                  "${Game.allGames[i].getName() + Game.allGames[i].getAdditionsToNameTitle()}",
                  style: const TextStyle(color: Colors.purple),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      "${Game.allGames[i].getPrice()}",
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.green),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${Game.allGames[i].getPriceAfterSale()}",
                      style: const TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
                leading: Image.network("${Game.allGames[i].getImage()}"),
                trailing: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      favorite.favBtnPreesed(Game.allGames[i]);
                    });
                  },
                  child: Icon(favorite.favIconStateChange(Game.allGames[i])),
                ),
              ),
              const Divider(),
            ],
          );
        });
  }
}
