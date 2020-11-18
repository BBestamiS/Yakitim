import 'package:flutter/material.dart';
import 'package:yatitimveritabani2/database/database.dart';
import 'package:yatitimveritabani2/ekranlar/anaEkran.dart';
import 'package:yatitimveritabani2/ekranlar/aracEkle.dart';
import 'package:yatitimveritabani2/ekranlar/aracOzellikleriEkrani/aracBilgileriEkrani.dart';
import 'package:yatitimveritabani2/ekranlar/aracOzellikleriEkrani/aracOzellikleriControl.dart';
import 'package:yatitimveritabani2/ekranlar/araclarimEkrani.dart';
import 'package:yatitimveritabani2/ekranlar/bilgilendirme.dart';
import 'package:yatitimveritabani2/ekranlar/gelistirici.dart';
import 'package:yatitimveritabani2/ekranlar/yakitAldim.dart';
import 'package:intl/intl.dart';
import 'package:yatitimveritabani2/modeller/arac.dart';

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
    print(DateFormat.M().format(DateTime.now()));
    this.ekransecim = 0;
    if (this.ekransecim == 1) {
      return AnaEkran();
    } else {
      return Bilgilendirme();
    }

    throw UnimplementedError();
  }
}
