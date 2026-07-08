<x-app-layout>
    <x-slot name="header">Barang Masuk</x-slot>
    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 mb-6">
        <form method="GET" class="flex gap-2">
            <input type="text" name="search" value="{{ request('search') }}" placeholder="Cari kode/nama barang..." class="rounded-lg border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white text-sm px-4 py-2 w-64 focus:ring-indigo-500 focus:border-indigo-500">
            <button type="submit" class="px-4 py-2 bg-indigo-600 text-white text-sm rounded-lg hover:bg-indigo-700 transition">Cari</button>
        </form>
        <a href="{{ route('barang-masuk.create') }}" class="inline-flex items-center gap-2 px-4 py-2 bg-indigo-600 text-white text-sm font-medium rounded-lg hover:bg-indigo-700 transition">
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/></svg>
            Catat Barang Masuk
        </a>
    </div>
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow overflow-x-auto">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 dark:bg-gray-700 text-gray-600 dark:text-gray-300 uppercase text-xs">
                <tr>
                    <th class="px-4 py-3">Tanggal</th><th class="px-4 py-3">Kode Transaksi</th><th class="px-4 py-3">Barang</th>
                    <th class="px-4 py-3">Supplier</th><th class="px-4 py-3 text-right">Jumlah</th><th class="px-4 py-3">Petugas</th><th class="px-4 py-3">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                @forelse($barangMasuks as $bm)
                <tr class="hover:bg-gray-50 dark:hover:bg-gray-700/50 text-gray-700 dark:text-gray-300">
                    <td class="px-4 py-3">{{ $bm->tanggal->format('d/m/Y') }}</td>
                    <td class="px-4 py-3 font-mono text-xs">{{ $bm->kode_transaksi }}</td>
                    <td class="px-4 py-3 font-medium">{{ $bm->barang->nama_barang ?? '-' }}</td>
                    <td class="px-4 py-3">{{ $bm->supplier->nama_supplier ?? '-' }}</td>
                    <td class="px-4 py-3 text-right text-green-600 dark:text-green-400 font-bold">+{{ $bm->jumlah }}</td>
                    <td class="px-4 py-3">{{ $bm->user->name ?? '-' }}</td>
                    <td class="px-4 py-3">
                        <a href="{{ route('barang-masuk.show', $bm) }}" class="inline-flex p-1.5 bg-emerald-50 text-emerald-600 hover:bg-emerald-100 dark:bg-emerald-500/10 dark:text-emerald-400 dark:hover:bg-emerald-500/20 rounded-lg transition-colors" title="Detail">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" /><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" /></svg>
                        </a>
                    </td>
                </tr>
                @empty
                <tr><td colspan="7" class="px-4 py-8 text-center text-gray-400">Tidak ada transaksi barang masuk.</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $barangMasuks->links() }}</div>
</x-app-layout>
