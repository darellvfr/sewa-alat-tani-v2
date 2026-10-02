<script>
  import { rupiah } from '$lib/format.js';
  let { item } = $props();
</script>

<article class="card">
  {#if item.image_url}
    <img src={item.image_url} alt={item.name} loading="lazy" />
  {:else}
    <div class="noimg" aria-hidden="true">🚜</div>
  {/if}
  <div class="body">
    <span class="cat">{item.category}</span>
    <h3>{item.name}</h3>
    <p class="desc">{item.description ?? ''}</p>
    <p class="loc">{item.location ?? ''}</p>
    <div class="foot">
      <strong>{rupiah(item.price_per_day)}<small> / hari</small></strong>
      <span class="badge" class:off={!item.is_available}>
        {item.is_available ? 'Tersedia' : 'Sedang disewa'}
      </span>
    </div>
  </div>
</article>

<style>
  .card { background: var(--card); border: 1px solid var(--line); border-radius: 10px; overflow: hidden; display: flex; flex-direction: column; }
  img, .noimg { width: 100%; aspect-ratio: 16 / 10; object-fit: cover; background: #e6ecd6; }
  .noimg { display: grid; place-items: center; font-size: 3rem; }
  .body { padding: 16px; display: flex; flex-direction: column; gap: 4px; flex: 1; }
  .cat { color: var(--accent); font-size: 0.85rem; font-weight: 600; }
  h3 { margin: 0; font-size: 1.15rem; }
  .desc { margin: 0; color: var(--muted); font-size: 0.93rem; }
  .loc { margin: 0; color: var(--muted); font-size: 0.85rem; }
  .foot { margin-top: auto; padding-top: 12px; display: flex; justify-content: space-between; align-items: center; }
  small { font-weight: 400; color: var(--muted); }
  .badge { font-size: 0.8rem; font-weight: 600; padding: 3px 10px; border-radius: 99px; background: #dcefd2; color: var(--accent); }
  .badge.off { background: #f3dcd6; color: var(--bad); }
</style>
