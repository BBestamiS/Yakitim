import 'package:flutter/material.dart';
import 'package:yatitimveritabani2/ekranlar/anaEkran.dart';

class YakitAldim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C32),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Yakıt Aldım",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "GrotesklyYours",
                              fontSize: 15,
                              color: Colors.white,
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
                                  builder: (context) => AnaEkran(),
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text(
                              "Yakıtın Litre Fiyatı",
                              style: TextStyle(
                                fontSize: 20,
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "Kaç Litre Alındı",
                              style: TextStyle(
                                fontSize: 20,
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "Araç Kilometresi",
                              style: TextStyle(
                                fontSize: 20,
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
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  print("tıklandı");
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25.0)),
                  margin: EdgeInsets.only(
                      left: 90.0, right: 90.0, bottom: 15.0, top: 40),
                  height: 50.0,
                  child: Center(
                    child: Text(
                      "Tamam",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "GrotesklyYours",
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
