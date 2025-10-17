import 'dart:io';

class Mahasiswa {
  String nama;
  String nim;
  String jurusan;
  int semester;
  Map<String, double> nilai = {};

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.semester,
  });

  // Input nilai dari pengguna
  void inputNilai() {
    stdout.write('\nBerapa jumlah mata kuliah yang ingin dimasukkan? ');
    int? jumlah = int.tryParse(stdin.readLineSync()!);

    for (int i = 1; i <= (jumlah ?? 0); i++) {
      stdout.write('\n mata kuliah ke-$i: ');
      String? matkul = stdin.readLineSync();

      stdout.write(' nilai $matkul: ');
      double? skor = double.tryParse(stdin.readLineSync()!);

      if (matkul != null && skor != null) {
        nilai[matkul] = skor;
      } else {
        print('⚠ Input tidak valid, data dilewati.');
      }
    }
  }

  void tampilkanBiodata() {
    print('\n=== BIODATA MAHASISWA ===');
    print('Nama      : $nama');
    print('NIM       : $nim');
    print('Jurusan   : $jurusan');
    print('Semester  : $semester');
  }

  void tampilkanNilai() {
    print('\n=== NILAI MATA KULIAH ===');
    nilai.forEach((matkul, skor) {
      print('$matkul : $skor');
    });
  }

  double hitungRataRata() {
    if (nilai.isEmpty) return 0;
    double total = 0;
    nilai.forEach((_, skor) => total += skor);
    return total / nilai.length;
  }

  void tampilkanStatus() {
    double rata = hitungRataRata();
    print('\nRata-rata Nilai : ${rata.toStringAsFixed(2)}');

    if (rata >= 85) {
      print('Predikat        : A');
      print('Status          : Lulus dengan Pujian ');
    } else if (rata >= 75) {
      print('Predikat        : B');
      print('Status          : Lulus 👍');
    } else if (rata >= 65) {
      print('Predikat        : C');
      print('Status          : Lulus Bersyarat ');
    } else {
      print('Predikat        : D');
      print('Status          : Tidak Lulus ');
    }
  }
}


void main() {
  print('=== SISTEM NILAI MAHASISWA ===');

  // Input biodata mahasiswa
  stdout.write(' Nama: ');
  String? nama = stdin.readLineSync();

  stdout.write(' NIM: ');
  String? nim = stdin.readLineSync();

  stdout.write(' Jurusan: ');
  String? jurusan = stdin.readLineSync();

  stdout.write(' Semester: ');
  int? semester = int.tryParse(stdin.readLineSync()!);

  // Membuat objek mahasiswa
  var mhs = Mahasiswa(
    nama: nama ?? 'Tanpa Nama',
    nim: nim ?? 'Tidak Ada',
    jurusan: jurusan ?? 'Belum Diisi',
    semester: semester ?? 0,
  );

  // Input nilai-nilai
  mhs.inputNilai();

  // Menampilkan hasil
  mhs.tampilkanBiodata();
  mhs.tampilkanNilai();
  mhs.tampilkanStatus();

  print('\nTerima kasih telah menggunakan sistem nilai mahasiswa.');
}