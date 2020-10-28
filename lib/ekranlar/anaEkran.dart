import 'package:flutter/material.dart';

class AnaEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: const Color(0xffE0E0E0),
      body: SafeArea(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25, bottom: 45, left: 15),
                    child: Text(
                      "Mercedes Benz",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 45, bottom: 25, left: 15),
                    child: Text(
                      "C200d",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.only(top: 38, right: 15),
                      child: Text(
                        "(00 AA 000)",
                        style: TextStyle(color: Colors.blueGrey),
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
            Expanded(child: Container()),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    child: Image(image: AssetImage("assets/images/shadow.png")),
                  ),
                  Container(
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 35, left: 0),
                            child: Text(
                              "100 Kilometrede",
                              style: TextStyle(
                                  fontFamily: "EslGothicUnicode", fontSize: 17),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 55, right: 40),
                            child: Text(
                              "6.7",
                              style: TextStyle(
                                  fontFamily: "EslGothicUnicode", fontSize: 25),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 63, left: 50),
                            child: Text(
                              "litre",
                              style: TextStyle(
                                  fontFamily: "EslGothicUnicode", fontSize: 17),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin:
                                EdgeInsets.only(top: 90, left: 80, right: 80),
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 115, right: 130),
                            child: Text(
                              "Kilometreye",
                              style: TextStyle(
                                  fontFamily: "EslGothicUnicode", fontSize: 17),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 110, left: 25),
                            child: Text(
                              "0.30",
                              style: TextStyle(
                                  fontFamily: "EslGothicUnicode", fontSize: 25),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 115, left: 135),
                            child: Text(
                              "kuruş",
                              style: TextStyle(
                                  fontFamily: "EslGothicUnicode", fontSize: 17),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                              margin: EdgeInsets.only(
                                  top: 160, left: 60, right: 60),
                              height: 3,
                              color: Colors.black),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 190, right: 150),
                            child: Text(
                              "Son Alınan Yakıt",
                              style: TextStyle(
                                  fontFamily: "EslGothicUnicode", fontSize: 17),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 185, left: 60),
                            child: Text(
                              "120.50",
                              style: TextStyle(
                                  fontFamily: "EslGothicUnicode", fontSize: 25),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 190, left: 180),
                            child: Text(
                              "lira",
                              style: TextStyle(
                                  fontFamily: "EslGothicUnicode", fontSize: 17),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin:
                                EdgeInsets.only(top: 240, left: 80, right: 80),
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 250),
                            child: Text(
                              "Kilometresi",
                              style: TextStyle(
                                  fontFamily: "EslGothicUnicode", fontSize: 17),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 270),
                            child: Text(
                              "123000",
                              style: TextStyle(
                                  fontFamily: "EslGothicUnicode", fontSize: 25),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 300),
                            child: Text(
                              "kilometre",
                              style: TextStyle(
                                  fontFamily: "EslGothicUnicode", fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                              child: Center(
                                  child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Yakıt Aldım",
                                  style:
                                      TextStyle(fontFamily: "EslGothicUnicode"),
                                ),
                              )),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 30,
                                child: Image(
                                    image: AssetImage("assets/images/gas.png")),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                              child: Center(
                                  child: Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  "Araç Özellikleri",
                                  style:
                                      TextStyle(fontFamily: "EslGothicUnicode"),
                                ),
                              )),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 30,
                                child: Image(
                                    image: AssetImage(
                                        "assets/images/enginePiston.png")),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
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
                        style: TextStyle(fontFamily: "EslGothicUnicode"),
                      )),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
    throw UnimplementedError();
  }
}
