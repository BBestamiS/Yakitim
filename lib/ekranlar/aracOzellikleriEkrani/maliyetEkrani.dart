import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:yakitim/ekranlar/aracOzellikleriEkrani/aracOzellikleriControl.dart';

class MaliyetEkrani4 extends StatelessWidget {
  double birinci = 130.5;
  double ikinci = 76.8;
  double ucuncu = 98.1;
  double dorduncu = 34;
  double besinci = 90.99;

  @override
  Widget build(BuildContext context) {
    grafik();
    return Scaffold(
      backgroundColor: const Color(0xFF9B48A6),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Stack(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        child: Text(
                          "Maliyet Bilgisi",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "GrotesklyYours",
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(30),
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 0.70,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 26.0,
                                          spreadRadius: 5.0)
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  Expanded(child: Container()),
                                  Expanded(
                                      child: Container(
                                    child: Text("Yakıta Yapılan Ödeme Grafiği"),
                                  )),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "1.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: FractionallySizedBox(
                                      widthFactor: this.birinci1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFCC5B26),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: 10,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 5, left: 5),
                                      child: Text(
                                        this.birinci.toString() + " TL",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "GrotesklyYours",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "2.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: FractionallySizedBox(
                                      widthFactor: this.ikinci2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFD0913C),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: 10,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 5, left: 5),
                                      child: Text(
                                        this.ikinci.toString() + " TL",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "GrotesklyYours",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "3.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: FractionallySizedBox(
                                      widthFactor: this.ucuncu3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFE8DB76),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: 10,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 5, left: 5),
                                      child: Text(
                                        this.ucuncu.toString() + " TL",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "GrotesklyYours",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "4.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: FractionallySizedBox(
                                      widthFactor: this.dorduncu4,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF93B45E),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: 10,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 5, left: 5),
                                      child: Text(
                                        this.dorduncu.toString() + " TL",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "GrotesklyYours",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "5.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: FractionallySizedBox(
                                      widthFactor: this.besinci5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF3B7F1A),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: 10,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 5, left: 5),
                                      child: Text(
                                        this.besinci.toString() + " TL",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "GrotesklyYours",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Expanded(child: Container()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 3,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 3,
                          margin: EdgeInsets.only(
                            left: 5,
                            right: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0xFFe85d04),
                                  blurRadius: 5.0,
                                  spreadRadius: 5.0)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 3,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 155,
                    height: 130,
                    margin: EdgeInsets.only(),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/tesla1.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

  double birinci1;
  double ikinci2;
  double ucuncu3;
  double dorduncu4;
  double besinci5;
  grafik() {
    double enbuyuk = enbuyu(
        this.birinci, this.ikinci, this.ucuncu, this.dorduncu, this.besinci);
    double sayi = enbuyuk / 100;
    this.birinci1 = this.birinci / (100 * sayi);
    this.ikinci2 = this.ikinci / (100 * sayi);
    this.ucuncu3 = this.ucuncu / (100 * sayi);
    this.dorduncu4 = this.dorduncu / (100.0 * sayi);
    this.besinci5 = this.besinci / (100 * sayi);
  }

  double enbuyu(double bir, double iki, double uc, double dort, double bes) {
    double enbuyuk = 0;
    if (bir >= iki && bir >= uc && bir >= dort && bir >= bes) {
      enbuyuk = bir;
      return enbuyuk;
    } else if (iki >= bir && iki >= uc && iki >= dort && iki >= bes) {
      enbuyuk = iki;
      return enbuyuk;
    } else if (uc >= bir && uc >= iki && uc >= dort && uc >= bes) {
      enbuyuk = uc;
      return enbuyuk;
    } else if (dort >= bir && dort >= uc && dort >= iki && dort >= bes) {
      enbuyuk = dort;
      return enbuyuk;
    } else {
      enbuyuk = bes;
      return enbuyuk;
    }
  }
}

class MaliyetEkrani5 extends StatelessWidget {
  AracOzellikleriControl _bilgiler = AracOzellikleriControl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFe85d04),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.70,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 30, right: 30, bottom: 50, top: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 26.0,
                                spreadRadius: 5.0)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Expanded(child: Container()),
                          _bilgiler.bilgiler("%3", " Zam Uygulanmış"),
                          _bilgiler.bilgiler("130.5", " Lira Son Yakıt"),
                          Container(
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    "Geçen Ay Alınan Yakıt Tutarı",
                                    style: TextStyle(
                                        fontFamily: "GrotesklyYours",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(child: Container()),
                                    Text(
                                      "255.49",
                                      style: TextStyle(
                                          fontFamily: "GrotesklyYours",
                                          fontSize: 55),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Text(
                                        "Lira",
                                        style: TextStyle(
                                            fontFamily: "GrotesklyYours",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(child: Container())
                                  ],
                                )
                              ],
                            ),
                          ),
                          _bilgiler.bilgiler("0.20", " Lira Zam Uygulanmış"),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
    throw UnimplementedError();
  }
}
