import 'package:auto_size_text/auto_size_text.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:yakitim/database/database.dart';
import 'package:yakitim/ekranlar/aracOzellikleriEkrani/aracOzellikleriControl.dart';
import 'package:yakitim/ekranlar/araclarimEkrani.dart';
import 'package:yakitim/ekranlar/gelistirici.dart';
import 'package:yakitim/ekranlar/yakitAldim.dart';
import 'package:yakitim/hesaplamalar/hesaplamalar.dart';
import 'package:yakitim/modeller/arac.dart';

class AnaEkran extends StatefulWidget {
  int sayi;
  AnaEkran({this.sayi});
  @override
  _AnaEkran createState() => _AnaEkran();
}

class _AnaEkran extends State<AnaEkran> {
  int yaziSayac = 1;
  Future aracFuture;
  Textt textt = new Textt();
  Arac arac;
  int secim;
  var buton = button1();
  var yazi;

  @override
  void initState() {
    super.initState();

    aracFuture = _aracGetir();
  }

  _aracGetir() async {
    return await DBHelper().getArac();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF2C2C32),
        body: FutureBuilder(
            future: aracFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                this.arac = snapshot.data;
                yazi = textt.text(this.yaziSayac, arac);
                return anaEkran();
              } else {
                if (widget.sayi == 1) {
                  return Container(
                    color: const Color(0xFF2C2C32),
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1024 / 768,
                        child: Container(
                          child: FlareActor(
                            "assets/animations/splash.flr",
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                            animation: "Bekleme",
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }
            }));

    throw UnimplementedError();
  }

  anaEkran() {
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 15),
                    child: Text(
                      arac.marka.toUpperCase() ?? "",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "GrotesklyYours",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 35, left: 15),
                    child: Text(
                      arac.model.toUpperCase() ?? "",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: "GrotesklyYours",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onLongPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Gelistirici(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 35, right: 15),
                        child: Text(
                          "(" + arac.plaka.toUpperCase() + ")" ?? "",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "GrotesklyYours",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(70),
              ),
              height: 3,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 3 / 3,
                  child: GestureDetector(
                    onTapDown: (details) {
                      setState(() {
                        this.buton = button2();
                      });
                    },
                    onTapUp: (details) {
                      setState(() {
                        if (this.yaziSayac <= 3) {
                          this.yazi = textt.text(++this.yaziSayac, arac);
                          this.buton = button1();
                        } else {
                          this.yaziSayac = 0;
                          this.yazi = textt.text(++this.yaziSayac, arac);
                          this.buton = button1();
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 15, left: 15, top: 15),
                      child: Center(
                        child: Container(
                          child: Stack(
                            children: [
                              Container(
                                child: Center(
                                  child: this.yazi,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      decoration: buton,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 50,
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 23,
                      child: Image(image: AssetImage("assets/images/gas.png")),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              backgroundColor: Colors.white,
                              content: Container(
                                height: 56,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/backButton2.png"),
                                            )),
                                          )),
                                    ),
                                    Text(
                                      "Depo Tam Dolduruldu Mu?",
                                      style: TextStyle(
                                          fontFamily: "GrotesklyYours",
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      YakitAldim(
                                                        secim: 1,
                                                        arac: this.arac,
                                                      )));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 5),
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/tick.png"),
                                          )),
                                        )),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      YakitAldim(
                                                        secim: 2,
                                                        arac: this.arac,
                                                      )));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/delete.png"),
                                          )),
                                        )),
                                  ],
                                )
                              ],
                            ),
                            barrierDismissible: false,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Center(
                              child: Container(
                            child: Text(
                              "Yakıt Aldım",
                              style: TextStyle(
                                  fontFamily: "GrotesklyYours",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 3,
                    color: Colors.green,
                    margin: EdgeInsets.only(bottom: 5, top: 5),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AracOzellikleriControl(
                                arac: this.arac,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Center(
                              child: Container(
                            child: Text(
                              "Araç Özellikleri",
                              style: TextStyle(
                                  fontFamily: "GrotesklyYours",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 30,
                      child: Image(
                          image: AssetImage("assets/images/enginePiston.png")),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Araclar(),
                  ),
                );
              },
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(40)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Center(
                          child: Text(
                        "Araçlarım",
                        style: TextStyle(
                            fontFamily: "GrotesklyYours",
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

button1() {
  return BoxDecoration(
      color: Colors.grey[350],
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(color: Colors.white, blurRadius: 20.0, spreadRadius: 1.0)
      ]);
}

button2() {
  return BoxDecoration(
      color: Colors.grey[350],
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(color: Colors.grey[600], blurRadius: 26.0, spreadRadius: 5.0),
      ]);
}

class Textt {
  text(int yaziSayac, Arac arac) {
    if (yaziSayac == 1) {
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: AutoSizeText(
          Hesaplamalar(arac: arac).yuzKilometreYakitLitre().toStringAsFixed(1) +
              " litre/100km",
          style: TextStyle(fontFamily: "GrotesklyYours", fontSize: 40),
          maxLines: 1,
        ),
      );
    } else if (yaziSayac == 2) {
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: AutoSizeText(
          Hesaplamalar(arac: arac)
                  .kilometredeYakilanKurus()
                  .toStringAsFixed(2) +
              " lira/km",
          style: TextStyle(fontFamily: "GrotesklyYours", fontSize: 40),
          maxLines: 1,
        ),
      );
    } else if (yaziSayac == 3) {
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: AutoSizeText(
          "Son yakıt " +
              Hesaplamalar(arac: arac).sonYakit().toStringAsFixed(2) +
              " TL",
          style: TextStyle(fontFamily: "GrotesklyYours", fontSize: 40),
          maxLines: 2,
        ),
      );
    } else if (yaziSayac == 4) {
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: AutoSizeText(
          arac.kilometre.toString() + " Kilometre",
          style: TextStyle(fontFamily: "GrotesklyYours", fontSize: 40),
          maxLines: 1,
        ),
      );
    }
  }
}
