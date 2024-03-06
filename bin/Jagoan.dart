import 'Jubah.dart';
import 'Senjata.dart';

class Jagoan {
  late String nama;
  late int kesehatanDasar;
  late int kekuatanDasar;
  late int derajat;
  late int totalKerusakan;
  late int kenaikanKesehatan;
  late int kenaikanKekuatan;
  late bool hidup;

  //member berupa objek
  late Jubah jubah; // relasi asosiasi, jagoan pakai juba
  late Senjata senjata; // relasi asosiasi, jagoan pakai senjata

  Jagoan(String nama, int kesehatanDasar, int kekuatanDasar, int derajat,
      int kenaikanKesehatan, int kenaikanKekuatan, bool hidup) {
    this.nama = nama;
    this.kesehatanDasar = kesehatanDasar;
    this.kekuatanDasar = kekuatanDasar;
    this.derajat = derajat;
    this.kenaikanKesehatan = kenaikanKesehatan;
    this.kenaikanKekuatan = kenaikanKekuatan;
    this.hidup = hidup;
    this.totalKerusakan = 0;
  }

  void setJubah(Jubah jubah) {
    this.jubah = jubah;
  }

  void setSenjata(Senjata senjata) {
    this.senjata = senjata;
  }

  String getNama() {
    return this.nama;
  }

  int sehatMaksimal() {
    return kesehatanDasar +
        jubah.getTambahKesehatan() +
        derajat * kenaikanKesehatan;
  }

  int getKekuatanSerangJagoan() {
    return kekuatanDasar +
        senjata.getKekuatanSerang() +
        derajat * kenaikanKekuatan;
  }

  int getNilaiKesehatan() {
    return sehatMaksimal() - totalKerusakan;
  }

  void naikDerajat() {
    derajat += 1;
  }

  bool getStatus() {
    return hidup;
  }

  //menyerang lawan
  void menyerang(Jagoan lawan) {
    int kekuatanSerang = getKekuatanSerangJagoan();
    print("$nama menyerang ${lawan.getNama()} dengan kekuatan $kekuatanSerang");

    lawan.bertahan(kekuatanSerang);

    this.naikDerajat();
  }

  //Bertahan dari lawan
  void bertahan(int kerusakan) {
    int kekuatanBertahan = this.jubah.getNilaiKekuatan();
    int selisihKerusakan;

    print("$nama memiliki kekuatan bertahan: $kekuatanBertahan");

    if (kerusakan > kekuatanBertahan) {
      selisihKerusakan = kerusakan - kekuatanBertahan;
    } else {
      selisihKerusakan = 0;
    }

    print("Kerusakan yang diperoleh $selisihKerusakan \n");

    //tambah total kerusakan
    this.totalKerusakan += selisihKerusakan;

    //periksa apakah jagoan masih hidup
    if (this.getNilaiKesehatan() <= 0) {
      this.hidup = false;
      this.totalKerusakan = this.sehatMaksimal();
    }

    this.info();
  }

  void info() {
    print("Jagoan\t\t\t:  $nama");
    print("Derajat\t\t\t: $derajat");
    print("Kesehatan Dasar\t\t:  $kesehatanDasar");
    print("Kekuatan Dasar\t\t: $kekuatanDasar");
    print("Kesehatan\t\t: ${getNilaiKesehatan()} / ${sehatMaksimal()}");
    print("Kekuatan Maksimal\t: ${getKekuatanSerangJagoan()}");
    print("Masih hidup?\t\t:  $hidup ");
  }

  void getNamaJubah() {
    print("Jubah\t\t\t: ${jubah.getNama()}");
  }

  void getNamaSenjata() {
    print("Senjata\t\t\t: + ${senjata.getNama()}");
  }
}
