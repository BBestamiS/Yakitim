import 'package:flutter/material.dart';
import 'package:yakitim/database/database.dart';
import 'package:yakitim/ekranlar/araclarimEkrani.dart';
import 'package:yakitim/ekranlar/yakitAldim.dart';
import 'package:yakitim/modeller/arac.dart';

class IlkYakitEkrani extends StatefulWidget {
  @override
  _IlkYakitEkrani createState() => _IlkYakitEkrani();
}

class _IlkYakitEkrani extends State<IlkYakitEkrani> {
  Future aracFuture;
  Arac arac;
  @override
  void initState() {
    super.initState();

    aracFuture = _aracGetir();
  }

  _aracGetir() async {
    return await DBHelper().getArac();
  }

  var buton = button1();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF2C2C32),
        body: SafeArea(
            child: FutureBuilder(
                future: aracFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    this.arac = snapshot.data;
                    return yakitAlmaEkrani();
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));

    throw UnimplementedError();
  }

  yakitAlmaEkrani() {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C32),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Araclar(),
                            ),
                          );
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/backButton.png"))),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        child: Text(
                          "Yakıt Aldığında",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "GrotesklyYours",
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                        child: Text(
                          "Aracın Verilerine Erişebilirsin",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "GrotesklyYours",
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 30),
                decoration: BoxDecoration(
                  color: Colors.green,
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
                          this.buton = button1();
                        });
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            backgroundColor: Colors.white,
                            content: Text(
                              "Depo Tam Dolduruldu Mu?",
                              style: TextStyle(
                                  fontFamily: "GrotesklyYours",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
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
                        margin:
                            EdgeInsets.only(right: 15, left: 15, bottom: 25),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: Column(
                              children: [
                                Expanded(child: Container()),
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("assets/images/gas1.png"),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: Text(
                                    "Yakıt Aldım",
                                    style: TextStyle(
                                        fontFamily: "GrotesklyYours",
                                        fontSize: 40),
                                  ),
                                ),
                                Expanded(child: Container()),
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
            ],
          ),
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
