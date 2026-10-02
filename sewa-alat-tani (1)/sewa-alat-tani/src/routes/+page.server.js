import { supabase } from '$lib/supabase.js';

export async function load() {
  const { data, error } = await supabase
    .from('equipment')
    .select('id, name, category, description, price_per_day, location, image_url, is_available')
    .order('name');

  if (error) {
    console.error('Gagal memuat alat:', error.message);
    return { equipment: [], error: 'Daftar alat belum bisa dimuat. Coba muat ulang halaman.' };
  }
  return { equipment: data ?? [], error: null };
}
