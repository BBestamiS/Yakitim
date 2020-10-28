import 'package:flutter/material.dart';

class AracEkle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                          padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                          child: Text(
                            "Aracının Verilerini Öğrenmek İçin Sabırsızlanıyorum.",
                            style:
                                TextStyle(fontSize: 25, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              labelText: "Markası Ve Modeli",
                              labelStyle: TextStyle(
                                fontFamily: "EslGothicUnicode",
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.orange))),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: "Plakası",
                              labelStyle: TextStyle(
                                fontFamily: "EslGothicUnicode",
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.orange))),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: "Yakıt Tipi",
                              labelStyle: TextStyle(
                                fontFamily: "EslGothicUnicode",
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.orange))),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: "Motor Hacmi",
                              labelStyle: TextStyle(
                                fontFamily: "EslGothicUnicode",
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.orange))),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 7.0),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: "Yakıt Depo Hacmi",
                                      labelStyle: TextStyle(
                                        fontFamily: "EslGothicUnicode",
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.orange))),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 7.0),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: "Kilometresi",
                                      labelStyle: TextStyle(
                                        fontFamily: "EslGothicUnicode",
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.orange))),
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
                  print("tıklandı");
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      color: Colors.blueGrey,
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
