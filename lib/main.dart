import 'package:flutter/material.dart';
import 'package:yakitim/ekranlar/anaEkran.dart';
import 'package:yakitim/ekranlar/aracEkle.dart';
import 'package:yakitim/ekranlar/aracOzellikleriEkrani/aracBilgileriEkrani.dart';
import 'package:yakitim/ekranlar/aracOzellikleriEkrani/aracOzellikleriControl.dart';
import 'package:yakitim/ekranlar/araclar.dart';
import 'package:yakitim/ekranlar/bilgilendirme.dart';
import 'package:yakitim/ekranlar/yakitAldim.dart';
import 'package:yakitim/modeller/arac.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
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
    this.ekransecim = 0;
    if (this.ekransecim == 1) {
      return AracOzellikleriControl();
    } else {
      return AnaEkran();
    }

    throw UnimplementedError();
  }
}
