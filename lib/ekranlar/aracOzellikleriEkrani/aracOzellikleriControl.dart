import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yakitim/ekranlar/aracOzellikleriEkrani/aracBilgileriEkrani.dart';
import 'package:yakitim/ekranlar/aracOzellikleriEkrani/maliyetEkrani.dart';
import 'package:yakitim/ekranlar/aracOzellikleriEkrani/yak%C4%B1tBilgileriEkrani.dart';
import 'package:yakitim/modeller/arac.dart';

class AracOzellikleriControl extends StatefulWidget {
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

  Arac arac;
  AracOzellikleriControl({this.arac});
  @override
  _AracOzellikleriControlState createState() => _AracOzellikleriControlState();
}

class _AracOzellikleriControlState extends State<AracOzellikleriControl> {
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
            YakitEkrani1(
              arac: widget.arac,
            ),
            AracOzellikleriEkrani2(
              arac: widget.arac,
            ),
            MaliyetEkrani3(
              arac: widget.arac,
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}

class YakitEkrani1 extends StatefulWidget {
  Arac arac;
  YakitEkrani1({this.arac});
  @override
  _YakitEkrani1State createState() => _YakitEkrani1State();
}

class _YakitEkrani1State extends State<YakitEkrani1> {
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
            YakitEkrani2(
              arac: widget.arac,
            ),
            YakitEkrani3(
              arac: widget.arac,
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}

class MaliyetEkrani3 extends StatefulWidget {
  Arac arac;
  MaliyetEkrani3({this.arac});
  @override
  _MaliyetEkrani3State createState() => _MaliyetEkrani3State();
}

class _MaliyetEkrani3State extends State<MaliyetEkrani3> {
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
            MaliyetEkrani4(
              arac: widget.arac,
            ),
            MaliyetEkrani5(
              arac: widget.arac,
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
