import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yakitim/ekranlar/aracOzellikleriEkrani/aracOzellikleriControl.dart';
import 'package:yakitim/ekranlar/araclar.dart';
import 'package:yakitim/ekranlar/yakitAldim.dart';

class AnaEkran extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnaEkran();
  }
}

class _AnaEkran extends State {
  var buton = button1();
  var yazi = text();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C32),
      body: SafeArea(
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
                        "Mercedes Benz",
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
                        "C200d",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "GrotesklyYours",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(top: 35, right: 15),
                        child: Text(
                          "(00 AA 000)",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "GrotesklyYours",
                              fontWeight: FontWeight.bold),
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
                          this.yazi = text();
                          this.buton = button1();
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
                        child:
                            Image(image: AssetImage("assets/images/gas.png")),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YakitAldim(),
                              ),
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
                                builder: (context) => AracOzellikleriControl(),
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
                            image:
                                AssetImage("assets/images/enginePiston.png")),
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
      ),
    );
    throw UnimplementedError();
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

int yaziSayac = 0;

text() {
  yaziSayac++;
  if (yaziSayac == 1) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: AutoSizeText(
        "6.5 litre/100km",
        style: TextStyle(fontFamily: "GrotesklyYours", fontSize: 40),
        maxLines: 1,
      ),
    );
  } else if (yaziSayac == 2) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: AutoSizeText(
        "30 kuruş/km",
        style: TextStyle(fontFamily: "GrotesklyYours", fontSize: 40),
        maxLines: 1,
      ),
    );
  } else if (yaziSayac == 3) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: AutoSizeText(
        "Son yakıt 130.50 TL",
        style: TextStyle(fontFamily: "GrotesklyYours", fontSize: 40),
        maxLines: 2,
      ),
    );
  } else if (yaziSayac == 4) {
    yaziSayac = 0;
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: AutoSizeText(
        "123.300 Kilometre",
        style: TextStyle(fontFamily: "GrotesklyYours", fontSize: 40),
        maxLines: 1,
      ),
    );
  }
}
