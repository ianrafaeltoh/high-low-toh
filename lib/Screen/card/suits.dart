import 'dart:core';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Front_Card extends StatefulWidget {
  final String imagePath;

  const Front_Card(
    Key key,
    this.imagePath,
  ) : super(key: key);

  @override
  State<Front_Card> createState() => _Front_Card();
}

// ignore: camel_case_types
class _Front_Card extends State<Front_Card> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imagePath,
      key: ValueKey<String>(widget.imagePath),
      height: 250,
      width: 170,
      fit: BoxFit.fill,
    );
  }
}

// ignore: camel_case_types
class Front_Card1 extends StatefulWidget {
  final String imagePath;

  const Front_Card1({
    required Key key,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<Front_Card1> createState() => _Front_Card1State();
}

// ignore: camel_case_types
class _Front_Card1State extends State<Front_Card1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          widget.imagePath,
          key: ValueKey<String>(widget.imagePath),
          height: 250,
          width: 170,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class deck {
  final int keys;
  final String crdTxtPath;
  final int number;

  deck(this.keys, this.crdTxtPath, this.number);
}

var card_1 = deck(1, 'assets/ace_of_spades.png', 1);
var card_2 = deck(2, 'assets/ace_of_hearts.png', 1);
var card_3 = deck(3, 'assets/ace_of_clubs.png', 1);
var card_4 = deck(4, 'assets/ace_of_diamonds.png', 1);
var card_5 = deck(5, 'assets/2_of_spades.png', 2);
var card_6 = deck(6, 'assets/2_of_hearts.png', 2);
var card_7 = deck(7, 'assets/2_of_clubs.png', 2);
var card_8 = deck(8, 'assets/2_of_diamonds.png', 2);
var card_9 = deck(9, 'assets/3_of_spades.png', 3);
var card_10 = deck(10, 'assets/3_of_hearts.png', 3);
var card_11 = deck(11, 'assets/3_of_clubs.png', 3);
var card_12 = deck(12, 'assets/3_of_diamonds.png', 3);
var card_13 = deck(13, 'assets/4_of_spades.png', 4);
var card_14 = deck(14, 'assets/4_of_hearts.png', 4);
var card_15 = deck(15, 'assets/4_of_clubs.png', 4);
var card_16 = deck(16, 'assets/4_of_diamonds.png', 4);
var card_17 = deck(17, 'assets/5_of_spades.png', 5);
var card_18 = deck(18, 'assets/5_of_hearts.png', 5);
var card_19 = deck(19, 'assets/5_of_clubs.png', 5);
var card_20 = deck(20, 'assets/5_of_diamonds.png', 5);
var card_21 = deck(21, 'assets/6_of_spades.png', 6);
var card_22 = deck(22, 'assets/6_of_hearts.png', 6);
var card_23 = deck(23, 'assets/6_of_clubs.png', 6);
var card_24 = deck(24, 'assets/6_of_diamonds.png', 6);
var card_25 = deck(25, 'assets/7_of_spades.png', 7);
var card_26 = deck(26, 'assets/7_of_hearts.png', 7);
var card_27 = deck(27, 'assets/7_of_clubs.png', 7);
var card_28 = deck(28, 'assets/7_of_diamonds.png', 7);
var card_29 = deck(29, 'assets/8_of_spades.png', 8);
var card_30 = deck(30, 'assets/8_of_hearts.png', 8);
var card_31 = deck(31, 'assets/8_of_clubs.png', 8);
var card_32 = deck(32, 'assets/8_of_diamonds.png', 8);
var card_33 = deck(33, 'assets/9_of_spades.png', 9);
var card_34 = deck(34, 'assets/9_of_hearts.png', 9);
var card_35 = deck(35, 'assets/9_of_clubs.png', 9);
var card_36 = deck(36, 'assets/9_of_diamonds.png', 9);
var card_37 = deck(37, 'assets/10_of_spades.png', 10);
var card_38 = deck(38, 'assets/10_of_hearts.png', 10);
var card_39 = deck(39, 'assets/10_of_clubs.png', 10);
var card_40 = deck(40, 'assets/10_of_diamonds.png', 10);
var card_41 = deck(41, 'assets/jack_of_spades.png', 11);
var card_42 = deck(42, 'assets/jack_of_hearts.png', 11);
var card_43 = deck(43, 'assets/jack_of_clubs.png', 11);
var card_44 = deck(44, 'assets/jack_of_diamonds.png', 11);
var card_45 = deck(45, 'assets/queen_of_spades.png', 12);
var card_46 = deck(46, 'assets/queen_of_hearts.png', 12);
var card_47 = deck(47, 'assets/queen_of_clubs.png', 12);
var card_48 = deck(48, 'assets/queen_of_diamonds.png', 12);
var card_49 = deck(49, 'assets/king_of_spades.png', 13);
var card_50 = deck(50, 'assets/king_of_hearts.png', 13);
var card_51 = deck(51, 'assets/king_of_clubs.png', 13);
var card_52 = deck(52, 'assets/king_of_spades.png', 13);

var list = <deck>[];

addflip() {
  list = [];
  list.add(card_1);
  list.add(card_2);
  list.add(card_3);
  list.add(card_4);
  list.add(card_5);
  list.add(card_6);
  list.add(card_7);
  list.add(card_8);
  list.add(card_9);
  list.add(card_10);
  list.add(card_11);
  list.add(card_12);
  list.add(card_13);
  list.add(card_14);
  list.add(card_15);
  list.add(card_16);
  list.add(card_17);
  list.add(card_18);
  list.add(card_19);
  list.add(card_20);
  list.add(card_21);
  list.add(card_22);
  list.add(card_23);
  list.add(card_24);
  list.add(card_25);
  list.add(card_26);
  list.add(card_27);
  list.add(card_28);
  list.add(card_29);
  list.add(card_30);
  list.add(card_31);
  list.add(card_32);
  list.add(card_33);
  list.add(card_34);
  list.add(card_35);
  list.add(card_36);
  list.add(card_37);
  list.add(card_38);
  list.add(card_39);
  list.add(card_40);
  list.add(card_41);
  list.add(card_42);
  list.add(card_43);
  list.add(card_44);
  list.add(card_45);
  list.add(card_46);
  list.add(card_47);
  list.add(card_48);
  list.add(card_49);
  list.add(card_50);
  list.add(card_51);
  list.add(card_52);
}
