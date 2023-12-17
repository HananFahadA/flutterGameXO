import 'package:game/color.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool intorn = true;
  List<String> displayxo = ["", "", "", "", "", "", "", "", ""];
  String res = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MainColor.primaryColor,
          title: Text(" Grames  "),
        ),
        backgroundColor: MainColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Expanded(
                flex: 1,
                child: Center(
                    child: Text(res,
                        style: TextStyle(color: Colors.white, fontSize: 20)))),
            Expanded(
                flex: 4,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 5, color: MainColor.primaryColor),
                            color: MainColor.secondaryColor),
                        child: Center(
                          child: Center(
                            child: Text(
                              displayxo[index],
                              style: TextStyle(
                                  fontSize: 64, color: MainColor.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      onTap: () => Tapped(index),
                    );
                  },
                )),
            TextButton(
                onPressed: () => {rest()},
                child: Text(
                  "restart ",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))
          ]),
        ),
      ),
    );
  }

  void rest() => setState(() => {
        displayxo[0] = "",
        displayxo[1] = "",
        displayxo[2] = "",
        displayxo[3] = "",
        displayxo[4] = "",
        displayxo[5] = "",
        displayxo[6] = "",
        displayxo[7] = "",
        displayxo[8] = "",
        res = ""
      });

  void Tapped(int index) {
    setState(() {
      // displayxo[index] = "";
      if (intorn && displayxo[index] == "") {
        displayxo[index] = "X";
        intorn = false;
      } else if (!intorn && displayxo[index] == "") {
        displayxo[index] = "O";
        intorn = true;
      }
      checkwener();
    });
  }

  void checkwener() {
    if (displayxo[0] == displayxo[1] &&
        displayxo[0] == displayxo[2] &&
        displayxo[0] != "") {
      setState(() {
        res = "Player " + displayxo[0] + " wins";
      });
    } else if (displayxo[3] == displayxo[4] &&
        displayxo[3] == displayxo[5] &&
        displayxo[3] != "") {
      setState(() {
        res = "Player " + displayxo[3] + " wins";
      });
    } else if (displayxo[6] == displayxo[7] &&
        displayxo[6] == displayxo[8] &&
        displayxo[6] != "") {
      setState(() {
        res = "Player " + displayxo[6] + " wins";
      });
    } else if (displayxo[0] == displayxo[4] &&
        displayxo[0] == displayxo[8] &&
        displayxo[0] != "") {
      setState(() {
        res = "Player " + displayxo[0] + " wins";
      });
    } else if (displayxo[2] == displayxo[4] &&
        displayxo[2] == displayxo[6] &&
        displayxo[2] != "") {
      setState(() {
        res = "Player " + displayxo[2] + " wins";
      });
    }
  }
}

// https://www.youtube.com/watch?v=ZWyeW6VWJC8&t=13s