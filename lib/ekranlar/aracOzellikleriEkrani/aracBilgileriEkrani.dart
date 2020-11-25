import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yakitim/ekranlar/anaEkran.dart';

class AracOzellikleriEkrani2 extends StatelessWidget {
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
                              child: Container(
                                margin: EdgeInsets.only(right: 20, top: 50),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/engine1.png"))),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 20, top: 35, right: 20),
                                child: AutoSizeText(
                                  "Mercedes",
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
                                "C200d",
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
                                      "123.300",
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
                                  "Dizel",
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
                                      "50",
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
                                      "1.6",
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
                                          "00 AA 000",
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
                width: 200,
                height: 130,
                margin: EdgeInsets.only(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/tesla.png"),
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
                      builder: (context) => AnaEkran(),
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
}
