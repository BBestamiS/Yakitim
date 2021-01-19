import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yakitim/ekranlar/aracOzellikleriEkrani/aracOzellikleriControl.dart';
import 'package:yakitim/hesaplamalar/hesaplamalar.dart';
import 'package:yakitim/modeller/arac.dart';

class MaliyetEkrani4 extends StatefulWidget {
  Arac arac;
  MaliyetEkrani4({this.arac});
  @override
  _MaliyetEkrani4State createState() => _MaliyetEkrani4State();
}

class _MaliyetEkrani4State extends State<MaliyetEkrani4> {
  double birinci;

  double ikinci;

  double ucuncu;

  double dorduncu;

  double besinci;

  @override
  Widget build(BuildContext context) {
    this.birinci = Hesaplamalar(arac: widget.arac).yakit(1);
    if (widget.arac.dorduncuFiyat != null) {
      this.ikinci = Hesaplamalar(arac: widget.arac).yakit(2);
    }
    if (widget.arac.ucuncuFiyat != null) {
      this.ucuncu = Hesaplamalar(arac: widget.arac).yakit(3);
    }
    if (widget.arac.ikinciFiyat != null) {
      this.dorduncu = Hesaplamalar(arac: widget.arac).yakit(4);
    }
    if (widget.arac.birinciFiyat != null) {
      this.besinci = Hesaplamalar(arac: widget.arac).yakit(5);
    }

    grafik();
    return Scaffold(
      backgroundColor: const Color(0xFF9B48A6),
      body: Center(
        child: Container(
          child: Stack(
            children: [
              SafeArea(
                child: Column(
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
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: grafikler(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
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
                                color: const Color(0xFF2C2C32),
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
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 178,
                    height: 130,
                    margin: EdgeInsets.only(),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/porschearka.png"),
                        // image: AssetImage("assets/images/tesla1.png"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

  grafikler() {
    if (widget.arac.dorduncuFiyat == null) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("Yakıta Yapılan Ödeme Grafiği"),
            ),
          ),
          Column(
            children: [
              Expanded(child: Container()),
              birinciYakit(),
              Expanded(child: Container()),
            ],
          ),
        ],
      );
    } else if (widget.arac.ucuncuFiyat == null) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("Yakıta Yapılan Ödeme Grafiği"),
            ),
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Expanded(child: Container()),
              birinciYakit(),
              Expanded(child: Container()),
              digerYakit("2.", 2, this.ikinci2, this.ikinci),
              Expanded(child: Container()),
              Expanded(child: Container()),
            ],
          ),
        ],
      );
    } else if (widget.arac.ikinciFiyat == null) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("Yakıta Yapılan Ödeme Grafiği"),
            ),
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Expanded(child: Container()),
              birinciYakit(),
              Expanded(child: Container()),
              digerYakit("2.", 2, this.ikinci2, this.ikinci),
              Expanded(child: Container()),
              digerYakit("3.", 3, this.ucuncu3, this.ucuncu),
              Expanded(child: Container()),
              Expanded(child: Container()),
            ],
          ),
        ],
      );
    } else if (widget.arac.birinciFiyat == null) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("Yakıta Yapılan Ödeme Grafiği"),
            ),
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Expanded(child: Container()),
              birinciYakit(),
              Expanded(child: Container()),
              digerYakit("2.", 2, this.ikinci2, this.ikinci),
              Expanded(child: Container()),
              digerYakit("3.", 3, this.ucuncu3, this.ucuncu),
              Expanded(child: Container()),
              digerYakit("4.", 4, this.dorduncu4, this.dorduncu),
              Expanded(child: Container()),
              Expanded(child: Container()),
            ],
          ),
        ],
      );
    } else {
      return Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("Yakıta Yapılan Ödeme Grafiği"),
            ),
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Expanded(child: Container()),
              birinciYakit(),
              Expanded(child: Container()),
              digerYakit("2.", 2, this.ikinci2, this.ikinci),
              Expanded(child: Container()),
              digerYakit("3.", 3, this.ucuncu3, this.ucuncu),
              Expanded(child: Container()),
              digerYakit("4.", 4, this.dorduncu4, this.dorduncu),
              Expanded(child: Container()),
              digerYakit("5.", 5, this.besinci5, this.besinci),
              Expanded(child: Container()),
              Expanded(child: Container()),
            ],
          ),
        ],
      );
    }
  }

  birinciYakit() {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    "1.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(left: 5, bottom: 5),
                  child: Text(
                    "(Son Yakıt)",
                    style: TextStyle(
                        color: const Color(0xFFCC5B26),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: this.birinci1,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFCC5B26),
                    borderRadius: BorderRadius.circular(20)),
                height: 10,
                margin: EdgeInsets.only(left: 5, right: 0),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(top: 5, left: 5),
              child: Text(
                this.birinci.toStringAsFixed(1) + " TL",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "GrotesklyYours",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  digerYakit(String sira, int renkler, double sayi, double sayi2) {
    var renk;
    var renk1 = Color(0xFFD0913C);
    var renk2 = Color(0xFFE8DB76);
    var renk3 = Color(0xFF93B45E);
    var renk4 = Color(0xFF3B7F1A);
    if (renkler == 2) {
      renk = renk1;
    } else if (renkler == 3) {
      renk = renk2;
    } else if (renkler == 4) {
      renk = renk3;
    } else {
      renk = renk4;
    }
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 5, bottom: 5),
              child: Text(
                sira,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FractionallySizedBox(
              widthFactor: sayi,
              child: Container(
                decoration: BoxDecoration(
                    color: renk, borderRadius: BorderRadius.circular(20)),
                height: 10,
                margin: EdgeInsets.only(left: 5, right: 0),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(top: 5, left: 5),
              child: Text(
                sayi2.toStringAsFixed(1) + " TL",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "GrotesklyYours",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double birinci1;

  double ikinci2;

  double ucuncu3;

  double dorduncu4;

  double besinci5;
  grafik() {
    if (widget.arac.dorduncuFiyat == null) {
      grafik1();
    } else if (widget.arac.ucuncuFiyat == null) {
      grafik2();
    } else if (widget.arac.ikinciFiyat == null) {
      grafik3();
    } else if (widget.arac.birinciFiyat == null) {
      grafik4();
    } else {
      grafik5();
    }
  }

  grafik1() {
    double sayi = this.birinci / 100;
    this.birinci1 = this.birinci / (100 * sayi);
  }

  grafik2() {
    double enbuyuk = enbuyuk2(this.birinci, this.ikinci);
    double sayi = enbuyuk / 100;
    this.birinci1 = this.birinci / (100 * sayi);
    this.ikinci2 = this.ikinci / (100 * sayi);
  }

  grafik3() {
    double enbuyuk = enbuyuk3(this.birinci, this.ikinci, this.ucuncu);
    double sayi = enbuyuk / 100;
    this.birinci1 = this.birinci / (100 * sayi);
    this.ikinci2 = this.ikinci / (100 * sayi);
    this.ucuncu3 = this.ucuncu / (100 * sayi);
  }

  grafik4() {
    double enbuyuk =
        enbuyuk4(this.birinci, this.ikinci, this.ucuncu, this.dorduncu);
    double sayi = enbuyuk / 100;
    this.birinci1 = this.birinci / (100 * sayi);
    this.ikinci2 = this.ikinci / (100 * sayi);
    this.ucuncu3 = this.ucuncu / (100 * sayi);
    this.dorduncu4 = this.dorduncu / (100.0 * sayi);
  }

  grafik5() {
    double enbuyuk = enbuyuk5(
        this.birinci, this.ikinci, this.ucuncu, this.dorduncu, this.besinci);
    double sayi = enbuyuk / 100;
    this.birinci1 = this.birinci / (100 * sayi);
    this.ikinci2 = this.ikinci / (100 * sayi);
    this.ucuncu3 = this.ucuncu / (100 * sayi);
    this.dorduncu4 = this.dorduncu / (100.0 * sayi);
    this.besinci5 = this.besinci / (100 * sayi);
  }

  double enbuyuk2(double bir, double iki) {
    double enbuyuk = 0;
    if (bir >= iki) {
      enbuyuk = bir;
      return enbuyuk;
    } else {
      enbuyuk = iki;
      return enbuyuk;
    }
  }

  double enbuyuk3(double bir, double iki, double uc) {
    double enbuyuk = 0;
    if (bir >= iki && bir >= uc) {
      enbuyuk = bir;
      return enbuyuk;
    } else if (iki >= bir && iki >= uc) {
      enbuyuk = iki;
      return enbuyuk;
    } else {
      enbuyuk = uc;
      return enbuyuk;
    }
  }

  double enbuyuk4(double bir, double iki, double uc, double dort) {
    double enbuyuk = 0;
    if (bir >= iki && bir >= uc && bir >= dort) {
      enbuyuk = bir;
      return enbuyuk;
    } else if (iki >= bir && iki >= uc && iki >= dort) {
      enbuyuk = iki;
      return enbuyuk;
    } else if (uc >= bir && uc >= iki && uc >= dort) {
      enbuyuk = uc;
      return enbuyuk;
    } else {
      enbuyuk = dort;
      return enbuyuk;
    }
  }

  double enbuyuk5(double bir, double iki, double uc, double dort, double bes) {
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

class MaliyetEkrani5 extends StatefulWidget {
  Arac arac;
  MaliyetEkrani5({this.arac});
  @override
  _MaliyetEkrani5State createState() => _MaliyetEkrani5State();
}

class _MaliyetEkrani5State extends State<MaliyetEkrani5> {
  AracOzellikleriControl _bilgiler = AracOzellikleriControl();

  @override
  Widget build(BuildContext context) {
    if (widget.arac.tarih != int.parse(DateFormat.M().format(DateTime.now()))) {
      widget.arac.aylikyakit = 0;
    }
    return maliyetEkrani4bir();
    throw UnimplementedError();
  }

  maliyetEkrani4bir() {
    if (widget.arac.dorduncuFiyat == null) {
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
                                    .sonYakit()
                                    .toStringAsFixed(2),
                                " Lira Son Yakıt"),
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
                                        widget.arac.aylikyakit
                                            .toStringAsFixed(2),
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
    } else {
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
                            zam(),
                            _bilgiler.bilgiler(
                                Hesaplamalar(arac: widget.arac)
                                    .sonYakit()
                                    .toStringAsFixed(2),
                                " Lira Son Yakıt"),
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
                                        widget.arac.aylikyakit
                                            .toStringAsFixed(2),
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
                            zamMiktari(),
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
    }
  }

  zam() {
    double fark = widget.arac.besinciFiyat - widget.arac.dorduncuFiyat;
    if (fark < 0) {
      return _bilgiler.bilgiler(
          "%" + Hesaplamalar(arac: widget.arac).zamOrani().toStringAsFixed(0),
          " İndirim Uygulanmış");
    } else {
      return _bilgiler.bilgiler(
          "%" + Hesaplamalar(arac: widget.arac).zamOrani().toStringAsFixed(0),
          " Zam Uygulanmış");
    }
  }

  zamMiktari() {
    double fark = Hesaplamalar(arac: widget.arac).zamMiktari();
    if (fark < 0) {
      return _bilgiler.bilgiler(
          (Hesaplamalar(arac: widget.arac).zamMiktari() * -1)
              .toStringAsFixed(2),
          "Lira İndirim Uygulanmış");
    } else {
      return _bilgiler.bilgiler(
          Hesaplamalar(arac: widget.arac).zamMiktari().toStringAsFixed(2),
          "Lira Zam Uygulanmış");
    }
  }
}
