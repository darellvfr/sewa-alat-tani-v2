# Sewa Alat Tani

Website penyewaan alat pertanian. Tahap awal: menampilkan daftar alat yang bisa disewa.

**Teknologi:** SvelteKit (Svelte 5), Supabase (database), Vercel (hosting).

## Struktur proyek

```
src/
  lib/
    components/EquipmentCard.svelte   kartu satu alat
    supabase.js                       klien Supabase
    format.js                         format Rupiah
  routes/
    +layout.svelte                    header dan gaya global
    +page.server.js                   ambil data alat dari Supabase
    +page.svelte                      halaman daftar alat + filter
supabase/schema.sql                   tabel, aturan keamanan, data contoh
.env.example                          contoh variabel lingkungan
```

## 1. Siapkan Supabase

1. Buat akun di https://supabase.com lalu klik **New project**.
2. Buka **SQL Editor**, tempel isi `supabase/schema.sql`, lalu klik **Run**.
   Ini membuat tabel `equipment`, mengaktifkan Row Level Security (pengunjung hanya bisa membaca), dan mengisi 6 data contoh.
3. Buka **Project Settings > API**, lalu salin:
   - **Project URL**
   - **anon public key**

## 2. Jalankan di komputer

Butuh Node.js 20 atau lebih baru.

```bash
npm install
cp .env.example .env     # lalu isi URL dan anon key dari langkah 1
npm run dev
```

Buka http://localhost:5173.

## 3. Deploy ke Vercel

1. Unggah proyek ke GitHub:
   ```bash
   git init
   git add .
   git commit -m "Tahap awal: daftar alat"
   git branch -M main
   git remote add origin https://github.com/USERNAME/sewa-alat-tani.git
   git push -u origin main
   ```
2. Buka https://vercel.com, klik **Add New > Project**, lalu pilih repositori tadi.
3. Framework akan terdeteksi sebagai **SvelteKit**. Biarkan pengaturan build bawaan.
4. Buka bagian **Environment Variables**, tambahkan dua variabel berikut:

   | Nama | Nilai |
   |---|---|
   | `PUBLIC_SUPABASE_URL` | Project URL dari Supabase |
   | `PUBLIC_SUPABASE_ANON_KEY` | anon public key dari Supabase |

5. Klik **Deploy**. Setelah selesai, Vercel memberi alamat `https://nama-proyek.vercel.app`.

Setiap `git push` ke cabang `main` akan otomatis memicu deploy baru.

## Masalah umum

- **Daftar kosong atau muncul pesan galat:** pastikan `schema.sql` sudah dijalankan dan kedua variabel lingkungan terisi benar. Setelah mengubah variabel di Vercel, lakukan **Redeploy**.
- **Build gagal dengan `PUBLIC_SUPABASE_URL is not exported`:** variabel belum diisi di Vercel atau di `.env`.
- **Data tidak muncul padahal tabel terisi:** periksa bahwa policy `select` pada tabel `equipment` sudah dibuat.

## Catatan keamanan

Hanya `anon public key` yang dipakai di aplikasi ini, dan aman terlihat di browser karena akses dibatasi oleh Row Level Security. Jangan pernah memakai `service_role key` di kode atau variabel berawalan `PUBLIC_`.
