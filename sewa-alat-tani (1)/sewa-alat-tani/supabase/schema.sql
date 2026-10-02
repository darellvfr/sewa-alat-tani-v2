-- Jalankan di Supabase > SQL Editor

create table if not exists public.equipment (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  category text not null,
  description text,
  price_per_day integer not null check (price_per_day >= 0),
  location text,
  image_url text,
  is_available boolean not null default true,
  created_at timestamptz not null default now()
);

-- Keamanan: pengunjung hanya boleh membaca, tidak boleh mengubah data.
alter table public.equipment enable row level security;

drop policy if exists "Publik boleh melihat alat" on public.equipment;
create policy "Publik boleh melihat alat"
  on public.equipment for select
  using (true);

-- Data contoh
insert into public.equipment (name, category, description, price_per_day, location, is_available) values
  ('Traktor roda empat 75 HP', 'Traktor', 'Untuk bajak dan garu lahan luas.', 450000, 'Karawang, Jawa Barat', true),
  ('Traktor tangan (hand tractor)', 'Traktor', 'Cocok untuk sawah kecil dan lahan sempit.', 150000, 'Subang, Jawa Barat', true),
  ('Mesin panen padi (combine harvester)', 'Panen', 'Panen dan perontokan sekaligus.', 900000, 'Indramayu, Jawa Barat', false),
  ('Pompa air diesel 4 inci', 'Irigasi', 'Mengairi sawah saat kemarau.', 100000, 'Cirebon, Jawa Barat', true),
  ('Penyemprot hama elektrik 16 L', 'Perawatan', 'Hemat tenaga untuk semprot pestisida.', 35000, 'Karawang, Jawa Barat', true),
  ('Mesin tanam padi (transplanter)', 'Tanam', 'Menanam bibit padi lebih rata dan cepat.', 300000, 'Subang, Jawa Barat', true);
