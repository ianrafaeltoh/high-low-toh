// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:flutter/material.dart';

class How_To_Play extends StatelessWidget {
  const How_To_Play({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/backgroundimg/bac.jpg"),
            fit: BoxFit.cover),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 700,
          width: 500,
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          alignment: Alignment.center,
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(2),
                child: const Text(
                  'HOW TO PLAY',
                  style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: Colors.transparent,
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Press HIGH if hidden card is greater or equal to current card.\nPress LOW if hidden card is less than the current card.\nAce = 1, Jack = 11, Queen = 12, King = 13',
                      style: TextStyle(
                          fontFamily: 'SourceCode',
                          fontSize: 25.0,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: const Text('RETURN'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
