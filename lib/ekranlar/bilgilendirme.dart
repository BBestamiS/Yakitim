import 'package:auto_size_text/auto_size_text.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yakitim/ekranlar/aracEkle.dart';

class Bilgilendirme extends StatefulWidget {
  int sayi;
  Bilgilendirme({this.sayi});
  @override
  _BilgilendirmeState createState() => _BilgilendirmeState();
}

class _BilgilendirmeState extends State<Bilgilendirme> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: ekranSecim(),
      children: [
        Bilgilendirme1(),
        Bilgilendirme2(),
        Bilgilendirme3(),
        Bilgilendirme4(),
        Bilgilendirme5(),
      ],
    );
    throw UnimplementedError();
  }

  ekranSecim() {
    if (widget.sayi == 1) {
      return PageController(
        initialPage: 4,
      );
    } else {
      return PageController(
        initialPage: 0,
      );
    }
  }
}

class Bilgilendirme1 extends StatefulWidget {
  @override
  _Bilgilendirme1State createState() => _Bilgilendirme1State();
}

class _Bilgilendirme1State extends State<Bilgilendirme1> {
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
                    "Yakıtım uygulamasına hoşgeldin. Yakıtım olarak aracının detaylı bilgilerini tutmak ve istediğin zaman göstermek için programlandım. Hızlı bir tanıtımdan sonra beni kullanmaya başlayabilirsin.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: "GrotesklyYours",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 150,
                child: AspectRatio(
                  aspectRatio: 378 / 187,
                  child: Container(
                    child: FlareActor(
                      "assets/animations/bilgilendirme.flr",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      artboard: "kaydirma",
                      animation: "ilkEkran",
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

class Bilgilendirme2 extends StatefulWidget {
  @override
  _Bilgilendirme2State createState() => _Bilgilendirme2State();
}

class _Bilgilendirme2State extends State<Bilgilendirme2> {
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
                    margin: EdgeInsets.only(top: 22, left: 25),
                    child: Text(
                      "Ana Ekran",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
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
                child: Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  child: FlareActor(
                    "assets/animations/bilgilendirme.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    artboard: "anaEkran",
                    animation: "anaEkranButon",
                  ),
                ),
              ),
            )),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: Text(
                  "Ortada bulunan büyük butona bastığında aracının bazı özelliklerini görebilirsin. Basılı tuttuğunda butonda ki yazıları düzenleyebilirsin.",
                  style: TextStyle(
                    color: Colors.orange,
                    fontFamily: "GrotesklyYours",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 100,
                child: AspectRatio(
                  aspectRatio: 378 / 187,
                  child: Container(
                    child: FlareActor(
                      "assets/animations/bilgilendirme.flr",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      artboard: "kaydirma",
                      animation: "ortaEkran",
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

class Bilgilendirme3 extends StatefulWidget {
  @override
  _Bilgilendirme3State createState() => _Bilgilendirme3State();
}

class _Bilgilendirme3State extends State<Bilgilendirme3> {
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
                    margin: EdgeInsets.only(top: 44, left: 25),
                    child: Text(
                      "Araç Özellikleri",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
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
                child: Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  child: FlareActor(
                    "assets/animations/bilgilendirme.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    artboard: "aracOzellikleri",
                    animation: "aracOzellikleri",
                  ),
                ),
              ),
            )),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: Text(
                  "Araç özellikleri ekranını sağa sola kaydırarak Maliyet ve Yakıt ekranlarına geçiş yapabilirsin.",
                  style: TextStyle(
                    color: Colors.orange,
                    fontFamily: "GrotesklyYours",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 100,
                child: AspectRatio(
                  aspectRatio: 378 / 187,
                  child: Container(
                    child: FlareActor(
                      "assets/animations/bilgilendirme.flr",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      artboard: "kaydirma",
                      animation: "ortaEkran",
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

class Bilgilendirme4 extends StatefulWidget {
  @override
  _Bilgilendirme4State createState() => _Bilgilendirme4State();
}

class _Bilgilendirme4State extends State<Bilgilendirme4> {
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
                    margin: EdgeInsets.only(top: 20, left: 25),
                    child: Text(
                      "Araçlarım",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
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
                child: Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  child: FlareActor(
                    "assets/animations/bilgilendirme.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    artboard: "araclarim",
                    animation: "araclarim",
                  ),
                ),
              ),
            )),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: Text(
                  "Araçlarım ekranında yeni araç ekleyebilir, araçların arasında geçiş yapabilir, istediğin aracı silebilir ve araçlarını güncelleyebilirsin.",
                  style: TextStyle(
                    color: Colors.orange,
                    fontFamily: "GrotesklyYours",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 100,
                child: AspectRatio(
                  aspectRatio: 378 / 187,
                  child: Container(
                    child: FlareActor(
                      "assets/animations/bilgilendirme.flr",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      artboard: "kaydirma",
                      animation: "ortaEkran",
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

class Bilgilendirme5 extends StatefulWidget {
  @override
  _Bilgilendirme5State createState() => _Bilgilendirme5State();
}

class _Bilgilendirme5State extends State<Bilgilendirme5> {
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
                    margin: EdgeInsets.only(top: 27, left: 25),
                    child: Text(
                      "Başlayalım",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
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
                child: Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  child: FlareActor(
                    "assets/animations/bilgilendirme.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    artboard: "yakitAlma",
                    animation: "yakitAlma",
                  ),
                ),
              ),
            )),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 25),
                child: Text(
                  "Aracınızı tanıtmadan önce depoyu tam doldurmanız gerekiyor!",
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: "GrotesklyYours",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AracEkle(
                        sayi: 1,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 60, right: 60, bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Araç Ekle",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "GrotesklyYours",
                          fontWeight: FontWeight.bold),
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
