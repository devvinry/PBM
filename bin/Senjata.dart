class Senjata {
  String nama;
  int kekuatan;

  Senjata(this.nama, this.kekuatan);

  String getNama() {
    return this.nama;
  }

  int getKekuatanSerang() {
    return this.kekuatan * 2;
  }
}
