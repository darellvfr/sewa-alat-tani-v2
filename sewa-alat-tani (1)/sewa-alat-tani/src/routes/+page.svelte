<script>
  import EquipmentCard from '$lib/components/EquipmentCard.svelte';

  let { data } = $props();
  let kategori = $state('Semua');
  let hanyaTersedia = $state(false);

  const daftarKategori = $derived(['Semua', ...new Set(data.equipment.map((e) => e.category))]);
  const tampil = $derived(
    data.equipment.filter(
      (e) => (kategori === 'Semua' || e.category === kategori) && (!hanyaTersedia || e.is_available)
    )
  );
</script>

<svelte:head>
  <title>Sewa Alat Tani</title>
  <meta name="description" content="Daftar alat pertanian yang bisa disewa harian." />
</svelte:head>

<main class="wrap">
  <h1>Alat pertanian untuk disewa</h1>
  <p class="lead">Pilih alat yang Anda butuhkan. Harga dihitung per hari.</p>

  <div class="filters">
    <label>
      Kategori
      <select bind:value={kategori}>
        {#each daftarKategori as k}<option value={k}>{k}</option>{/each}
      </select>
    </label>
    <label class="check">
      <input type="checkbox" bind:checked={hanyaTersedia} /> Hanya yang tersedia
    </label>
  </div>

  {#if data.error}
    <p class="msg err" role="alert">{data.error}</p>
  {:else if tampil.length === 0}
    <p class="msg">Tidak ada alat yang cocok dengan filter ini.</p>
  {:else}
    <div class="grid">
      {#each tampil as item (item.id)}
        <EquipmentCard {item} />
      {/each}
    </div>
  {/if}
</main>

<style>
  main { padding-top: 32px; padding-bottom: 56px; }
  h1 { margin: 0 0 4px; font-size: clamp(1.6rem, 4vw, 2.2rem); }
  .lead { margin: 0 0 24px; color: var(--muted); }
  .filters { display: flex; gap: 20px; flex-wrap: wrap; align-items: end; margin-bottom: 24px; }
  label { display: flex; flex-direction: column; gap: 4px; font-weight: 600; font-size: 0.9rem; }
  .check { flex-direction: row; align-items: center; gap: 8px; }
  select { padding: 8px 10px; font: inherit; border: 1px solid var(--line); border-radius: 6px; background: var(--card); color: var(--ink); }
  .grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(260px, 1fr)); gap: 16px; }
  .msg { color: var(--muted); }
  .err { color: var(--bad); }
</style>
