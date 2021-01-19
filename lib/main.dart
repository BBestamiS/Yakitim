import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:yakitim/database/database.dart';
import 'package:yakitim/ekranlar/anaEkran.dart';
import 'package:yakitim/ekranlar/bilgilendirme.dart';
import 'package:yakitim/ekranlar/ilkYakitEkrani.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        "assets/animations/splash.flr",
        MyHomePage(),
        startAnimation: "Yakitim",
        backgroundColor: Color(0xff2C2C32),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new EkranSecimi();
  }
}

class EkranSecimi extends StatelessWidget {
  int ekransecim;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DBHelper().ekranSecimi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          ekransecim = snapshot.data;
          if (this.ekransecim == 1) {
            return IlkYakitEkrani();
          } else if (this.ekransecim == 2) {
            return AnaEkranGecis();
          } else {
            return Bilgilendirme();
          }
        } else {
          return Container(
            color: const Color(0xFF2C2C32),
            child: Center(
              child: AspectRatio(
                aspectRatio: 1024 / 768,
                child: Container(
                  child: FlareActor(
                    "assets/animations/splash.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: "Bekleme",
                  ),
                ),
              ),
            ),
          );
        }
      },
    );

    throw UnimplementedError();
  }
}
