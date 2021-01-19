class Secim {
  int id;
  int secim;
  int kontrol;
  String birinciEkran;
  String ikinciEkran;
  String ucunucuEkran;
  String dordunucuEkran;
  Secim();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'secim': secim,
      'kontrol': kontrol,
      'birinciEkran': birinciEkran,
      'ikinciEkran': ikinciEkran,
      'ucunucuEkran': ucunucuEkran,
      'dordunucuEkran': dordunucuEkran,
    };
    return map;
  }

  Secim.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    secim = map['secim'];
    kontrol = map['kontrol'];
    birinciEkran = map['birinciEkran'];
    ikinciEkran = map['ikinciEkran'];
    ucunucuEkran = map['ucunucuEkran'];
    dordunucuEkran = map['dordunucuEkran'];
  }
}
