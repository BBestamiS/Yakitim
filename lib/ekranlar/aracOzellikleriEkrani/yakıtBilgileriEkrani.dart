import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yakitim/ekranlar/aracOzellikleriEkrani/aracBilgileriEkrani.dart';
import 'package:yakitim/ekranlar/aracOzellikleriEkrani/aracOzellikleriControl.dart';

class YakitEkrani2 extends StatelessWidget {
  double depoDolulukLitre = 34;
  double depoHacmi = 40;
  AracOzellikleriControl _bilgiler = AracOzellikleriControl();
  @override
  Widget build(BuildContext context) {
    depoDoluluk();
    return Scaffold(
      backgroundColor: const Color(0xFFe85d04), //0xFF9ad3bc
      body: SafeArea(
        child: Stack(
          children: [
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
                              color: const Color(0xFF9B48A6),
                              blurRadius: 7.0,
                              spreadRadius: 7.0)
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
            Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    child: Text(
                      "Yakıt Bilgisi",
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
                          child: Column(
                            children: [
                              Expanded(child: Container()),
                              Expanded(child: Container()),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text("Depo Doluluk Oranı")),
                                    Align(
                                      alignment: Alignment.center,
                                      child: FractionallySizedBox(
                                        widthFactor: this.depoDolulukGrafik,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          height: 10,
                                          margin: EdgeInsets.only(
                                              left: 20, right: 20),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(top: 5, left: 5),
                                        child: Text(
                                          "%" + this.yuzdelik.toString(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(child: Container()),
                              _bilgiler.bilgiler("6.5", " Litre/100km"),
                              _bilgiler.bilgiler("0.30", " TL/km"),
                              _bilgiler.bilgiler(
                                  "17", " Litre Son Alınan Yakıt"),
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
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }

  double yuzdelik;
  double depoDolulukGrafik;
  depoDoluluk() {
    double sayi = this.depoDolulukLitre * 100;
    this.yuzdelik = sayi / depoHacmi;
    this.depoDolulukGrafik = this.yuzdelik / 100;
  }
}

class YakitEkrani3 extends StatelessWidget {
  AracOzellikleriControl _bilgiler = AracOzellikleriControl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF9B48A6),
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
                          _bilgiler.bilgiler("7.3", " Litre/100km Ortalama"),
                          _bilgiler.bilgiler("653", " Km Tahmini Menzil"),
                          _bilgiler.bilgiler("0.37", " TL/km Ortalama"),
                          _bilgiler.bilgiler(
                              "25", " Litre Genelde Alınan Yakıt"),
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
