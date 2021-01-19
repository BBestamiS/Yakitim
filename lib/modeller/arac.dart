class Arac {
  int id;
  String marka;
  String model;
  String plaka;
  int kilometre;
  String yakittipi;
  int depohacmi;
  double motorhacmi;
  int aracinyili;
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
  double birinciFiyat;
  double birinciLitre;
  double ikinciFiyat;
  double ikinciLitre;
  double ucuncuFiyat;
  double ucuncuLitre;
  double dorduncuFiyat;
  double dorduncuLitre;
  double besinciFiyat;
  double besinciLitre;
  int motorisigi;

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
      'birinciFiyat': birinciFiyat,
      'ikinciFiyat': ikinciFiyat,
      'ucuncuFiyat': ucuncuFiyat,
      'dorduncuFiyat': dorduncuFiyat,
      'besinciFiyat': besinciFiyat,
      'birinciLitre': birinciLitre,
      'ikinciLitre': ikinciLitre,
      'ucuncuLitre': ucuncuLitre,
      'dorduncuLitre': dorduncuLitre,
      'besinciLitre': besinciLitre,
      'motorisigi': motorisigi,
      'aracinyili': aracinyili,
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
    aracinyili = map['aracinyili'];
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
    birinciFiyat = map['birinciFiyat'];
    ikinciFiyat = map['ikinciFiyat'];
    ucuncuFiyat = map['ucuncuFiyat'];
    dorduncuFiyat = map['dorduncuFiyat'];
    besinciFiyat = map['besinciFiyat'];
    birinciLitre = map['birinciLitre'];
    ikinciLitre = map['ikinciLitre'];
    ucuncuLitre = map['ucuncuLitre'];
    dorduncuLitre = map['dorduncuLitre'];
    besinciLitre = map['besinciLitre'];
    motorisigi = map['motorisigi'];
  }
}
