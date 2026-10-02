<script>
  import '../app.css';
  let { children } = $props();
</script>

<header>
  <div class="wrap"><strong>🌾 Sewa Alat Tani</strong></div>
</header>
{@render children()}

<style>
  header { background: #1f3d1c; color: #f4f6ec; padding: 14px 0; }
</style>
