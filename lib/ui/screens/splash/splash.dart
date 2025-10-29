import 'package:evently/ui/utills/appassets.dart';
import 'package:evently/ui/utills/approuts.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, Approuts.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.asset(Appassets.splash));
  }
}
