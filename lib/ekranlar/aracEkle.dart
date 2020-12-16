import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yakitim/database/database.dart';
import 'package:yakitim/ekranlar/anaEkran.dart';
import 'package:yakitim/ekranlar/araclarimEkrani.dart';
import 'package:yakitim/ekranlar/ilkYakitEkrani.dart';
import 'package:yakitim/modeller/arac.dart';
import 'package:yakitim/modeller/secim.dart';

class AracEkle extends StatefulWidget {
  @override
  _AracEkle createState() => _AracEkle();
}

class _AracEkle extends State {
  Secim secim = new Secim();
  Future futureArac;
  DBHelper dbHelper;
  List<Arac> araclar = [];
  bool _validate = false;
  Arac arac = new Arac();
  int yakitTipiDeger = 1;
  int motorHacmiDeger = 1;
  final _marka = TextEditingController();
  final _model = TextEditingController();
  final _plaka = TextEditingController();
  final _depoHacmi = TextEditingController();
  final _kilometresi = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    futureArac = ffutureArac();
  }

  ffutureArac() async {
    return await DBHelper().getAraclar();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: const Color(0xFF2C2C32),
          body: FutureBuilder(
            future: futureArac,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                araclar = snapshot.data;
                return aracEklee();
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
    throw UnimplementedError();
  }

  aracEklee() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 40, right: 40),
                          child: AutoSizeText(
                            "Aracınızın Verilerini Giriniz",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontFamily: "GrotesklyYours",
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Araclar(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 15, left: 10),
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Image(
                                image:
                                    AssetImage("assets/images/backButton.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "Markası",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: "GrotesklyYours",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        child: TextField(
                          controller: _marka,
                          decoration: InputDecoration(
                            errorText: _validate ? "Bu Alan Boş Kalamaz" : null,
                            contentPadding: EdgeInsets.only(left: 8, right: 8),
                            filled: true,
                            fillColor: Colors.grey[350],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          cursorColor: Color(0xF93F32),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "Modeli",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: "GrotesklyYours",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        child: TextField(
                          controller: _model,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 8, right: 8),
                            filled: true,
                            fillColor: Colors.grey[350],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          cursorColor: Color(0xF93F32),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "Plakası",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: "GrotesklyYours",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        child: TextField(
                          controller: _plaka,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 8, right: 8),
                            filled: true,
                            fillColor: Colors.grey[350],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          cursorColor: Color(0xF93F32),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "Kilometresi",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: "GrotesklyYours",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        child: TextField(
                          controller: _kilometresi,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 8, right: 8),
                            filled: true,
                            fillColor: Colors.grey[350],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          cursorColor: Color(0xF93F32),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "Depo Hacmi",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: "GrotesklyYours",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        child: TextField(
                          controller: _depoHacmi,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 8, right: 8),
                            filled: true,
                            fillColor: Colors.grey[350],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          cursorColor: Color(0xF93F32),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 7),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Text(
                                        "Motor Hacmi",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "GrotesklyYours",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: 1000,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.grey[350],
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            value: motorHacmiDeger,
                                            items: [
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.0 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 2),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.2 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 6),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.3 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 3),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.4 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 4),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.5 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 5),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.6 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 1),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.7 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 7),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.8 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 8),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.9 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 9),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "2.0 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 10),
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                motorHacmiDeger = value;
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 7),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Text(
                                        "Yakıt Tipi",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "GrotesklyYours",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: 1000,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.grey[350],
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            value: yakitTipiDeger,
                                            items: [
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "Dizel",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 2),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "Benzin",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 1),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "LPG",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 3),
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                yakitTipiDeger = value;
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (this.araclar.isEmpty) {
                    this.arac.marka = _marka.text;
                    this.arac.model = _model.text;
                    this.arac.plaka = _plaka.text;
                    this.arac.kilometre = int.parse(_kilometresi.text);
                    this.arac.yakittipi = yakiTipiSecim(yakitTipiDeger);
                    this.arac.depohacmi = int.parse(_depoHacmi.text);
                    this.arac.motorhacmi = motorHacmiSecim(motorHacmiDeger);
                    this.arac.sonkilometre = int.parse(_kilometresi.text);
                    this.arac.toplamlira = 0;
                    this.arac.toplamlitre = 0;

                    secim.secim = 1;
                    dbHelper.aracEkle(this.arac);
                    dbHelper.secimEkle(secim);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IlkYakitEkrani(),
                      ),
                    );
                  } else {
                    this.arac.marka = _marka.text;
                    this.arac.model = _model.text;
                    this.arac.plaka = _plaka.text;
                    this.arac.kilometre = int.parse(_kilometresi.text);
                    this.arac.yakittipi = yakiTipiSecim(yakitTipiDeger);
                    this.arac.depohacmi = int.parse(_depoHacmi.text);
                    this.arac.motorhacmi = motorHacmiSecim(motorHacmiDeger);
                    this.arac.sonkilometre = int.parse(_kilometresi.text);
                    this.arac.toplamlira = 0;
                    this.arac.toplamlitre = 0;
                    dbHelper.aracEkle(this.arac);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Araclar(),
                      ),
                    );
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(25.0)),
                margin: EdgeInsets.only(
                    left: 60.0, right: 60.0, bottom: 15.0, top: 40),
                height: 40.0,
                child: Center(
                  child: Text(
                    "Aracı Ekle",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String yakiTipiSecim(int deger) {
    if (deger == 1) {
      return "benzin";
    } else if (deger == 2) {
      return "dizel";
    } else {
      return "lpg";
    }
  }

  double motorHacmiSecim(int deger) {
    if (deger == 1) {
      return 1.6;
    } else if (deger == 2) {
      return 1.0;
    } else if (deger == 3) {
      return 1.3;
    } else if (deger == 4) {
      return 1.4;
    } else if (deger == 5) {
      return 1.5;
    } else if (deger == 6) {
      return 1.2;
    } else if (deger == 7) {
      return 1.7;
    } else if (deger == 8) {
      return 1.8;
    } else if (deger == 9) {
      return 1.9;
    } else {
      return 2.0;
    }
  }
}
