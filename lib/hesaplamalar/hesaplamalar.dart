import 'package:yakitim/modeller/arac.dart';

class Hesaplamalar {
  Arac arac;
  Hesaplamalar({this.arac});
  double yuzKilometreYakitLitre() {
    double litre;
    litre = arac.besinciyakitlitre / (arac.besincikilometre / 100);
    return litre;
  }

  double yuzKilometreOrtalamaYakitLitre(double yakit, int kilometre) {
    double litre;
    litre = yakit / (kilometre / 100);
    return litre;
  }

  double kilometredeYakilanKurus() {
    return (arac.besinciyakitfiyat / arac.besincikilometre);
  }

  double kilometredeYakilanOrtalamaKurus() {
    if (arac.dorduncuyakitlitre == null) {
      return (arac.besinciyakitfiyat) / arac.besincikilometre;
    } else if (arac.ucuncuyakitlitre == null) {
      return (((arac.besinciyakitfiyat) / arac.besincikilometre +
              (arac.dorduncuyakitfiyat) / arac.dorduncukilometre) /
          2);
    } else if (arac.ikinciyakitlitre == null) {
      return (((arac.besinciyakitfiyat) / arac.besincikilometre +
              (arac.dorduncuyakitfiyat) / arac.dorduncukilometre +
              (arac.ucuncuyakitfiyat) / arac.ucuncukilometre) /
          3);
    } else if (arac.birinciyakitlitre == null) {
      return (((arac.besinciyakitfiyat) / arac.besincikilometre +
              (arac.dorduncuyakitfiyat) / arac.dorduncukilometre +
              (arac.ucuncuyakitfiyat) / arac.ucuncukilometre +
              (arac.ikinciyakitfiyat) / arac.ikincikilometre) /
          4);
    } else {
      return (((arac.besinciyakitfiyat) / arac.besincikilometre +
              (arac.dorduncuyakitfiyat) / arac.dorduncukilometre +
              (arac.ucuncuyakitfiyat) / arac.ucuncukilometre +
              (arac.ikinciyakitfiyat) / arac.ikincikilometre +
              (arac.birinciyakitfiyat) / arac.birincikilometre) /
          5);
    }
  }

  double litredeGidilenKm() {
    return (arac.besincikilometre / arac.besinciyakitlitre);
  }

  double litredeGidilenOrtalamaKm(int kilometre, double litre) {
    return (kilometre / litre);
  }

  double yuzKilometreOrtalama() {
    if (arac.dorduncuyakitlitre == null) {
      return yuzKilometreOrtalamaYakitLitre(
          arac.besinciyakitlitre, arac.besincikilometre);
    } else if (arac.ucuncuyakitlitre == null) {
      return ((yuzKilometreOrtalamaYakitLitre(
                  arac.dorduncuyakitlitre, arac.dorduncukilometre) +
              yuzKilometreOrtalamaYakitLitre(
                  arac.besinciyakitlitre, arac.besincikilometre)) /
          2);
    } else if (arac.ikinciyakitlitre == null) {
      return ((yuzKilometreOrtalamaYakitLitre(
                  arac.ucuncuyakitlitre, arac.ucuncukilometre) +
              yuzKilometreOrtalamaYakitLitre(
                  arac.dorduncuyakitlitre, arac.dorduncukilometre) +
              yuzKilometreOrtalamaYakitLitre(
                  arac.besinciyakitlitre, arac.besincikilometre)) /
          3);
    } else if (arac.birinciyakitlitre == null) {
      return ((yuzKilometreOrtalamaYakitLitre(
                  arac.ikinciyakitlitre, arac.ikincikilometre) +
              yuzKilometreOrtalamaYakitLitre(
                  arac.ucuncuyakitlitre, arac.ucuncukilometre) +
              yuzKilometreOrtalamaYakitLitre(
                  arac.dorduncuyakitlitre, arac.dorduncukilometre) +
              yuzKilometreOrtalamaYakitLitre(
                  arac.besinciyakitlitre, arac.besincikilometre)) /
          4);
    } else {
      return ((yuzKilometreOrtalamaYakitLitre(
                  arac.birinciyakitlitre, arac.birincikilometre) +
              yuzKilometreOrtalamaYakitLitre(
                  arac.ikinciyakitlitre, arac.ikincikilometre) +
              yuzKilometreOrtalamaYakitLitre(
                  arac.ucuncuyakitlitre, arac.ucuncukilometre) +
              yuzKilometreOrtalamaYakitLitre(
                  arac.dorduncuyakitlitre, arac.dorduncukilometre) +
              yuzKilometreOrtalamaYakitLitre(
                  arac.besinciyakitlitre, arac.besincikilometre)) /
          5);
    }
  }

