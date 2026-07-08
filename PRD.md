# PRD - Sistem Inventaris Barang (Laravel Fullstack)

## 1. Overview
Aplikasi web manajemen inventaris barang berbasis Laravel. Fitur: master data, transaksi barang masuk/keluar dengan update stok otomatis, dashboard, export laporan, activity log.

**Stack:** Laravel 11, MySQL, Tailwind CSS (CDN, no build step), Chart.js, Breeze (auth), Blade templates.

**Constraint:** Kerjakan phase-by-phase sesuai urutan di bawah. Jangan lompat ke phase berikutnya sebelum phase sebelumnya selesai dan dikonfirmasi jalan. Jangan generate dokumentasi tambahan kecuali diminta.

---

## 2. Roles
- **admin**: full access semua modul + laporan
- **petugas**: akses CRUD barang masuk/keluar + lihat dashboard, tidak bisa kelola master data/user

Middleware: `role:admin`, `role:petugas` (gunakan spatie/laravel-permission ATAU kolom `role` string sederhana di tabel users — pilih yang lebih cepat: kolom string).

---

## 3. Database Schema

### Master Tables
```
users
- id, name, email, password, role (enum: admin, petugas), timestamps

kategori_barang
- id, nama_kategori, keterangan, timestamps

satuan
- id, nama_satuan (pcs, box, kg, dll), timestamps

supplier
- id, nama_supplier, alamat, telepon, email, timestamps

barang
- id, kode_barang (unique), nama_barang, kategori_barang_id (FK), satuan_id (FK),
  stok (integer, default 0), harga_beli, harga_jual, stok_minimum (default 10), timestamps
```

### Pivot (Many to Many)
```
barang_supplier
- id, barang_id (FK), supplier_id (FK), timestamps
```

### Transaction Tables
```
barang_masuk
- id, kode_transaksi (unique), barang_id (FK), supplier_id (FK), user_id (FK),
  jumlah, harga_beli, tanggal, keterangan, timestamps

barang_keluar
- id, kode_transaksi (unique), barang_id (FK), user_id (FK),
  jumlah, tanggal, keterangan, timestamps
```

### Relasi Summary
- kategori_barang → barang (One to Many)
- satuan → barang (One to Many)
- barang ↔ supplier (Many to Many via barang_supplier)
- barang_masuk/barang_keluar → barang, user (belongsTo)

### Business Logic
- Setiap create `barang_masuk` → `barang.stok += jumlah` (pakai Model Observer/Event, bukan di controller)
- Setiap create `barang_keluar` → validasi stok cukup, lalu `barang.stok -= jumlah`
- Gunakan DB Transaction untuk operasi stok agar konsisten

---

## 4. Modules (CRUD wajib = 6 modul)

| Modul | Akses | Fitur |
|---|---|---|
| Kategori Barang | admin | CRUD |
| Satuan | admin | CRUD |
| Supplier | admin | CRUD, assign ke barang |
| Barang | admin | CRUD + search + pagination |
| Barang Masuk | admin, petugas | Create, Read (index+detail), no update/delete stok histori |
| Barang Keluar | admin, petugas | Create, Read (index+detail), no update/delete stok histori |

Semua index page: search (nama/kode) + pagination (`paginate(10)`).

---

## 5. Dashboard
Route: `/dashboard`
Tampilkan:
- Total Barang, Total Kategori, Total Supplier, Jumlah Barang Stok Menipis (< stok_minimum)
- Grafik Chart.js: Line/Bar chart barang masuk vs keluar per bulan (6 bulan terakhir)
- Tabel: 5 barang dengan stok terendah

---

## 6. Export
- **Excel**: package `maatwebsite/excel` — export laporan stok barang (semua kolom barang + kategori + satuan)
- **PDF**: package `barryvdh/dompdf` — export laporan stok barang, layout simple table

Route: `/laporan/export-excel`, `/laporan/export-pdf`

---

## 7. Nilai Tambahan (3 fitur, WAJIB implement semua)

### 7.1 Activity Log
Package `spatie/laravel-activitylog`
- Tambahkan trait `LogsActivity` di model: Barang, BarangMasuk, BarangKeluar
- Log CRUD operations otomatis
- Buat halaman `/activity-log` (admin only) untuk lihat histori aktivitas

### 7.2 Dark Mode
- Toggle button di topbar (icon sun/moon)
- Pakai Tailwind `dark:` class + strategy `class` (di config atau via CDN script tambahan `tailwind.config = { darkMode: 'class' }`)
- State disimpan di localStorage via JS kecil, apply `document.documentElement.classList.toggle('dark')`
- Terapkan `dark:` variant minimal di layout utama (sidebar, topbar, card, table) — tidak perlu semua elemen detail

### 7.3 Upload Multiple Images (Barang)
- Tabel baru: `barang_images` (id, barang_id FK, path, timestamps)
- Relasi: barang hasMany barang_images
- Form tambah/edit barang: input file `multiple`, simpan tiap file sebagai row baru di `barang_images`, storage di `storage/app/public/barang`
- Halaman detail barang: tampilkan gallery/carousel sederhana dari semua gambar
- Jangan lupa `php artisan storage:link`

---

