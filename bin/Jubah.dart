class Jubah {
  String nama;
  int kekuatan;
  int kesehatan;

  Jubah(this.nama, this.kekuatan, this.kesehatan);

  String getNama() {
    return this.nama;
  }

  int getTambahKesehatan() {
    return this.kesehatan * 10;
  }

  int getNilaiKekuatan() {
    return this.kekuatan * 2;
  }
}