  String geneldeAlinanYakit() {
    if (arac.dorduncuFiyat == null) {
      return arac.besinciLitre.toStringAsFixed(0);
    } else if (arac.ucuncuFiyat == null) {
      return ((arac.besinciLitre + arac.dorduncuLitre) / 2).toStringAsFixed(0);
    } else if (arac.ikinciFiyat == null) {
      return ((arac.besinciLitre + arac.dorduncuLitre + arac.ucuncuLitre) / 3)
          .toStringAsFixed(0);
    } else if (arac.birinciFiyat == null) {
      return ((arac.besinciLitre +
                  arac.dorduncuLitre +
                  arac.ucuncuLitre +
                  arac.ikinciLitre) /
              4)
          .toStringAsFixed(0);
    } else {
      return ((arac.besinciLitre +
                  arac.dorduncuLitre +
                  arac.ucuncuLitre +
                  arac.ikinciLitre +
                  arac.birinciLitre) /
              5)
          .toStringAsFixed(0);
    }
  }

  String tahminiMenzil() {
    if (arac.dorduncukilometre == null) {
      return (arac.depohacmi *
              litredeGidilenOrtalamaKm(
                  arac.besincikilometre, arac.besinciyakitlitre))
          .toStringAsFixed(0);
    } else if (arac.ucuncukilometre == null) {
      return (arac.depohacmi *
              ((litredeGidilenOrtalamaKm(
                          arac.besincikilometre, arac.besinciyakitlitre) +
                      litredeGidilenOrtalamaKm(
                          arac.dorduncukilometre, arac.dorduncuyakitlitre)) /
                  2))
          .toStringAsFixed(0);
    } else if (arac.ikincikilometre == null) {
      return (arac.depohacmi *
              ((litredeGidilenOrtalamaKm(
                          arac.besincikilometre, arac.besinciyakitlitre) +
                      litredeGidilenOrtalamaKm(
                          arac.dorduncukilometre, arac.dorduncuyakitlitre) +
                      litredeGidilenOrtalamaKm(
                          arac.ucuncukilometre, arac.ucuncuyakitlitre)) /
                  3))
          .toStringAsFixed(0);
    } else if (arac.birincikilometre == null) {
      return (arac.depohacmi *
              ((litredeGidilenOrtalamaKm(
                          arac.besincikilometre, arac.besinciyakitlitre) +
                      litredeGidilenOrtalamaKm(
                          arac.dorduncukilometre, arac.dorduncuyakitlitre) +
                      litredeGidilenOrtalamaKm(
                          arac.ucuncukilometre, arac.ucuncuyakitlitre) +
                      litredeGidilenOrtalamaKm(
                          arac.ikincikilometre, arac.ikinciyakitlitre)) /
                  4))
          .toStringAsFixed(0);
    } else {
      return (arac.depohacmi *
              ((litredeGidilenOrtalamaKm(
                          arac.besincikilometre, arac.besinciyakitlitre) +
                      litredeGidilenOrtalamaKm(
                          arac.dorduncukilometre, arac.dorduncuyakitlitre) +
                      litredeGidilenOrtalamaKm(
                          arac.ucuncukilometre, arac.ucuncuyakitlitre) +
                      litredeGidilenOrtalamaKm(
                          arac.ikincikilometre, arac.ikinciyakitlitre) +
                      litredeGidilenOrtalamaKm(
                          arac.birincikilometre, arac.birinciyakitlitre)) /
                  5))
          .toStringAsFixed(0);
    }
  }

