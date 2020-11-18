class Secim {
  int id;
  int secim;
  Secim();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'secim': secim,
    };
    return map;
  }

  Secim.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    secim = map['secim'];
  }
}
