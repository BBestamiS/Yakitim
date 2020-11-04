import 'package:flutter/material.dart';
import 'package:yakitim/ekranlar/araclar.dart';
import 'package:yakitim/modeller/arac.dart';
import 'package:yakitim/utils/database_helper.dart';

class AracEkle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AracEkle();
  }
}

class _AracEkle extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Text(
                            "Aracınızın Verilerini Giriniz",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontFamily: "GrotesklyYours",
                                fontWeight: FontWeight.bold),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Araclar(),
                    ),
                  );
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
    );
    throw UnimplementedError();
  }
}
