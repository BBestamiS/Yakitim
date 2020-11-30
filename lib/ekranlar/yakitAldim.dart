import 'package:flutter/material.dart';
import 'package:yakitim/database/database.dart';
import 'package:yakitim/ekranlar/anaEkran.dart';
import 'package:yakitim/ekranlar/ilkYakitEkrani.dart';
import 'package:yakitim/modeller/arac.dart';

class YakitAldim extends StatefulWidget {
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
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C32),
      body: SafeArea(
        child: FutureBuilder(
          future: farac,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              this.arac = snapshot.data;
              return yakit();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
    throw UnimplementedError();
  }

  yakit() {
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
                  (int.parse(_aracKilometre.text) - arac.kilometre);
              if (arac.besinciyakitlitre == null) {
                arac.besinciyakitfiyat = double.parse(_yakitLitreFiyat.text);
                arac.besinciyakitlitre = double.parse(_yakitLitre.text);
                arac.besincikilometre = aracKilometre;
                arac.kilometre = int.parse(_aracKilometre.text);
              } else {
                if (arac.dorduncuyakitlitre == null) {
                  arac.dorduncuyakitfiyat = arac.besinciyakitfiyat;
                  arac.dorduncuyakitlitre = arac.besinciyakitlitre;
                  arac.dorduncukilometre = arac.besincikilometre;
                  arac.besinciyakitfiyat = double.parse(_yakitLitreFiyat.text);
                  arac.besinciyakitlitre = double.parse(_yakitLitre.text);
                  arac.besincikilometre = aracKilometre;
                  arac.kilometre = int.parse(_aracKilometre.text);
                } else {
                  if (arac.ucuncuyakitlitre == null) {
                    arac.ucuncuyakitfiyat = arac.dorduncuyakitfiyat;
                    arac.ucuncuyakitlitre = arac.dorduncuyakitlitre;
                    arac.ucuncukilometre = arac.dorduncukilometre;
                    //------------------------------------------------------
                    arac.dorduncuyakitfiyat = arac.besinciyakitfiyat;
                    arac.dorduncuyakitlitre = arac.besinciyakitlitre;
                    arac.dorduncukilometre = arac.besincikilometre;

                    arac.besinciyakitfiyat =
                        double.parse(_yakitLitreFiyat.text);
                    arac.besinciyakitlitre = double.parse(_yakitLitre.text);
                    arac.besincikilometre = aracKilometre;
                    arac.kilometre = int.parse(_aracKilometre.text);
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
                          double.parse(_yakitLitreFiyat.text);
                      arac.besinciyakitlitre = double.parse(_yakitLitre.text);
                      arac.besincikilometre = aracKilometre;
                      arac.kilometre = int.parse(_aracKilometre.text);
                    } else {
                      if (arac.birinciyakitlitre == null) {
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
                            double.parse(_yakitLitreFiyat.text);
                        arac.besinciyakitlitre = double.parse(_yakitLitre.text);
                        arac.besincikilometre = aracKilometre;
                        arac.kilometre = int.parse(_aracKilometre.text);
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
                            double.parse(_yakitLitreFiyat.text);
                        arac.besinciyakitlitre = double.parse(_yakitLitre.text);
                        arac.besincikilometre = aracKilometre;
                        arac.kilometre = int.parse(_aracKilometre.text);
                      }
                    }
                  }
                }
              }
              DBHelper().aracUpdate(arac);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnaEkran(),
                ),
              );
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
                builder: (context) => AnaEkran(),
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
