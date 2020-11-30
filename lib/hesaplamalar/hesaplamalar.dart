class Hesaplamalar {
  double yuzKilometreYakitLitre(int kilometre, double yakitLitre) {
    double litre;
    litre = yakitLitre / (kilometre / 100);
    return litre;
  }

  double alinanYakitFiyati(double yakitFiyat, double yakitLitre) {
    return (yakitFiyat * yakitLitre);
  }

  double kilometredeYakilanKurus(double yakitFiyat, int kilometre) {
    return (yakitFiyat / kilometre);
  }
}
