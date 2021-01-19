import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yakitim/ekranlar/aracOzellikleriEkrani/aracOzellikleriControl.dart';
import 'package:yakitim/hesaplamalar/hesaplamalar.dart';
import 'package:yakitim/modeller/arac.dart';

class YakitEkrani2 extends StatefulWidget {
  Arac arac;
  YakitEkrani2({this.arac});
  @override
  _YakitEkrani2State createState() => _YakitEkrani2State();
}

class _YakitEkrani2State extends State<YakitEkrani2> {
  Arac arac;

  AracOzellikleriControl _bilgiler = AracOzellikleriControl();

  @override
  Widget build(BuildContext context) {
    arac = widget.arac;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFC400), //0xFF9ad3bc
      body: Stack(
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
                            color: const Color(0xFF2C2C32),
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
          SafeArea(
            child: Column(
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
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Expanded(child: Container()),
                              Expanded(child: Container()),
                              Expanded(child: Container()),
                              _bilgiler.bilgiler(
                                  Hesaplamalar(arac: this.arac)
                                      .yuzKilometreYakitLitre()
                                      .toStringAsFixed(1),
                                  " Litre/100km"),
                              _bilgiler.bilgiler(
                                  Hesaplamalar(arac: this.arac)
                                      .kilometredeYakilanKurus()
                                      .toStringAsFixed(2),
                                  " TL/km"),
                              _bilgiler.bilgiler(
                                  Hesaplamalar(arac: arac)
                                      .litredeGidilenKm()
                                      .toStringAsFixed(2),
                                  " km/litre"),
                              _bilgiler.bilgiler(
                                  arac.besinciLitre.toStringAsFixed(1),
                                  " Litre Son Alınan Yakıt"),
                              _bilgiler.bilgiler(
                                  ((Hesaplamalar(arac: widget.arac)
                                                  .yuzKilometreOrtalama() /
                                              100) *
                                          arac.kilometre)
                                      .toStringAsFixed(1),
                                  " Litre Toplam Alınan Yakıt"),
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
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}

class YakitEkrani3 extends StatefulWidget {
  Arac arac;
  YakitEkrani3({this.arac});
  @override
  _YakitEkrani3State createState() => _YakitEkrani3State();
}

class _YakitEkrani3State extends State<YakitEkrani3> {
  AracOzellikleriControl _bilgiler = AracOzellikleriControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF2C2C32),
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
                          _bilgiler.bilgiler(
                              Hesaplamalar(arac: widget.arac)
                                  .yuzKilometreOrtalama()
                                  .toStringAsFixed(1),
                              " Litre/100km Ortalama"),
                          _bilgiler.bilgiler(
                              Hesaplamalar(arac: widget.arac)
                                  .kilometredeYakilanOrtalamaKurus()
                                  .toStringAsFixed(2),
                              " TL/km Ortalama"),
                          _bilgiler.bilgiler(
                              Hesaplamalar(arac: widget.arac)
                                  .geneldeAlinanYakit(),
                              " Litre Genelde Alınan Yakıt"),
                          _bilgiler.bilgiler(
                              Hesaplamalar(arac: widget.arac).tahminiMenzil(),
                              " Km Tahmini Menzil"),
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
