# MidExam

Aplikasi web berbasis **PHP** untuk merekap nilai mahasiswa. Data nilai disimpan di database MySQL, lengkap dengan foto mahasiswa, konversi otomatis ke nilai huruf dan predikat, serta fitur pencarian, filter, pengurutan, dan paginasi.

Proyek ini dibuat untuk memenuhi tugas mata kuliah **Pemrograman Web**.

## Fitur

- **CRUD data nilai**: tambah, lihat, ubah, dan hapus data mahasiswa.
- **Konversi otomatis**: nilai huruf dan predikat dihitung langsung dari nilai akhir (di sisi browser saat mengetik, dan dihitung ulang di sisi server saat data disimpan).
- **Upload foto** mahasiswa (`jpg`, `jpeg`, `png`, `gif`, `webp`). Foto disimpan di folder `uploads/` dengan format nama `timestamp_NIM.ext`.
- **Pencarian** berdasarkan nama lengkap.
- **Filter** berdasarkan predikat.
- **Pengurutan** nilai akhir (tertinggi ke terendah atau sebaliknya).
- **Paginasi** dengan pilihan 5, 10, atau 15 data per halaman.
- **Pencatatan waktu**: tanggal dibuat (`created_date`) dan tanggal diubah (`modified_date`).
- **Validasi input**: NIM harus 10 karakter dan nilai akhir harus berada di rentang 0 sampai 100.

## Skala Penilaian

| Nilai Akhir      | Nilai Huruf | Predikat          |
|------------------|:-----------:|-------------------|
| > 80,50 – 100    | A           | Sangat Memuaskan  |
| > 65,50 – 80,50  | B           | Memuaskan         |
| > 50,50 – 65,50  | C           | Cukup Memuaskan   |
| > 34,50 – 50,50  | D           | Kurang Memuaskan  |
| 0 – 34,50        | E           | Tidak Lulus       |

## Teknologi

- PHP (ekstensi `mysqli`)
- MySQL / MariaDB
- HTML, CSS, dan JavaScript
- [Bootstrap 5](https://getbootstrap.com/) dan template [AdminLTE](https://adminlte.io/) (`css/adminlte.css`)
- [Bootstrap Icons](https://icons.getbootstrap.com/) dan font Source Sans 3 (dimuat lewat CDN)

## Struktur Proyek

```
StudentRecap.com/
├── css/                  # Stylesheet (AdminLTE)
├── js/                   # Berkas JavaScript
├── uploads/              # Foto mahasiswa (dibuat otomatis saat upload pertama)
├── .gitignore
├── connection.php        # Konfigurasi koneksi database
├── nilaiui.php           # Halaman form input nilai
├── viewdata.php          # Halaman utama: daftar nilai, filter, dan modal tambah/ubah/hapus
├── viewdata_nilai.php    # Proses simpan data baru (INSERT) dan upload foto
├── editnilai.php         # Proses ubah data (UPDATE)
└── hapusnilai.php        # Proses hapus data (DELETE)
```

## Prasyarat

- PHP 7.4 atau lebih baru
- MySQL atau MariaDB
- Web server lokal, misalnya [XAMPP](https://www.apachefriends.org/) atau [Laragon](https://laragon.org/)
- Koneksi internet (Bootstrap, ikon, dan font dimuat dari CDN)

## Cara Menjalankan

1. **Clone repositori** ke folder web server (misalnya `www` pada laragon):

   ```bash
   https://github.com/QueenOrca/ArtikaZahrotulMawadah_utsweb.git
   ```

2. **Jalankan Apache dan MySQL** dari XAMPP atau Laragon.

3. **Buat database dan tabel.** Buka phpMyAdmin atau klien MySQL, lalu jalankan:

   ```sql
   CREATE DATABASE IF NOT EXISTS db5e;
   USE db5e;

   CREATE TABLE IF NOT EXISTS nilai (
       nim           CHAR(10)      NOT NULL PRIMARY KEY,
       namalengkap    VARCHAR(100)  NOT NULL,
       foto          VARCHAR(255)  DEFAULT '',
       nilaiakhir   DECIMAL(5,2)  NOT NULL,
       nilaihuruf   VARCHAR(10)   NOT NULL,
       predikat      VARCHAR(50)   NOT NULL,
       created_date  DATETIME      DEFAULT CURRENT_TIMESTAMP,
       modified_date DATETIME      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
   );
   ```

4. **Sesuaikan koneksi database** di `connection.php` jika konfigurasi MySQL kamu berbeda:

   ```php
   $servername = "localhost";
   $username   = "root";
   $password   = "";
   ```

5. **Buka aplikasi** di browser:

   ```
   http://localhost/MidExam/viewdata.php
   ```

   Pastikan folder `uploads/` dapat ditulis oleh web server agar fitur upload foto berjalan.

## Penggunaan

- **Tambah data**: klik tombol **Tambah Data** di `viewdata.php`, isi NIM, nama lengkap, foto (opsional), dan nilai akhir. Nilai huruf dan predikat terisi otomatis.
- **Ubah data**: klik ikon pensil pada baris data. NIM tidak dapat diubah, sedangkan nama, nilai akhir, dan foto (opsional) dapat diperbarui.
- **Hapus data**: klik ikon tempat sampah, lalu konfirmasi penghapusan.
- **Cari, filter, dan urutkan**: gunakan kolom pencarian dan menu pilihan di bagian atas tabel, lalu klik **Terapkan**.
- **Form alternatif**: `nilaiui.php` menyediakan halaman form input tersendiri yang mengirim data ke `viewdata_nilai.php`.

## Catatan

- Konfigurasi bawaan di `connection.php` (user `root` tanpa password) hanya cocok untuk pengembangan lokal. Gunakan akun dan password khusus jika aplikasi dipasang di server publik.
- Folder `uploads/` berisi foto yang diunggah pengguna, sehingga sebaiknya tidak ikut di-commit ke repositori.

## Pembuat

| Keterangan   | Detail                       |
|--------------|------------------------------|
| Nama         | Artika Zahrotul MAwadah      |
| Kelas        | 5E-TIF                       |
| NIM          | 3202416128                   |
| Mata Kuliah  | Pemrograman Web              |
