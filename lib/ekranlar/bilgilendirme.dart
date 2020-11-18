import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yatitimveritabani2/ekranlar/aracEkle.dart';

class Bilgilendirme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C32),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 25),
                    child: Text(
                      "Merhaba",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontFamily: "GrotesklyYours",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3, left: 265),
                    child: Text(
                      ".",
                      style: TextStyle(
                        fontSize: 65,
                        color: Colors.green,
                        fontFamily: "GrotesklyYours",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
                child: Center(
                  child: AutoSizeText(
                    "Yakıtım uygulamasına hoşgeldin. Yakıtım olarak aracının detaylı bilgilerini tutmak ve istediğin zaman göstermek için programlandım. Benimle vakit geçirmen için sabırsızlanıyorum. Aracını tanıtarak uygulamayı kullanmaya başlayabilirsin...",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: "GrotesklyYours",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20),
              child: Center(
                child: AutoSizeText(
                  "Not: Araç kayıt ederken, aracınızın deposu dolu olmalıdır. Aksi halde bazı değerlerde yanlışlık olabilir.",
                  style: TextStyle(
                      fontFamily: "GrotesklyYours",
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 12),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AracEkle(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25),
                ),
                height: 40,
                margin: EdgeInsets.only(left: 60, right: 60, bottom: 10),
                child: Container(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                            margin: EdgeInsets.only(),
                            child: Image(
                              image: AssetImage(
                                "assets/images/ok.png",
                              ),
                            )),
                      ),
                    ],
                  ),
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
