import 'package:flutter/material.dart';
import 'package:yakitim/ekranlar/anaEkran.dart';
import 'package:yakitim/ekranlar/aracEkle.dart';
import 'package:yakitim/modeller/arac.dart';
import 'package:yakitim/utils/database_helper.dart';

class Araclar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Araclar();
  }
}

class _Araclar extends State {
  List<Arac> _araclar = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C32),
      body: SafeArea(
        child: Column(
          children: [
            _AppBar(),
            _List(),
          ],
        ),
      ),
    );
  }

  _AppBar() {
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Araçlarım",
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
                        image: AssetImage("assets/images/backButton.png"),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AracEkle(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 15, right: 10),
                    height: 25,
                    width: 25,
                    child: Center(
                      child: Image(
                        image: AssetImage("assets/images/plus.png"),
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
  }

  _List() {
    return Expanded(
      child: Card(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(""),
              ],
            );
          },
        ),
      ),
    );
  }
}
