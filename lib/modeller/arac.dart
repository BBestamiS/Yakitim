class Arac {
  // static const tblArac = "araclar";
  // static const colId = "araclar";
  // static const colMarka = "araclar";
  // static const colModel = "araclar";
  // static const colPlaka = "araclar";
  // static const colYakitTipi = "araclar";
  // static const colDepoHacmi = "araclar";
  // static const colMotorHacmi = "araclar";
  // static const colKilometre = "araclar";

  Arac(
      {this.id,
      this.marka,
      this.model,
      this.plaka,
      this.yakitTipi,
      this.depoHacmi,
      this.motorHacmi,
      this.kilometresi});

  Arac.fromMap(Map<String, dynamic> map) {
    marka = map[marka];
    model = map[model];
    plaka = map[plaka];
    yakitTipi = map[yakitTipi];
    depoHacmi = map[depoHacmi];
    motorHacmi = map[motorHacmi];
    kilometresi = map[kilometresi];
  }

  int id;
  String marka;
  String model;
  String plaka;
  String yakitTipi;
  int depoHacmi;
  double motorHacmi;
  int kilometresi;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["marka"] = marka;
    map["model"] = model;
    map["plaka"] = plaka;
    map["yakitTipi"] = yakitTipi;
    map["motorHacmi"] = motorHacmi;
    map["kilometresi"] = kilometresi;

    return map;
  }
}
