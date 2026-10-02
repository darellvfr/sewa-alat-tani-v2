# Progress Pengerjaan

Terakhir diperbarui: 2 Oktober 2026

## Tahap 1: Daftar alat (selesai dibuat, perlu diuji)

- [x] Struktur proyek SvelteKit + adapter Vercel
- [x] Skema tabel `equipment` + Row Level Security (baca-saja untuk publik)
- [x] Data contoh (6 alat)
- [x] Klien Supabase dan pengambilan data di sisi server
- [x] Halaman daftar alat dengan kartu (nama, kategori, harga per hari, lokasi, status)
- [x] Filter kategori dan filter "hanya yang tersedia"
- [x] Tampilan galat dan kondisi data kosong
- [x] README cara setup dan deploy
- [ ] Jalankan `npm install` dan `npm run dev`, pastikan data tampil
- [ ] Deploy pertama ke Vercel
- [ ] Ganti data contoh dengan data alat asli

## Tahap 2: Detail alat (berikutnya)

- [ ] Halaman detail per alat (`/alat/[id]`)
- [ ] Foto alat (Supabase Storage)
- [ ] Pencarian berdasarkan nama
- [ ] Pagination bila daftar sudah panjang

## Tahap 3: Pemesanan

- [ ] Tabel `bookings` (alat, penyewa, tanggal mulai, tanggal selesai, status)
- [ ] Form pemesanan dan pengecekan bentrok tanggal
- [ ] Login pengguna (Supabase Auth)
- [ ] Riwayat pesanan pengguna

## Tahap 4: Pengelolaan (admin/pemilik alat)

- [ ] Halaman admin untuk tambah, ubah, dan hapus alat
- [ ] Konfirmasi atau tolak pesanan
- [ ] Notifikasi (email atau WhatsApp)

## Tahap 5: Penyempurnaan

- [ ] Pembayaran
- [ ] Ulasan dan penilaian
- [ ] Domain sendiri
- [ ] SEO dan pengujian

## Catatan keputusan

- Data dibaca di server (`+page.server.js`) agar halaman langsung terisi dan mudah di-SEO.
- Kunci yang dipakai hanya `anon key`; perubahan data nanti lewat login dan aturan RLS, bukan lewat kunci rahasia di browser.
- Kode belum dijalankan di lingkungan ini (tanpa akses internet untuk `npm install`), jadi pengujian pertama ada di langkah Tahap 1 yang belum dicentang.
