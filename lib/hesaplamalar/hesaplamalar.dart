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
    if (arac.dorduncukilometre == null) {
      return arac.besinciyakitlitre.toStringAsFixed(0);
    } else if (arac.ucuncukilometre == null) {
      return ((arac.besinciyakitlitre + arac.dorduncuyakitlitre) / 2)
          .toStringAsFixed(0);
    } else if (arac.ikincikilometre == null) {
      return ((arac.besinciyakitlitre +
                  arac.dorduncuyakitlitre +
                  arac.ucuncuyakitlitre) /
              3)
          .toStringAsFixed(0);
    } else if (arac.birincikilometre == null) {
      return ((arac.besinciyakitlitre +
                  arac.dorduncuyakitlitre +
                  arac.ucuncuyakitlitre +
                  arac.ikinciyakitlitre) /
              4)
          .toStringAsFixed(0);
    } else {
      return ((arac.besinciyakitlitre +
                  arac.dorduncuyakitlitre +
                  arac.ucuncuyakitlitre +
                  arac.ikinciyakitlitre +
                  arac.birincikilometre) /
              5)
          .toStringAsFixed(0);
    }
  }

  String tahminiMenzil() {
    if (arac.dorduncukilometre == null) {
      return arac.besincikilometre.toString();
    } else if (arac.ucuncukilometre == null) {
      return ((arac.besincikilometre + arac.dorduncukilometre) / 2)
          .toStringAsFixed(0);
    } else if (arac.ikincikilometre == null) {
      return ((arac.besincikilometre +
                  arac.dorduncukilometre +
                  arac.ucuncukilometre) /
              3)
          .toStringAsFixed(0);
    } else if (arac.birincikilometre == null) {
      return ((arac.besincikilometre +
                  arac.dorduncukilometre +
                  arac.ucuncukilometre +
                  arac.ikincikilometre) /
              4)
          .toStringAsFixed(0);
    } else {
      return ((arac.besincikilometre +
                  arac.dorduncukilometre +
                  arac.ucuncukilometre +
                  arac.ikincikilometre +
                  arac.birincikilometre) /
              5)
          .toStringAsFixed(0);
    }
  }

  int checkEngine() {}
}
