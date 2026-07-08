<x-app-layout>
    <x-slot name="header">Dashboard</x-slot>

    <!-- Stats Overview -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6 border-l-4 border-indigo-500">
            <div class="flex items-center justify-between">
                <div><p class="text-sm font-medium text-gray-500 dark:text-gray-400">Total Barang</p><p class="text-3xl font-bold text-gray-800 dark:text-white">{{ $totalBarang }}</p></div>
                <div class="p-3 bg-indigo-100 dark:bg-indigo-900/50 text-indigo-600 dark:text-indigo-400 rounded-lg">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"/></svg>
                </div>
            </div>
        </div>
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6 border-l-4 border-emerald-500">
            <div class="flex items-center justify-between">
                <div><p class="text-sm font-medium text-gray-500 dark:text-gray-400">Kategori</p><p class="text-3xl font-bold text-gray-800 dark:text-white">{{ $totalKategori }}</p></div>
                <div class="p-3 bg-emerald-100 dark:bg-emerald-900/50 text-emerald-600 dark:text-emerald-400 rounded-lg">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A2 2 0 013 12V7a4 4 0 014-4z"/></svg>
                </div>
            </div>
        </div>
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6 border-l-4 border-amber-500">
            <div class="flex items-center justify-between">
                <div><p class="text-sm font-medium text-gray-500 dark:text-gray-400">Supplier</p><p class="text-3xl font-bold text-gray-800 dark:text-white">{{ $totalSupplier }}</p></div>
                <div class="p-3 bg-amber-100 dark:bg-amber-900/50 text-amber-600 dark:text-amber-400 rounded-lg">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/></svg>
                </div>
            </div>
        </div>
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6 border-l-4 border-rose-500">
            <div class="flex items-center justify-between">
                <div><p class="text-sm font-medium text-gray-500 dark:text-gray-400">Stok Menipis</p><p class="text-3xl font-bold text-gray-800 dark:text-white">{{ $stokMenipis }}</p></div>
                <div class="p-3 bg-rose-100 dark:bg-rose-900/50 text-rose-600 dark:text-rose-400 rounded-lg">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/></svg>
                </div>
            </div>
        </div>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- Chart -->
        <div class="lg:col-span-2 bg-white dark:bg-gray-800 rounded-xl shadow p-6">
            <h3 class="text-lg font-bold text-gray-800 dark:text-white mb-4">Aktivitas Barang (6 Bulan Terakhir)</h3>
            <div class="relative h-72">
                <canvas id="transaksiChart"></canvas>
            </div>
        </div>

        <!-- Stok Terendah -->
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
            <h3 class="text-lg font-bold text-gray-800 dark:text-white mb-4">Stok Barang Terendah</h3>
            <div class="space-y-4">
                @forelse($barangTerendah as $b)
                <div class="flex items-center justify-between p-3 rounded-lg border border-gray-100 dark:border-gray-700 bg-gray-50 dark:bg-gray-800/50">
                    <div>
                        <p class="font-medium text-sm text-gray-800 dark:text-gray-200">{{ $b->nama_barang }}</p>
                        <p class="text-xs text-gray-500">{{ $b->kategori->nama_kategori ?? '-' }}</p>
                    </div>
                    <div class="text-right">
                        <p class="text-lg font-bold {{ $b->stok < $b->stok_minimum ? 'text-red-500' : 'text-amber-500' }}">{{ $b->stok }}</p>
                        <p class="text-[10px] text-gray-400 uppercase">Min: {{ $b->stok_minimum }}</p>
                    </div>
                </div>
                @empty
                <p class="text-sm text-gray-500 text-center py-4">Belum ada barang.</p>
                @endforelse
            </div>
        </div>
    </div>

    @push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const ctx = document.getElementById('transaksiChart').getContext('2d');
            
            // Konfigurasi warna dinamis untuk dark mode
            const isDark = document.documentElement.classList.contains('dark');
            const gridColor = isDark ? 'rgba(255, 255, 255, 0.1)' : 'rgba(0, 0, 0, 0.1)';
            const textColor = isDark ? '#9ca3af' : '#4b5563';

            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: {!! json_encode($chartLabels) !!},
                    datasets: [
                        {
                            label: 'Barang Masuk',
                            data: {!! json_encode($dataMasuk) !!},
                            borderColor: '#10b981',
                            backgroundColor: 'rgba(16, 185, 129, 0.1)',
                            borderWidth: 2,
                            fill: true,
                            tension: 0.3
                        },
                        {
                            label: 'Barang Keluar',
                            data: {!! json_encode($dataKeluar) !!},
                            borderColor: '#ef4444',
                            backgroundColor: 'rgba(239, 68, 68, 0.1)',
                            borderWidth: 2,
                            fill: true,
                            tension: 0.3
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { labels: { color: textColor } } },
                    scales: {
                        y: { 
                            beginAtZero: true, 
                            grid: { color: gridColor },
                            ticks: { color: textColor }
                        },
                        x: { 
                            grid: { display: false },
                            ticks: { color: textColor }
                        }
                    }
                }
            });
        });
    </script>
    @endpush
</x-app-layout>
