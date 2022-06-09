import 'dart:ui';
import 'package:card_guess/Screen/Home/flip.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    //total size for our screen!
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/backgroundimg/bac.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: const center_Content(),
            ),
          ],
        ));
  }
}

// ignore: camel_case_types
class logo extends StatelessWidget {
  const logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 100,
        width: 400,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/backgroundimg/logo.png"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class center_Content extends StatelessWidget {
  const center_Content({super.key});

  @override
  Widget build(BuildContext context) {
    Size size2 = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const logo(),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Align(
                    alignment: const Alignment(0, 0.7),
                    child: Container(
                      height: 700,
                      width: 600,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "GUESS THE CARD",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255),
                                decoration: TextDecoration.none,
                                wordSpacing: 5,
                              ),
                            ),
                          ),
                          SizedBox(width: size2.width, child: const flipCard()),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class Flipcard extends StatefulWidget {
  final String imgpath;
  const Flipcard({required Key key, required this.imgpath}) : super(key: key);
  final int xy = 0;

  @override
  State<Flipcard> createState() => _FlipcardState();
}

class _FlipcardState extends State<Flipcard> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imgpath,
      key: ValueKey<String>(widget.imgpath),
      height: 290,
      width: 200,
      fit: BoxFit.fill,
    );
  }
}
