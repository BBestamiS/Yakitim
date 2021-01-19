import 'package:flutter/material.dart';
import 'package:yakitim/database/database.dart';
import 'package:yakitim/ekranlar/anaEkran.dart';
import 'package:yakitim/modeller/secim.dart';

class AyarlarEkrani extends StatefulWidget {
  @override
  _AyarlarEkraniState createState() => _AyarlarEkraniState();
}

class _AyarlarEkraniState extends State<AyarlarEkrani> {
  DBHelper dbHelper;
  Future secimFuture;
  Secim secim;
  String boxSekil1 = "yuzKilometre";
  String boxSekil2 = "liraKilometre";
  String boxSekil3 = "kilometreLitre";
  String boxSekil4 = "sonYakit";
  String boxSekil5 = "yuzKilometreOrtalama";
  String boxSekil6 = "liraKilometreOrtalama";
  String boxSekil7 = "aracKilometre";
  String boxSekil8 = "geneldeAlinanYakit";
  String boxSekil9 = "tahminiMenil";
  String boxSekil10 = "gecenAyAlinanYakit";
  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    secimFuture = _secimGetir();
  }

  _secimGetir() async {
    return await DBHelper().getSecim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C32),
      body: FutureBuilder(
          future: secimFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              this.secim = snapshot.data;

              return ayarlarEkrani();
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
    throw UnimplementedError();
  }

  ayarlarEkrani() {
    print(secim.kontrol.toString());
    return Center(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 70,
              left: 25,
            ),
            child: Text(
              "Ayarlar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 55,
                fontFamily: "GrotesklyYours",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60, left: 220),
            child: Text(
              ".",
              style: TextStyle(
                fontSize: 65,
                color: Colors.green,
                fontFamily: "GrotesklyYours",
                fontWeight: FontWeight.bold,
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
                    builder: (context) => AnaEkran(
                      secim: this.secim,
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 25, top: 50),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/backButton.png"),
                )),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Ana Ekranda Bulunmasını İstediklerini İşaretle",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontFamily: "GrotesklyYours",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                secimKontrol(boxSekil1);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                height: 50,
                                decoration: boxsekil(boxSekil1),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            child: Text(
                                              "Litre/100km",
                                              style: TextStyle(
                                                  fontFamily: "GrotesklyYours",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                secimKontrol(boxSekil2);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                height: 50,
                                decoration: boxsekil(boxSekil2),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            child: Text(
                                              "TL/km",
                                              style: TextStyle(
                                                  fontFamily: "GrotesklyYours",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                secimKontrol(boxSekil3);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                height: 50,
                                decoration: boxsekil(boxSekil3),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            child: Text(
                                              "km/Litre",
                                              style: TextStyle(
                                                  fontFamily: "GrotesklyYours",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                secimKontrol(boxSekil4);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                height: 50,
                                decoration: boxsekil(boxSekil4),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            child: Text(
                                              "Son Alınan Yakıt",
                                              style: TextStyle(
                                                  fontFamily: "GrotesklyYours",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                secimKontrol(boxSekil5);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                height: 50,
                                decoration: boxsekil(boxSekil5),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            child: Text(
                                              "Litre/100km Ortalama",
                                              style: TextStyle(
                                                  fontFamily: "GrotesklyYours",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                secimKontrol(boxSekil6);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                height: 50,
                                decoration: boxsekil(boxSekil6),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            child: Text(
                                              "TL/km Ortalama",
                                              style: TextStyle(
                                                  fontFamily: "GrotesklyYours",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                secimKontrol(boxSekil8);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                height: 50,
                                decoration: boxsekil(boxSekil8),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            child: Text(
                                              "Genelde Alınan Yakıt",
                                              style: TextStyle(
                                                  fontFamily: "GrotesklyYours",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                secimKontrol(boxSekil7);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                height: 50,
                                decoration: boxsekil(boxSekil7),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            child: Text(
                                              "Araç Kilometresi",
                                              style: TextStyle(
                                                  fontFamily: "GrotesklyYours",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                secimKontrol(boxSekil9);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                height: 50,
                                decoration: boxsekil(boxSekil9),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            child: Text(
                                              "Tahmini Menzil",
                                              style: TextStyle(
                                                  fontFamily: "GrotesklyYours",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                secimKontrol(boxSekil10);
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                height: 50,
                                decoration: boxsekil(boxSekil10),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            child: Text(
                                              "Geçen Ay Alınan Yakıt",
                                              style: TextStyle(
                                                  fontFamily: "GrotesklyYours",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              dbHelper.secimUpdate(this.secim);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnaEkran(
                    secim: this.secim,
                  ),
                ),
              );
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(left: 50, right: 50, bottom: 40),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                  child: Text(
                    "Kaydet",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  secimKontrol(String sekil) {
    if (this.secim.birinciEkran == sekil) {
      this.secim.kontrol--;
      this.secim.birinciEkran = null;
      setState(() {});
    } else if (this.secim.ikinciEkran == sekil) {
      this.secim.kontrol--;
      this.secim.ikinciEkran = null;
      setState(() {});
    } else if (this.secim.ucunucuEkran == sekil) {
      this.secim.kontrol--;
      this.secim.ucunucuEkran = null;
      setState(() {});
    } else if (this.secim.dordunucuEkran == sekil) {
      this.secim.kontrol--;
      this.secim.dordunucuEkran = null;
      setState(() {});
    } else {
      if (this.secim.kontrol < 4) {
        this.secim.kontrol++;
        print("arttırıldı");
        if (this.secim.birinciEkran == null) {
          this.secim.birinciEkran = sekil;
          setState(() {});
        } else if (this.secim.ikinciEkran == null) {
          this.secim.ikinciEkran = sekil;
          setState(() {});
        } else if (this.secim.ucunucuEkran == null) {
          this.secim.ucunucuEkran = sekil;
          setState(() {});
        } else {
          this.secim.dordunucuEkran = sekil;
          setState(() {});
        }
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: Colors.white,
            content: Container(
              height: 30,
              child: Column(
                children: [
                  Text(
                    "En Fazla 4 Özellik Gösterilebilir",
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
                ],
              )
            ],
          ),
          barrierDismissible: false,
        );
      }
    }
  }

  boxsekil(String sekil) {
    if (this.secim.birinciEkran == sekil ||
        this.secim.ikinciEkran == sekil ||
        this.secim.ucunucuEkran == sekil ||
        this.secim.dordunucuEkran == sekil) {
      return BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey[600], spreadRadius: 2, blurRadius: 5)
          ]);
    } else {
      return BoxDecoration(
          color: Color(0xFFfff3e6), borderRadius: BorderRadius.circular(10));
    }
  }
}
