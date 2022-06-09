// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, unrelated_type_equality_checks, camel_case_types

import 'package:card_guess/Screen/card/cardsback.dart';
import 'package:card_guess/Screen/card/suits.dart';
import 'package:card_guess/Screen/Home/scoreboard.dart';
import 'package:flutter/material.dart';
import 'dart:math';

var tmp = 0;

class flipCard extends StatefulWidget {
  const flipCard({
    Key? key,
  }) : super(key: key);

  @override
  State<flipCard> createState() => _flipCarpState();
}

class _flipCarpState extends State<flipCard> {
  bool isdesktop(BuildContext) => MediaQuery.of(context).size.width >= 200;
  bool isMobile(BuildContext) => MediaQuery.of(context).size.width < 200;

  bool isFlipped = false;
  int y = 1;
  int x = 0;
  int get imagePath => list[x].keys;
  int get imgpath => list[y].keys;
  int score = 0;
  int tries = 0;
  int chances = 5;
  List<String> guessedCards = [];

  Widget first() {
    return const Card(
      key: Key('second'),
      elevation: 5,
      child: back_card(),
    );
  }

  Widget second() {
    return Card(
        key: const Key('second'),
        elevation: 5,
        child: Front_Card(ValueKey<int>(imagePath), list[x].crdTxtPath));
  }

  Widget third() {
    return Card(
        key: const Key('second'),
        elevation: 5,
        child: Front_Card1(
            key: ValueKey<int>(imgpath), imagePath: list[y].crdTxtPath));
  }

  Widget transition(Widget widget, Animation<double> animation) {
    final flipAnimation = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: flipAnimation,
      child: widget,
      builder: (context, widget) {
        final isUnder = (const ValueKey(1) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(flipAnimation.value, pi / 2) : flipAnimation.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          child: widget,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              scores("tries: ", "$tries"),
              scores("chance", "$chances"),
              scores("scores: ", "$score"),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isdesktop(BuildContext))
                    Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        switchInCurve: Curves.ease,
                        switchOutCurve: Curves.easeIn,
                        transitionBuilder: transition,
                        child: isFlipped ? second() : first(),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return const Color.fromARGB(255, 238, 23, 23);
                              }
                              return null; // Defer to the widget's default.
                            },
                          ),
                        ),
                        child: const Text("SHUFFLE"),
                        onPressed: () async {
                          setState(() {
                            if (isFlipped = !isFlipped) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const system_update_wrong_button()));
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                      height: 250,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: third()),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered) ||
                                states.contains(MaterialState.pressed)) {
                              return const Color.fromARGB(255, 238, 216, 23);
                            }
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          if (isFlipped = !isFlipped) {
                            tries++;
                            if (list[x].number > list[y].number) {
                              score++;
                              tmp = score;

                              guessedCards.add(list[y].crdTxtPath);
                              if (tries == true) {
                                list.shuffle();
                              }
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const system_update_correct()));
                            } else {
                              chances--;

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const system_update_wrong()));
                              if (chances == 0) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const system_update_restart()));
                              }
                            }
                          }
                        });
                      },
                      child: const High(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered) ||
                                states.contains(MaterialState.pressed)) {
                              return const Color.fromARGB(255, 154, 30, 226);
                            }
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (isFlipped = !isFlipped) {
                            tries++;
                            if (list[x].number < list[y].number) {
                              score++;
                              tmp = score;

                              if (tries == true) {
                                list.shuffle();
                              }
                              guessedCards.add(list[y].crdTxtPath);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const system_update_correct()));
                            } else {
                              chances--;

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const system_update_wrong()));
                              if (chances == 0) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const system_update_restart()));
                              }
                            }
                          }
                        });
                      },
                      child: const Low(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  padding: const EdgeInsets.all(5),
                  color: Colors.red,
                  child: const Text(
                    'GUESSED CARDS LISTVIEW',
                    style: TextStyle(
                      fontFamily: 'SourceCode',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 200,
                    width: 550,
                    child: ListView.builder(
                        itemCount: guessedCards.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          int reverseIndex = guessedCards.length - 1 - index;
                          return Container(
                            height: 135,
                            width: 100,
                            margin: const EdgeInsets.all(1.5),
                            child: Center(
                              child: Image.asset(
                                guessedCards[reverseIndex],
                              ),
                            ),
                          );
                        }),
                  )
                ]),
              ),
            ],
          ),
        ]));
  }
}

class High extends StatelessWidget {
  const High({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 60,
      child: Align(
        alignment: Alignment(0.2, 0.7),
        child: SizedBox(
          height: 40,
          width: 100,
          child: Text(
            "High",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
              color: Color(0xFFCECECE),
            ),
          ),
        ),
      ),
    );
  }
}

class Low extends StatelessWidget {
  const Low({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.transparent,
      child: SizedBox(
        height: 60,
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 40,
            width: 100,
            child: Text(
              "Low",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                color: Color(0xFFCECECE),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class system_update_correct extends StatefulWidget {
  const system_update_correct({super.key});

  @override
  State<system_update_correct> createState() => _system_updateState();
}

class _system_updateState extends State<system_update_correct> {
  @override
  Widget build(BuildContext context) {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/backgroundimg/correction.png'),
                    fit: BoxFit.cover)),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "INCORRECT",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          ElevatedButton(
              child: const Text("PLAY AGAIN"),
              onPressed: () {
                list.shuffle();
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}

class system_update_wrong extends StatefulWidget {
  const system_update_wrong({super.key});

  @override
  State<system_update_wrong> createState() => _system_update__State();
}

class _system_update__State extends State<system_update_wrong> {
  @override
  Widget build(BuildContext context) {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/backgroundimg/wrong.png'),
                    fit: BoxFit.cover)),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "INCORRECT",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          ElevatedButton(
              child: const Text("PLAY AGAIN"),
              onPressed: () async {
                list.shuffle();
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}

class system_update_wrong_button extends StatefulWidget {
  const system_update_wrong_button({super.key});

  @override
  State<system_update_wrong_button> createState() => _system_update__WState();
}

class _system_update__WState extends State<system_update_wrong_button> {
  @override
  Widget build(BuildContext context) {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/backgroundimg/caution1.png'),
                    fit: BoxFit.cover)),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "INVALID BUTTON",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          ElevatedButton(
              child: const Text("PLAY AGAIN "),
              onPressed: () async {
                list.shuffle();
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}

class system_update_restart extends StatefulWidget {
  const system_update_restart({super.key});

  @override
  State<system_update_restart> createState() => _system_update_restart_State();
}

class _system_update_restart_State extends State<system_update_restart> {
  @override
  Widget build(BuildContext context) {
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/backgroundimg/wrong.png'),
                      fit: BoxFit.cover)),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "INCORRECT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "FINAL SCORE: $tmp",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 253, 30, 30),
                ),
              ),
            ),
            ElevatedButton(
                child: const Text("RESTART"),
                onPressed: () async {
                  Navigator.popUntil(context, (route) {
                    return route.settings.name == "/";
                  });
                })
          ],
        ),
      ),
    );
  }
}
