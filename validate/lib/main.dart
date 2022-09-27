import 'package:flutter/material.dart';
import 'package:validate/validation_item.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TextEditingController textController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _fabScale;

  bool eightChars = false;
  bool specialChar = false;
  bool upperCaseChar = false;
  bool number = false;

  @override
  void initState() {
    super.initState();

    textController.addListener(() {
      setState(() {
        eightChars = textController.text.length >= 8;
        number = textController.text.contains(RegExp(r'\d'), 0);
        upperCaseChar = textController.text.contains(RegExp(r'[A-Z]'), 0);
        specialChar = textController.text.isNotEmpty &&
            !textController.text.contains(RegExp(r'^[\w&.-]+$'), 0);
      });

      if (_allValid()) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _fabScale = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    _fabScale.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: "Set a password",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(32.0), child: _validationStack()),
          ],
        ),
      ),
    );
  }

  Stack _validationStack() {
    return Stack(
      children: <Widget>[
        Card(
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ValidationPasswoard("8 characters", eightChars),
                  ValidationPasswoard("1 special character", specialChar),
                  ValidationPasswoard("1 upper case", upperCaseChar),
                  ValidationPasswoard("1 number", number)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  bool _allValid() {
    return eightChars && number && specialChar && upperCaseChar;
  }
}
