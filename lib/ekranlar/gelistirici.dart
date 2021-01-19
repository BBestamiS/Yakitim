import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yakitim/ekranlar/anaEkran.dart';

class Gelistirici extends StatefulWidget {
  @override
  _Gelistirici createState() => _Gelistirici();
}

class _Gelistirici extends State<Gelistirici> {
  @override
  Widget build(BuildContext context) {
    var assetImage = AssetImage("assets/images/benn.jpg");
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C32),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
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
                      margin: EdgeInsets.only(right: 25, top: 50),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/backButton.png"),
                      )),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 20, left: 10),
                          child: Text(
                            "Beyazıt",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "GrotesklyYours",
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 20, left: 130),
                          child: Text(
                            "Bestami",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "GrotesklyYours",
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 50, left: 10),
                          child: Text(
                            "Sarıkaya",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "GrotesklyYours",
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 27),
                        color: Colors.orange,
                        width: 3,
                        height: 70,
                      )
                    ],
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 25, left: 49),
                //   width: 3,
                //   height: 20,
                //   color: Colors.orange,
                // ),
                // Container(
                //   margin: EdgeInsets.only(top: 20),
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: Text(
                //       "Beyazıt Bestami Sarıkaya",
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontFamily: "GrotesklyYours",
                //           fontWeight: FontWeight.bold,
                //           fontSize: 20),
                //     ),
                //   ),
                // )
              ],
            ),
            Expanded(
                child: Center(
              child: GestureDetector(
                onTap: () async {
                  if (await canLaunch(
                      "https://www.instagram.com/bestami_sarikaya/?hl=tr")) {
                    await launch(
                        "https://www.instagram.com/bestami_sarikaya/?hl=tr");
                  }
                },
                child: Container(
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: 90,
                                    height: 40,
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/instagram.png"))),
                                  ),
                                ),
                                Container(
                                  color: Colors.black,
                                  height: 0.5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, top: 10),
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEBC2D2),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/ben.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Text(
                                                "bestami_sarikaya",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "GrotesklyYours",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "14",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text("gönderi"),
                                                      ],
                                                    ),
                                                  )),
                                                  Expanded(
                                                      child: Container(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "366",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text("takipçi"),
                                                      ],
                                                    ),
                                                  )),
                                                  Expanded(
                                                      child: Container(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "569",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text("takip"),
                                                      ],
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: AspectRatio(
                                      aspectRatio: 14 / 16,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 10,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/images/insta.jpg"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 20),
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/heart.png"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 20),
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/topic.png"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 20),
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/send.png"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
