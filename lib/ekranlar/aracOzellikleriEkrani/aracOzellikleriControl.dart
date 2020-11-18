import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yatitimveritabani2/ekranlar/aracOzellikleriEkrani/aracBilgileriEkrani.dart';
import 'package:yatitimveritabani2/ekranlar/aracOzellikleriEkrani/maliyetEkrani.dart';
import 'package:yatitimveritabani2/ekranlar/aracOzellikleriEkrani/yak%C4%B1tBilgileriEkrani.dart';

class AracOzellikleriControl extends StatelessWidget {
  final controller = PageController(
    initialPage: 1,
  );
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: [
            YakitEkrani1(),
            AracOzellikleriEkrani2(),
            MaliyetEkrani3(),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }

  bilgiler(String bilgi1, String bilgi2) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        right: 3,
        left: 3,
      ),
      child: Row(
        children: [
          Expanded(child: Container()),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: AutoSizeText(
                    "$bilgi1",
                    style:
                        TextStyle(fontFamily: "GrotesklyYours", fontSize: 55),
                    maxLines: 1,
                  ))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  child: AutoSizeText(
                "$bilgi2",
                style: TextStyle(
                    fontFamily: "GrotesklyYours",
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black87),
              ))),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}

class YakitEkrani1 extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: [
            YakitEkrani2(),
            YakitEkrani3(),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}

class MaliyetEkrani3 extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: [
            MaliyetEkrani4(),
            MaliyetEkrani5(),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
