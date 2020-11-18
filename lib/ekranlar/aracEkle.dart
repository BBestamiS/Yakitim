import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yatitimveritabani2/database/database.dart';
import 'package:yatitimveritabani2/ekranlar/araclarimEkrani.dart';
import 'package:yatitimveritabani2/modeller/arac.dart';
import 'package:yatitimveritabani2/modeller/secim.dart';

class AracEkle extends StatefulWidget {
  @override
  _AracEkle createState() => _AracEkle();
}

class _AracEkle extends State {
  Secim secim = new Secim();
  List<Arac> araclar = new List();
  bool _validate = false;
  DBHelper dbHelper;
  Arac arac = new Arac();
  final _marka = TextEditingController();
  final _model = TextEditingController();
  final _plaka = TextEditingController();
  final _yakitTipi = TextEditingController();
  final _depoHacmi = TextEditingController();
  final _motorHacmi = TextEditingController();
  final _kilometresi = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    araclariYenile();
  }

  araclariYenile() {
    dbHelper.getAraclar().then((value) {
      setState(() {
        araclar = dbHelper.getAraclarr();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color(0xFF2C2C32),
        body: SafeArea(
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
                              margin:
                                  EdgeInsets.only(top: 10, left: 40, right: 40),
                              child: AutoSizeText(
                                "Aracınızın Verilerini Giriniz",
                                style: TextStyle(
                                    fontSize: 25,
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
                                    image: AssetImage(
                                        "assets/images/backButton.png"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
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
                                errorText:
                                    _validate ? "Bu Alan Boş Kalamaz" : null,
                                contentPadding:
                                    EdgeInsets.only(left: 8, right: 8),
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
                                contentPadding:
                                    EdgeInsets.only(left: 8, right: 8),
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
                                contentPadding:
                                    EdgeInsets.only(left: 8, right: 8),
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
                          Container(
                            height: 48,
                            child: TextField(
                              controller: _yakitTipi,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 8, right: 8),
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
                                contentPadding:
                                    EdgeInsets.only(left: 8, right: 8),
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
                                      Container(
                                        height: 48,
                                        child: TextField(
                                          controller: _motorHacmi,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 8, right: 8),
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
                                            contentPadding: EdgeInsets.only(
                                                left: 8, right: 8),
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
                    setState(() {
                      if (this.araclar.isEmpty) {
                        this.arac.marka = _marka.text;
                        this.arac.model = _model.text;
                        this.arac.plaka = _plaka.text;
                        this.arac.kilometre = int.parse(_kilometresi.text);
                        this.arac.yakittipi = _yakitTipi.text;
                        this.arac.depohacmi = int.parse(_depoHacmi.text);
                        this.arac.motorhacmi = double.parse(_motorHacmi.text);
                        dbHelper.aracEkle(this.arac).then((value) {
                          dbHelper.getAraclar().then((value) {
                            this.araclar = dbHelper.getAraclarr();
                            this.secim.secim = this.araclar[0].id;
                            dbHelper.secimEkle(this.secim);
                          });
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Araclar(),
                          ),
                        );
                      } else {
                        this.arac.marka = _marka.text;
                        this.arac.model = _model.text;
                        this.arac.plaka = _plaka.text;
                        this.arac.kilometre = int.parse(_kilometresi.text);
                        this.arac.yakittipi = _yakitTipi.text;
                        this.arac.depohacmi = int.parse(_depoHacmi.text);
                        this.arac.motorhacmi = double.parse(_motorHacmi.text);
                        dbHelper.aracEkle(this.arac);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Araclar(),
                          ),
                        );
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(25.0)),
                    margin: EdgeInsets.only(
                        left: 60.0, right: 60.0, bottom: 15.0, top: 40),
                    height: 40.0,
                    child: Center(
                      child: Text(
                        "Aracı Ekle",
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
        ),
      ),
    );
    throw UnimplementedError();
  }
}
