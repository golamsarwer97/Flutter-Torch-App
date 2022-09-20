import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:torch_light/torch_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Practice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Torch App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void torchOn() async {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  void torchOff() async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: LiteRollingSwitch(
          onTap: () {},
          onDoubleTap: () {},
          onSwipe: () {},
          onChanged: (value) {
            log(value.toString());
            if (value) {
              torchOn();
            } else {
              torchOff();
            }
          },
          colorOff: Colors.red,
          colorOn: Colors.green,
          iconOff: CupertinoIcons.lightbulb_slash,
          iconOn: CupertinoIcons.lightbulb_fill,
          textOff: 'Torch Off',
          textOn: 'Torch On',
        ),
      ),
    );
  }
}
