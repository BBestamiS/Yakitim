import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yakitim/database/database.dart';
import 'package:yakitim/ekranlar/anaEkran.dart';
import 'package:yakitim/ekranlar/bilgilendirme.dart';
import 'package:yakitim/hesaplamalar/hesaplamalar.dart';

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
    return FutureBuilder(
      future: DBHelper().ekranSecimi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          ekransecim = snapshot.data;
          if (this.ekransecim == 1) {
            return AnaEkran();
          } else {
            return Bilgilendirme();
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    print(DateFormat.M().format(DateTime.now()));
    throw UnimplementedError();
  }
}
