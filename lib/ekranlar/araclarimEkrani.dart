import 'package:flutter/material.dart';
import 'package:yakitim/database/database.dart';
import 'package:yakitim/ekranlar/anaEkran.dart';
import 'package:yakitim/ekranlar/aracEkle.dart';
import 'package:yakitim/ekranlar/aracGuncellemeEkrani.dart';
import 'package:yakitim/modeller/arac.dart';
import 'package:yakitim/modeller/secim.dart';

class Araclar extends StatefulWidget {
  @override
  _Araclar createState() => _Araclar();
}

class _Araclar extends State<Araclar> {
  Secim secim = new Secim();
  List<Arac> araclar = [];
  DBHelper dbHelper;
  Future futureAraclar;
  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    futureAraclar = futureAraclarr();
  }

  futureAraclarr() async {
    return await DBHelper().getAraclar();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: const Color(0xFF2C2C32),
          body: SafeArea(
              child: Column(
            children: [
              _AppBar(),
              FutureBuilder(
                future: futureAraclar,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    araclar = snapshot.data;
                    return FutureBuilder(
                      future: DBHelper().getSecim(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          secim = snapshot.data;
                          return _List();
                        } else {
                          return Expanded(
                              child:
                                  Center(child: CircularProgressIndicator()));
                        }
                      },
                    );
                  } else {
                    return Expanded(
                        child: Center(child: CircularProgressIndicator()));
                  }
                },
              ),
            ],
          ))),
    );
  }

  _AppBar() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Araçlarım",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "GrotesklyYours",
                    fontSize: 15,
                    color: Colors.white,
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
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AracEkle(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 15, right: 10),
                    height: 25,
                    width: 25,
                    child: Center(
                      child: Image(
                        image: AssetImage("assets/images/plus.png"),
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
  }

  _List() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(30),
        child: ListView.builder(
          itemCount: araclar.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        onTap: () {
                          if (this.secim.secim != araclar[index].id) {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text(
                                  araclar[index].marka.toUpperCase() +
                                      " (" +
                                      araclar[index].plaka.toUpperCase() +
                                      ")",
                                  style:
                                      TextStyle(fontFamily: "GrotesklyYours"),
                                ),
                                content: Text(
                                    "Aracı seçmek istediğinizden emin misiniz?"),
                                actions: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            this.secim.secim =
                                                araclar[index].id;
                                            print("secim " +
                                                secim.secim.toString());
                                            dbHelper.secimUpdate(this.secim);
                                            setState(() {});
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 10),
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
                                            Navigator.of(context).pop();
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
                            );
                          }

                          print(araclar[index].marka + " marka araca tıklandı");
                        },
                        title: Text(
                          araclar[index].marka.toUpperCase() ?? "",
                          style: TextStyle(
                              fontFamily: "GrotesklyYours",
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        subtitle: Text(
                          "(" + araclar[index].id.toString() + ")" ?? "",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AracGuncelleme(
                              arac: araclar[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/update.png"))),
                      ),
                    ),
                    silmeEkrani(index),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  silmeEkrani(int index) {
    if (this.secim.secim != araclar[index].id) {
      return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                araclar[index].marka.toUpperCase() +
                    " (" +
                    araclar[index].plaka.toUpperCase() +
                    ")",
                style:
                    TextStyle(fontFamily: "GrotesklyYours", color: Colors.red),
              ),
              content: Text(
                "Aracı silmek istediğinizden emin misiniz?",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          dbHelper.sil(araclar[index].id);
                          setState(() {
                            futureAraclar = futureAraclarr();
                          });
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/images/tick.png"),
                          )),
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/images/delete.png"),
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
          margin: EdgeInsets.only(right: 10),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/delete.png"),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
