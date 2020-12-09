class Arac {
  int id;
  String marka;
  String model;
  String plaka;
  int kilometre;
  String yakittipi;
  int depohacmi;
  double motorhacmi;
  double birinciyakitfiyat;
  double birinciyakitlitre;
  int birincikilometre;

  double ikinciyakitfiyat;
  double ikinciyakitlitre;
  int ikincikilometre;

  double ucuncuyakitfiyat;
  double ucuncuyakitlitre;
  int ucuncukilometre;

  double dorduncuyakitfiyat;
  double dorduncuyakitlitre;
  int dorduncukilometre;

  double besinciyakitfiyat;
  double besinciyakitlitre;
  int besincikilometre;
  double aylikyakit;
  int tarih;
  double toplamlira;
  double toplamlitre;
  int sonkilometre;

  Arac();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'marka': marka,
      'model': model,
      'plaka': plaka,
      'kilometre': kilometre,
      'yakittipi': yakittipi,
      'depohacmi': depohacmi,
      'motorhacmi': motorhacmi,
      'birinciyakitfiyat': birinciyakitfiyat,
      'birinciyakitlitre': birinciyakitlitre,
      'birincikilometre': birincikilometre,
      'ikinciyakitfiyat': ikinciyakitfiyat,
      'ikinciyakitlitre': ikinciyakitlitre,
      'ikincikilometre': ikincikilometre,
      'ucuncuyakitfiyat': ucuncuyakitfiyat,
      'ucuncuyakitlitre': ucuncuyakitlitre,
      'ucuncukilometre': ucuncukilometre,
      'dorduncuyakitfiyat': dorduncuyakitfiyat,
      'dorduncuyakitlitre': dorduncuyakitlitre,
      'dorduncukilometre': dorduncukilometre,
      'besinciyakitfiyat': besinciyakitfiyat,
      'besinciyakitlitre': besinciyakitlitre,
      'besincikilometre': besincikilometre,
      'aylikyakit': aylikyakit,
      'tarih': tarih,
      'toplamlira': toplamlira,
      'toplamlitre': toplamlitre,
      'sonkilometre': sonkilometre,
    };
    return map;
  }

  Arac.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    marka = map['marka'];
    model = map['model'];
    plaka = map['plaka'];
    kilometre = map['kilometre'];
    yakittipi = map['yakittipi'];
    depohacmi = map['depohacmi'];
    motorhacmi = map['motorhacmi'];
    birinciyakitfiyat = map['birinciyakitfiyat'];
    birinciyakitlitre = map['birinciyakitlitre'];
    birincikilometre = map['birincikilometre'];
    ikinciyakitfiyat = map['ikinciyakitfiyat'];
    ikinciyakitlitre = map['ikinciyakitlitre'];
    ikincikilometre = map['ikincikilometre'];
    ucuncuyakitfiyat = map['ucuncuyakitfiyat'];
    ucuncuyakitlitre = map['ucuncuyakitlitre'];
    ucuncukilometre = map['ucuncukilometre'];

    dorduncuyakitfiyat = map['dorduncuyakitfiyat'];
    dorduncuyakitlitre = map['dorduncuyakitlitre'];
    dorduncukilometre = map['dorduncukilometre'];
    besinciyakitfiyat = map['besinciyakitfiyat'];
    besinciyakitlitre = map['besinciyakitlitre'];
    besincikilometre = map['besincikilometre'];
    aylikyakit = map['aylikyakit'];
    tarih = map['tarih'];
    toplamlira = map['toplamlira'];
    toplamlitre = map['toplamlitre'];
    sonkilometre = map['sonkilometre'];
  }
}