  double sonYakit() {
    return (arac.besinciFiyat * arac.besinciLitre);
  }

  double yakit(int sira) {
    if (sira == 1) {
      return (arac.besinciFiyat * arac.besinciLitre);
    } else if (sira == 2) {
      return (arac.dorduncuFiyat * arac.dorduncuLitre);
    } else if (sira == 3) {
      return (arac.ucuncuFiyat * arac.ucuncuLitre);
    } else if (sira == 4) {
      return (arac.ikinciFiyat * arac.ikinciLitre);
    } else {
      return (arac.birinciFiyat * arac.birinciLitre);
    }
  }

  double zamOrani() {
    if ((arac.besinciFiyat - arac.dorduncuFiyat) >= 0) {
      return ((arac.besinciFiyat / arac.dorduncuFiyat) * 100) - 100;
    }
    return (((arac.besinciFiyat / arac.dorduncuFiyat) * 100) - 100) * -1;
  }

  double zamMiktari() {
    return (arac.besinciFiyat - arac.dorduncuFiyat);
  }

  int checkEngine() {
    if (arac.motorhacmi <= 1.6 && arac.yakittipi == "dizel") {
      double maksimumYakit = (yuzKilometreOrtalama() * (167.18 / 100));
      if (yuzKilometreYakitLitre() > maksimumYakit) {
        return 1;
      } else {
        return 0;
      }
    } else if (1.4 <= arac.motorhacmi &&
        arac.motorhacmi <= 1.6 &&
        arac.yakittipi == "benzin") {
      double maksimumYakit = (yuzKilometreOrtalama() * (181.28 / 100));
      if (yuzKilometreYakitLitre() > maksimumYakit) {
        return 1;
      } else {
        return 0;
      }
    } else if (1.4 <= arac.motorhacmi &&
        arac.motorhacmi <= 1.6 &&
        arac.yakittipi == "lpg") {
      double maksimumYakit = (yuzKilometreOrtalama() * (163.8 / 100));
      if (yuzKilometreYakitLitre() > maksimumYakit) {
        return 1;
      } else {
        return 0;
      }
    } else if (arac.motorhacmi < 1.4 && arac.yakittipi == "benzin") {
      double maksimumYakit = (yuzKilometreOrtalama() * (186.4 / 100));
      if (yuzKilometreYakitLitre() > maksimumYakit) {
        return 1;
      } else {
        return 0;
      }
    } else if (arac.motorhacmi < 1.4 && arac.yakittipi == "lpg") {
      double maksimumYakit = (yuzKilometreOrtalama() * (160.3 / 100));
      if (yuzKilometreYakitLitre() > maksimumYakit) {
        return 1;
      } else {
        return 0;
      }
    } else if (1.6 < arac.motorhacmi &&
        arac.motorhacmi <= 2.0 &&
        arac.yakittipi == "benzin") {
      double maksimumYakit = (yuzKilometreOrtalama() * (190.9 / 100));
      if (yuzKilometreYakitLitre() > maksimumYakit) {
        return 1;
      } else {
        return 0;
      }
    } else if (1.6 < arac.motorhacmi &&
        arac.motorhacmi <= 2.0 &&
        arac.yakittipi == "lpg") {
      double maksimumYakit = (yuzKilometreOrtalama() * (180.1 / 100));
      if (yuzKilometreYakitLitre() > maksimumYakit) {
        return 1;
      } else {
        return 0;
      }
    } else if (1.6 < arac.motorhacmi &&
        arac.motorhacmi <= 2.0 &&
        arac.yakittipi == "dizel") {
      double maksimumYakit = (yuzKilometreOrtalama() * (174.7 / 100));
      if (yuzKilometreYakitLitre() > maksimumYakit) {
        return 1;
      } else {
        return 0;
      }
    }
  }
}