## 8. UI
- Tailwind CDN (`<script src="https://cdn.tailwindcss.com"></script>`) — jangan pakai Vite build
- Layout: sidebar (menu sesuai role) + topbar + content area
- Warna: slate/indigo, minimalis
- Gunakan Blade component `<x-layout>` untuk reuse

---

## 9. Auth
Laravel Breeze (blade stack, bukan Inertia/React — lebih cepat)
- Login, Logout, Register
- Setelah register default role = petugas (admin dibuat via seeder)

---

## 10. Seeder & Factory (wajib ada, isi data dummy realistis)
- UserSeeder: 1 admin, 2 petugas
- KategoriBarangSeeder: 5 kategori
- SatuanSeeder: 4 satuan
- SupplierSeeder: 5 supplier (factory)
- BarangSeeder: 20 barang (factory, random kategori/satuan)
- BarangMasukSeeder & BarangKeluarSeeder: masing-masing 15 transaksi (factory, tanggal tersebar 6 bulan terakhir) — pastikan stok akhir barang konsisten dengan histori transaksi

---

## 11. Execution Order (phase-by-phase, tunggu konfirmasi tiap phase)

1. **Setup**: `laravel new`, install Breeze (blade), setup .env & DB, install package (excel, dompdf, activitylog)
2. **Migration + Model + Relasi**: semua tabel di atas termasuk `barang_images`, lengkap dengan relationship methods
3. **Seeder + Factory**: jalankan `migrate:fresh --seed`, pastikan data konsisten
4. **Middleware Role**: buat middleware, apply ke route groups
5. **CRUD Master**: kategori_barang, satuan, supplier (controller resource + blade view + route)
6. **CRUD Barang**: termasuk relasi many-to-many supplier (multi-select form) + upload multiple images
7. **Transaksi**: barang_masuk, barang_keluar + observer update stok
8. **Dashboard**: query aggregasi + Chart.js
9. **Export**: Excel + PDF
10. **Activity Log**: install package, trait, halaman log
11. **Dark Mode**: toggle + tailwind dark class + localStorage persist
12. **Styling pass**: rapikan semua view pakai Tailwind konsisten
13. **Testing manual**: cek semua alur (auth, role, CRUD, stok update, export, dark mode, upload gambar)
14. **Deploy**: deploy ke shared hosting domain `rapih.luhur.my.id` (lihat section 13 untuk detail teknis)

---

## 13. Deployment - Shared Hosting (cPanel)

Domain: **rapih.luhur.my.id**

Shared hosting biasanya nggak ada akses SSH/terminal penuh dan struktur folder beda dari VPS. Ikuti langkah ini:

1. **Struktur folder**: Upload seluruh project Laravel ke folder di luar `public_html` (misal folder `laravel_app`), lalu:
   - Copy isi folder `public/` Laravel ke `public_html` (atau ke subfolder domain kalau addon domain)
   - Edit `public_html/index.php`: ubah path `require __DIR__.'/../vendor/autoload.php'` dan `$app = require_once __DIR__.'/../bootstrap/app.php'` supaya nunjuk ke lokasi `laravel_app` yang benar (biasanya naik lebih banyak folder)

2. **.env production**:
   - `APP_URL=https://rapih.luhur.my.id`
   - `APP_ENV=production`, `APP_DEBUG=false`
   - Isi DB_HOST, DB_DATABASE, DB_USERNAME, DB_PASSWORD sesuai kredensial MySQL dari cPanel (biasanya prefix user hosting, misal `user_inventaris`)

3. **Artisan commands tanpa SSH** (kalau hosting nggak kasih terminal):
   - Cek apakah cPanel ada fitur "Terminal" atau "Setup Node.js/PHP App" — kalau ada, jalankan `composer install --optimize-autoloader --no-dev`, `php artisan migrate --seed`, `php artisan config:cache`, `php artisan storage:link` dari situ
   - Kalau benar-benar nggak ada terminal: jalankan migration & seeder dari lokal dulu, lalu export database dan import via **phpMyAdmin** di cPanel
   - Untuk `storage:link` (dibutuhkan fitur Upload Multiple Images), kalau symlink command nggak bisa jalan: buat folder `public_html/storage` manual dan copy isi `storage/app/public` ke situ secara manual (bukan symlink), atau pakai symlink manual via File Manager kalau hosting support

4. **Composer dependencies**: kalau hosting nggak ada composer, jalankan `composer install` di lokal, lalu upload folder `vendor/` sekalian (ukuran lebih besar tapi pasti jalan)

5. **Permission**: pastikan folder `storage/` dan `bootstrap/cache/` writable (755 atau 775 tergantung provider)

6. **Cek sebelum submit**: akses `https://rapih.luhur.my.id`, test login, test CRUD, test upload gambar, test export — pastikan semua path (storage link, asset) kebaca bener di domain live.

---

## 14. Out of Scope (jangan dikerjakan, hemat waktu)
- Tidak perlu API/REST endpoint terpisah (semua via web routes + blade)
- Tidak perlu unit test otomatis
- Tidak perlu fitur tambahan selain 3 yang disebutkan di section 7 (Activity Log, Dark Mode, Upload Multiple Images)
- Tidak perlu Vite/asset build — pakai CDN semua (Tailwind, Chart.js)
- Tidak perlu image processing/resize/watermark, upload asli saja
