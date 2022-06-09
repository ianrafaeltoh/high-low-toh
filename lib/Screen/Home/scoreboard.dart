import 'package:flutter/material.dart';

Widget scores(String n, String score) {
  return Container(
    height: 70,
    width: 100,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
    child: Column(
      children: [
        Text(
          n,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 30,
              color: Color(0xFFFFFFFF),
              decoration: TextDecoration.none,
              wordSpacing: 5),
        ),
        Text(
          score,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 255, 255, 255),
              decoration: TextDecoration.none,
              wordSpacing: 5),
        ),
      ],
    ),
  );
}

Widget chance(String chances) {
  return Container(
    height: 50,
    width: 100,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
    child: Text(chances,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 30,
          color: Color(0xFFDED8FF),
          decoration: TextDecoration.none,
        )),
  );
}
