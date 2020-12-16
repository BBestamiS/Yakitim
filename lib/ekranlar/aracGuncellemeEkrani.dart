import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yakitim/database/database.dart';
import 'package:yakitim/ekranlar/anaEkran.dart';
import 'package:yakitim/ekranlar/araclarimEkrani.dart';
import 'package:yakitim/modeller/arac.dart';
import 'package:yakitim/modeller/secim.dart';

class AracGuncelleme extends StatefulWidget {
  Arac arac;
  AracGuncelleme({this.arac});
  @override
  _AracGuncelleme createState() => _AracGuncelleme();
}

class _AracGuncelleme extends State<AracGuncelleme> {
  Secim secim = new Secim();
  DBHelper dbHelper;
  List<Arac> araclar = [];
  bool _validate = false;
  Arac arac = new Arac();
  int yakitTipiDeger;
  int motorHacmiDeger;
  final _marka = TextEditingController();
  final _model = TextEditingController();
  final _plaka = TextEditingController();
  final _depoHacmi = TextEditingController();
  final _kilometresi = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    setText();
  }

  setText() {
    this.arac = widget.arac;
    _marka.text = arac.marka;
    _model.text = arac.model;
    _plaka.text = arac.plaka;
    yakitTipiDeger = yakitTipiValue(arac.yakittipi);
    _depoHacmi.text = arac.depohacmi.toString();
    motorHacmiDeger = motorHacmiValue(arac.motorhacmi);
    _kilometresi.text = arac.kilometre.toString();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color(0xFF2C2C32),
        body: aracEklee(),
      ),
    );
    throw UnimplementedError();
  }

  aracEklee() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 40, right: 40),
                          child: AutoSizeText(
                            "Araç Güncelleme",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "GrotesklyYours",
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
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
                                builder: (context) => Araclar(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 15, left: 10),
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Image(
                                image:
                                    AssetImage("assets/images/backButton.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "Markası",
                            style: TextStyle(
                              fontSize: 17,
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
                          controller: _marka,
                          decoration: InputDecoration(
                            errorText: _validate ? "Bu Alan Boş Kalamaz" : null,
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
                          child: Text(
                            "Modeli",
                            style: TextStyle(
                              fontSize: 17,
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
                          controller: _model,
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
                          child: Text(
                            "Plakası",
                            style: TextStyle(
                              fontSize: 17,
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
                          controller: _plaka,
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
                          child: Text(
                            "Kilometresi",
                            style: TextStyle(
                              fontSize: 17,
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
                          controller: _kilometresi,
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            "Depo Hacmi",
                            style: TextStyle(
                              fontSize: 17,
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
                          controller: _depoHacmi,
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
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 7),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Text(
                                        "Motor Hacmi",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "GrotesklyYours",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: 1000,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.grey[350],
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            value: motorHacmiDeger,
                                            items: [
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.0 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 2),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.2 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 6),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.3 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 3),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.4 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 4),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.5 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 5),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.6 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 1),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.7 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 7),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.8 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 8),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "1.9 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 9),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "2.0 Litre",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 10),
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                motorHacmiDeger = value;
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 7),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Text(
                                        "Yakıt Tipi",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "GrotesklyYours",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: 1000,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.grey[350],
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            value: yakitTipiDeger,
                                            items: [
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "Dizel",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 2),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "Benzin",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 1),
                                              DropdownMenuItem(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "LPG",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "GrotesklyYours",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  value: 3),
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                yakitTipiDeger = value;
                                              });
                                            }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                this.arac.marka = _marka.text;
                this.arac.model = _model.text;
                this.arac.plaka = _plaka.text;
                this.arac.kilometre = int.parse(_kilometresi.text);
                this.arac.yakittipi = yakiTipiSecim(yakitTipiDeger);
                this.arac.depohacmi = int.parse(_depoHacmi.text);
                this.arac.motorhacmi = motorHacmiSecim(motorHacmiDeger);
                print("Arac idsi " + arac.id.toString());
                dbHelper.aracUpdate(this.arac);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Araclar(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25.0)),
                margin: EdgeInsets.only(
                    left: 60.0, right: 60.0, bottom: 15.0, top: 40),
                height: 40.0,
                child: Center(
                  child: Text(
                    "Aracı Güncelle",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String yakiTipiSecim(int deger) {
    if (deger == 1) {
      return "benzin";
    } else if (deger == 2) {
      return "dizel";
    } else {
      return "lpg";
    }
  }

  double motorHacmiSecim(int deger) {
    if (deger == 1) {
      return 1.6;
    } else if (deger == 2) {
      return 1.0;
    } else if (deger == 3) {
      return 1.3;
    } else if (deger == 4) {
      return 1.4;
    } else if (deger == 5) {
      return 1.5;
    } else if (deger == 6) {
      return 1.2;
    } else if (deger == 7) {
      return 1.7;
    } else if (deger == 8) {
      return 1.8;
    } else if (deger == 9) {
      return 1.9;
    } else {
      return 2.0;
    }
  }

  int yakitTipiValue(String yakitTipi) {
    if (yakitTipi == "benzin") {
      return 1;
    } else if (yakitTipi == "dizel") {
      return 2;
    } else {
      return 3;
    }
  }

  int motorHacmiValue(double motorHacmi) {
    if (motorHacmi == 1.6) {
      return 1;
    } else if (motorHacmi == 1.0) {
      return 2;
    } else if (motorHacmi == 1.3) {
      return 3;
    } else if (motorHacmi == 1.4) {
      return 4;
    } else if (motorHacmi == 1.5) {
      return 5;
    } else if (motorHacmi == 1.2) {
      return 6;
    } else if (motorHacmi == 1.7) {
      return 7;
    } else if (motorHacmi == 1.8) {
      return 8;
    } else if (motorHacmi == 1.9) {
      return 9;
    } else {
      return 10;
    }
  }
}
