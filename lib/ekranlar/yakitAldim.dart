import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yakitim/database/database.dart';
import 'package:yakitim/ekranlar/anaEkran.dart';
import 'package:yakitim/ekranlar/ilkYakitEkrani.dart';
import 'package:yakitim/hesaplamalar/hesaplamalar.dart';
import 'package:yakitim/modeller/arac.dart';

class YakitAldim extends StatefulWidget {
  int secim;
  Arac arac;
  YakitAldim({this.secim, this.arac});
  @override
  _YakitAldimState createState() => _YakitAldimState();
}

class _YakitAldimState extends State<YakitAldim> {
  final _yakitLitreFiyat = TextEditingController();
  final _yakitLitre = TextEditingController();
  final _aracKilometre = TextEditingController();
  Arac arac;
  Future farac;
  @override
  void initState() {
    super.initState();
    farac = futureArac();
  }

  futureArac() async {
    return await DBHelper().getArac();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.arac.toplamlitre);
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C32),
      body: SafeArea(
        child: FutureBuilder(
          future: farac,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              this.arac = snapshot.data;
              print("son yakıt = " + arac.besinciFiyat.toString());
              print("1 yakıt = " + arac.dorduncuFiyat.toString());
              print("2 yakıt = " + arac.ucuncuFiyat.toString());
              print("3 yakıt = " + arac.ikinciFiyat.toString());
              print("4 yakıt = " + arac.birinciFiyat.toString());
              if (widget.secim == 1) {
                return yakit();
              } else {
                return yakit1();
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
    throw UnimplementedError();
  }

  yakit1() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Yakıt Aldım",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "GrotesklyYours",
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    geriButonu(),
                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "Yakıtın Litre Fiyatı",
                          style: TextStyle(
                            fontSize: 20,
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
                        controller: _yakitLitreFiyat,
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
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Kaç Litre Alındı",
                          style: TextStyle(
                            fontSize: 20,
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
                        controller: _yakitLitre,
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
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Araç Kilometresi",
                          style: TextStyle(
                            fontSize: 20,
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
                        controller: _aracKilometre,
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
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              arac.kilometre = int.parse(_aracKilometre.text);
              arac.toplamlira = (widget.arac.toplamlira +
                  (double.parse(_yakitLitre.text) *
                      double.parse(_yakitLitreFiyat.text)));
              arac.toplamlitre =
                  (widget.arac.toplamlitre + double.parse(_yakitLitre.text));
              kaydirma();
              if (arac.tarih == null) {
                arac.tarih = 0;
              }
              if (arac.tarih ==
                  int.parse(DateFormat.M().format(DateTime.now()))) {
                arac.aylikyakit = arac.aylikyakit +
                    (double.parse(_yakitLitre.text) *
                        double.parse(_yakitLitreFiyat.text));
              } else {
                arac.aylikyakit = double.parse(_yakitLitre.text) *
                    double.parse(_yakitLitreFiyat.text);
              }
              arac.tarih = int.parse(DateFormat.M().format(DateTime.now()));
              arac.motorisigi = 0;
              DBHelper().aracUpdate(arac);
              if (arac.besincikilometre != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnaEkranGecis(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IlkYakitEkrani(),
                  ),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(25.0)),
              margin: EdgeInsets.only(
                  left: 90.0, right: 90.0, bottom: 15.0, top: 40),
              height: 50.0,
              child: Center(
                child: Text(
                  "Tamam",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "GrotesklyYours",
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  yakit() {
    print(widget.arac.toplamlira);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Yakıt Aldım",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "GrotesklyYours",
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    geriButonu(),
                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "Yakıtın Litre Fiyatı",
                          style: TextStyle(
                            fontSize: 20,
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
                        controller: _yakitLitreFiyat,
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
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Kaç Litre Alındı",
                          style: TextStyle(
                            fontSize: 20,
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
                        controller: _yakitLitre,
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
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          "Araç Kilometresi",
                          style: TextStyle(
                            fontSize: 20,
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
                        controller: _aracKilometre,
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
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              int aracKilometre =
                  (int.parse(_aracKilometre.text) - arac.sonkilometre);
              if (arac.besinciyakitlitre == null) {
                arac.besinciyakitfiyat = ((double.parse(_yakitLitre.text) *
                        double.parse(_yakitLitreFiyat.text)) +
                    widget.arac.toplamlira);
                arac.besinciyakitlitre =
                    (double.parse(_yakitLitre.text) + widget.arac.toplamlitre);
                arac.besincikilometre = aracKilometre;
                arac.kilometre = int.parse(_aracKilometre.text);
                arac.toplamlira = 0;
                arac.toplamlitre = 0;
                arac.sonkilometre = int.parse(_aracKilometre.text);
                kaydirma();
              } else {
                if (arac.dorduncuyakitlitre == null) {
                  arac.dorduncuyakitfiyat = arac.besinciyakitfiyat;
                  arac.dorduncuyakitlitre = arac.besinciyakitlitre;
                  arac.dorduncukilometre = arac.besincikilometre;

                  arac.besinciyakitfiyat = ((double.parse(_yakitLitre.text) *
                          double.parse(_yakitLitreFiyat.text)) +
                      widget.arac.toplamlira);
                  arac.besinciyakitlitre = (double.parse(_yakitLitre.text) +
                      widget.arac.toplamlitre);
                  arac.besincikilometre = aracKilometre;
                  arac.kilometre = int.parse(_aracKilometre.text);
                  arac.toplamlira = 0;
                  arac.toplamlitre = 0;
                  arac.sonkilometre = int.parse(_aracKilometre.text);

                  kaydirma();
                } else {
                  if (arac.ucuncuyakitlitre == null) {
                    arac.ucuncuyakitfiyat = arac.dorduncuyakitfiyat;
                    arac.ucuncuyakitlitre = arac.dorduncuyakitlitre;
                    arac.ucuncukilometre = arac.dorduncukilometre;
                    //------------------------------------------------------
                    arac.dorduncuyakitfiyat = arac.besinciyakitfiyat;
                    arac.dorduncuyakitlitre = arac.besinciyakitlitre;
                    arac.dorduncukilometre = arac.besincikilometre;

                    arac.besinciyakitfiyat = ((double.parse(_yakitLitre.text) *
                            double.parse(_yakitLitreFiyat.text)) +
                        widget.arac.toplamlira);
                    arac.besinciyakitlitre = (double.parse(_yakitLitre.text) +
                        widget.arac.toplamlitre);
                    arac.besincikilometre = aracKilometre;
                    arac.kilometre = int.parse(_aracKilometre.text);
                    arac.toplamlira = 0;
                    arac.toplamlitre = 0;
                    arac.sonkilometre = int.parse(_aracKilometre.text);
                    kaydirma();
                  } else {
                    if (arac.ikinciyakitlitre == null) {
                      arac.ikinciyakitfiyat = arac.ucuncuyakitfiyat;
                      arac.ikinciyakitlitre = arac.ucuncuyakitlitre;
                      arac.ikincikilometre = arac.ucuncukilometre;
                      //------------------------------------------------------
                      arac.ucuncuyakitfiyat = arac.dorduncuyakitfiyat;
                      arac.ucuncuyakitlitre = arac.dorduncuyakitlitre;
                      arac.ucuncukilometre = arac.dorduncukilometre;
                      //------------------------------------------------------
                      arac.dorduncuyakitfiyat = arac.besinciyakitfiyat;
                      arac.dorduncuyakitlitre = arac.besinciyakitlitre;
                      arac.dorduncukilometre = arac.besincikilometre;
                      arac.besinciyakitfiyat =
                          ((double.parse(_yakitLitre.text) *
                                  double.parse(_yakitLitreFiyat.text)) +
                              widget.arac.toplamlira);
                      arac.besinciyakitlitre = (double.parse(_yakitLitre.text) +
                          widget.arac.toplamlitre);
                      arac.besincikilometre = aracKilometre;
                      arac.kilometre = int.parse(_aracKilometre.text);
                      arac.toplamlira = 0;
                      arac.toplamlitre = 0;
                      arac.sonkilometre = int.parse(_aracKilometre.text);
                      kaydirma();
                    } else {
                      arac.birinciyakitfiyat = arac.ikinciyakitfiyat;
                      arac.birinciyakitlitre = arac.ikinciyakitlitre;
                      arac.birincikilometre = arac.ikincikilometre;
                      //------------------------------------------------------
                      arac.ikinciyakitfiyat = arac.ucuncuyakitfiyat;
                      arac.ikinciyakitlitre = arac.ucuncuyakitlitre;
                      arac.ikincikilometre = arac.ucuncukilometre;
                      //------------------------------------------------------
                      arac.ucuncuyakitfiyat = arac.dorduncuyakitfiyat;
                      arac.ucuncuyakitlitre = arac.dorduncuyakitlitre;
                      arac.ucuncukilometre = arac.dorduncukilometre;
                      //------------------------------------------------------
                      arac.dorduncuyakitfiyat = arac.besinciyakitfiyat;
                      arac.dorduncuyakitlitre = arac.besinciyakitlitre;
                      arac.dorduncukilometre = arac.besincikilometre;
                      //------------------------------------------------------
                      arac.besinciyakitfiyat =
                          ((double.parse(_yakitLitre.text) *
                                  double.parse(_yakitLitreFiyat.text)) +
                              widget.arac.toplamlira);
                      arac.besinciyakitlitre = (double.parse(_yakitLitre.text) +
                          widget.arac.toplamlitre);
                      arac.besincikilometre = aracKilometre;
                      arac.kilometre = int.parse(_aracKilometre.text);
                      arac.toplamlira = 0;
                      arac.toplamlitre = 0;
                      arac.sonkilometre = int.parse(_aracKilometre.text);
                      kaydirma();
                    }
                  }
                }
              }
              if (arac.tarih == null) {
                arac.tarih = 0;
              }
              if (arac.tarih ==
                  int.parse(DateFormat.M().format(DateTime.now()))) {
                arac.aylikyakit = arac.aylikyakit +
                    (double.parse(_yakitLitre.text) *
                        double.parse(_yakitLitreFiyat.text));
              } else {
                arac.aylikyakit = double.parse(_yakitLitre.text) *
                    double.parse(_yakitLitreFiyat.text);
              }
              arac.tarih = int.parse(DateFormat.M().format(DateTime.now()));
              if (arac.dorduncuyakitfiyat != null) {
                arac.motorisigi = Hesaplamalar(arac: arac).checkEngine();
              }
              DBHelper().aracUpdate(arac);
              if (arac.motorisigi == 1) {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(
                      "Dikkat!",
                      style: TextStyle(color: Colors.red),
                    ),
                    content: Text(
                        "Aracınız aşırı derecede yakıt tüketti, en kısa zamanda bakıma götürünüz."),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnaEkranGecis(),
                            ),
                          );
                        },
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange),
                            child: Center(child: Text("Tamam")),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnaEkranGecis(),
                  ),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(25.0)),
              margin: EdgeInsets.only(
                  left: 90.0, right: 90.0, bottom: 15.0, top: 40),
              height: 50.0,
              child: Center(
                child: Text(
                  "Tamam",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "GrotesklyYours",
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  kaydirma() {
    if (arac.besinciFiyat == null) {
      arac.besinciFiyat = double.parse(_yakitLitreFiyat.text);
      arac.besinciLitre = double.parse(_yakitLitre.text);
    } else {
      if (arac.dorduncuFiyat == null) {
        arac.dorduncuFiyat = arac.besinciFiyat;
        arac.dorduncuLitre = arac.besinciLitre;
        arac.besinciFiyat = double.parse(_yakitLitreFiyat.text);
        arac.besinciLitre = double.parse(_yakitLitre.text);
      } else {
        if (arac.ucuncuFiyat == null) {
          arac.ucuncuFiyat = arac.dorduncuFiyat;
          arac.ucuncuLitre = arac.dorduncuLitre;
          arac.dorduncuFiyat = arac.besinciFiyat;
          arac.dorduncuLitre = arac.besinciLitre;
          arac.besinciFiyat = double.parse(_yakitLitreFiyat.text);
          arac.besinciLitre = double.parse(_yakitLitre.text);
        } else {
          if (arac.ikinciFiyat == null) {
            arac.ikinciFiyat = arac.ucuncuFiyat;
            arac.ikinciLitre = arac.ucuncuLitre;
            arac.ucuncuFiyat = arac.dorduncuFiyat;
            arac.ucuncuLitre = arac.dorduncuLitre;
            arac.dorduncuFiyat = arac.besinciFiyat;
            arac.dorduncuLitre = arac.besinciLitre;
            arac.besinciFiyat = double.parse(_yakitLitreFiyat.text);
            arac.besinciLitre = double.parse(_yakitLitre.text);
          } else {
            arac.birinciFiyat = arac.ikinciFiyat;
            arac.birinciLitre = arac.ikinciLitre;
            arac.ikinciFiyat = arac.ucuncuFiyat;
            arac.ikinciLitre = arac.ucuncuLitre;
            arac.ucuncuFiyat = arac.dorduncuFiyat;
            arac.ucuncuLitre = arac.dorduncuLitre;
            arac.dorduncuFiyat = arac.besinciFiyat;
            arac.dorduncuLitre = arac.besinciLitre;
            arac.besinciFiyat = double.parse(_yakitLitreFiyat.text);
            arac.besinciLitre = double.parse(_yakitLitre.text);
          }
        }
      }
    }
  }

  geriButonu() {
    if (this.arac.besinciyakitlitre == null) {
      return Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IlkYakitEkrani(),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(top: 15, left: 10),
            height: 30,
            width: 30,
            child: Center(
              child: Image(
                image: AssetImage("assets/images/backButton.png"),
              ),
            ),
          ),
        ),
      );
    } else {
      return Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AnaEkranGecis(),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(top: 15, left: 10),
            height: 30,
            width: 30,
            child: Center(
              child: Image(
                image: AssetImage("assets/images/backButton.png"),
              ),
            ),
          ),
        ),
      );
    }
  }
}
