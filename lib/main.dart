import 'package:card_guess/Screen/Home/manual.dart';
import 'package:card_guess/Screen/card/suits.dart';
import 'package:card_guess/Screen/home.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const myApp());

  addflip();
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: myHome());
  }
}

// ignore: camel_case_types
class myHome extends StatefulWidget {
  const myHome({super.key});

  @override
  State<myHome> createState() => _myHomeState();
}

// ignore: camel_case_types
class _myHomeState extends State<myHome> {
  @override
  Widget build(BuildContext context) {
    Size size1 = MediaQuery.of(context).size;
    return Container(
      height: size1.height,
      width: size1.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/backgroundimg/bac.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 350,
            width: 900,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    scale: 5,
                    image: AssetImage("images/backgroundimg/logo.png"),
                    fit: BoxFit.cover)),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                list.shuffle();
              });
              NextScreen(context);
            },
            child: Container(
              alignment: Alignment.center,
              height: 200,
              width: 350,
              child: FittedBox(
                child: Image.asset(
                  'images/backgroundimg/Play1.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const How_To_Play()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'MANUAL',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
void NextScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const firstScreen()));
}

// ignore: camel_case_types
class firstScreen extends StatelessWidget {
  const firstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: homescreen(),
    );
  }
}
