import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yakitim/database/database.dart';
import 'package:yakitim/ekranlar/anaEkran.dart';
import 'package:yakitim/modeller/arac.dart';

class AracOzellikleriEkrani2 extends StatefulWidget {
  Arac arac;
  AracOzellikleriEkrani2({this.arac});
  @override
  _AracOzellikleriEkrani2State createState() => _AracOzellikleriEkrani2State();
}

class _AracOzellikleriEkrani2State extends State<AracOzellikleriEkrani2> {
  DBHelper dbHelper;
  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF375AAB),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  //Yan taraflarda bulunan renkler
                  Expanded(
                    child: Container(
                      width: 3,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 1,
                      margin: EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xFFFFFC400),
                              blurRadius: 7.0,
                              spreadRadius: 7.0)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 3,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: 3,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 1,
                      margin: EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
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
                      width: 3,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.65,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: motorIsigi(),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 20, top: 35, right: 20),
                                child: AutoSizeText(
                                  widget.arac.marka,
                                  style: TextStyle(
                                      fontFamily: "GrotesklyYours",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 20, top: 75, right: 20),
                              child: AutoSizeText(
                                widget.arac.model,
                                style: TextStyle(
                                    fontFamily: "GrotesklyYours",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                child: Text(
                                  "Araç Kilometresi",
                                  style: TextStyle(
                                    fontFamily: "GrotesklyYours",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Row(
                                children: [
                                  Expanded(child: Container()),
                                  Container(
                                    margin: EdgeInsets.only(top: 50),
                                    child: Text(
                                      widget.arac.kilometre.toString(),
                                      style: TextStyle(
                                          fontFamily: "GrotesklyYours",
                                          fontSize: 25),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 50),
                                    child: Text(
                                      "Km",
                                      style: TextStyle(
                                          fontFamily: "GrotesklyYours",
                                          fontSize: 25),
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                child: Text(
                                  "Yakıt Tipi",
                                  style: TextStyle(
                                    fontFamily: "GrotesklyYours",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 50),
                                child: Text(
                                  yakitTipi1(),
                                  style: TextStyle(
                                      fontFamily: "GrotesklyYours",
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                              child: Align(
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    child: Text(
                                      "Depo Hacmi",
                                      style: TextStyle(
                                        fontFamily: "GrotesklyYours",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 50),
                                    child: Text(
                                      widget.arac.depohacmi.toString(),
                                      style: TextStyle(
                                          fontFamily: "GrotesklyYours",
                                          fontSize: 25),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Expanded(
                              child: Align(
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    child: Text(
                                      "Motor Hacmi",
                                      style: TextStyle(
                                        fontFamily: "GrotesklyYours",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 50),
                                    child: Text(
                                      widget.arac.motorhacmi.toString(),
                                      style: TextStyle(
                                          fontFamily: "GrotesklyYours",
                                          fontSize: 25),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                        ],
                      )),
                      Center(
                        child: Text(
                          "Plakası",
                          style: TextStyle(
                            fontFamily: "GrotesklyYours",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 40,
                        margin: EdgeInsets.only(bottom: 90),
                        decoration: BoxDecoration(
                          border: Border.all(width: 3),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 6.0,
                                spreadRadius: 1.0)
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              height: 40,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 40,
                                    decoration:
                                        BoxDecoration(color: Colors.blue),
                                    child: Center(
                                        child: Text(
                                      "TR",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: AutoSizeText(
                                          widget.arac.plaka.toUpperCase(),
                                          style: TextStyle(
                                              fontFamily: "GrotesklyYours",
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 220,
                height: 130,
                margin: EdgeInsets.only(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/porscheon.png"),
                    // image: AssetImage("assets/images/tesla.png"),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
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
                  margin: EdgeInsets.only(left: 25, top: 30),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/backButton2.png"),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }

  motorIsigi() {
    if (widget.arac.motorisigi == 1) {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20, top: 50),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.yellow,
                      blurRadius: 26.0,
                      spreadRadius: 10.0),
                ]),
          ),
          GestureDetector(
            onTap: () {
              print("object");
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(
                    widget.arac.marka.toUpperCase(),
                    style: TextStyle(fontFamily: "GrotesklyYours"),
                  ),
                  content: Text(
                      "Marka aracın motor arza ışığını söndürmek istediğinizden emin misiniz?"),
                  actions: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              widget.arac.motorisigi = 0;
                              dbHelper.aracUpdate(widget.arac);
                              setState(() {});
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
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
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 20, top: 50),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/engine.png"),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(
        margin: EdgeInsets.only(right: 20, top: 50),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/engine1.png"))),
      );
    }
  }

  String yakitTipi1() {
    if (widget.arac.yakittipi == "lpg") {
      return "LPG";
    } else if (widget.arac.yakittipi == "benzin") {
      return "Benzin";
    } else {
      return "Dizel";
    }
  }
}
