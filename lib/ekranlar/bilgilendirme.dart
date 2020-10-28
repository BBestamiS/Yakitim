import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yakitim/ekranlar/aracEkle.dart';

class Bilgilendirme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 25),
                    child: Text(
                      "Merhaba",
                      style: TextStyle(fontSize: 55),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 245),
                    child: Text(
                      ".",
                      style: TextStyle(fontSize: 65, color: Colors.green),
                    ),
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(15.0)),
              margin: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
              child: Center(
                child: Text(
                  "Yakıtım uygulamasını hoşgeldin. Yakıtım olarak aracının detaylı bilgilerinin tutmak ve istediğin zaman göstermek için programlandım. Benimle vakit geçirmen için sabırsızlanıyorum. Aracını tanıtarak uygulamayı kullanmaya başlayabilirsin...",
                  style: TextStyle(fontFamily: "EslGothicUnicode"),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(15.0)),
              margin: EdgeInsets.only(left: 40.0, right: 40.0),
              child: Center(
                child: Text(
                  "Not: Araç kayıt ederken, aracınızın deposu dolu olmalıdır. Aksi halde bazı değerlerde yanlışlık olabilir.",
                  style: TextStyle(
                      fontFamily: "EslGothicUnicode",
                      color: Colors.green,
                      fontSize: 12),
                ),
              ),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AracEkle(),
                  ),
                );
              },
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  height: 40,
                  margin: EdgeInsets.only(left: 60, right: 60, bottom: 10),
                  child: Container(
                    child: Stack(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                                margin: EdgeInsets.only(),
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/ok.png",
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
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
