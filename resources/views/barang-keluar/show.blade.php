<x-app-layout>
    <x-slot name="header">Detail Barang Keluar</x-slot>
    <div class="max-w-2xl">
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-4">
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Kode Transaksi</span><p class="font-mono font-bold text-gray-800 dark:text-gray-200">{{ $barangKeluar->kode_transaksi }}</p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Tanggal</span><p class="text-gray-800 dark:text-gray-200">{{ $barangKeluar->tanggal->format('d F Y') }}</p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Barang</span><p class="font-medium text-gray-800 dark:text-gray-200">{{ $barangKeluar->barang->kode_barang ?? '-' }} - {{ $barangKeluar->barang->nama_barang ?? '-' }}</p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Jumlah Keluar</span><p class="text-2xl font-bold text-red-600 dark:text-red-400">-{{ $barangKeluar->jumlah }} {{ $barangKeluar->barang->satuan->nama_satuan ?? '' }}</p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Dicatat Oleh (Petugas)</span><p class="text-gray-800 dark:text-gray-200">{{ $barangKeluar->user->name ?? '-' }}</p></div>
                <div class="md:col-span-2"><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Keterangan / Tujuan</span><p class="text-gray-800 dark:text-gray-200">{{ $barangKeluar->keterangan ?? '-' }}</p></div>
            </div>
        </div>
        <div class="mt-4">
            <a href="{{ route('barang-keluar.index') }}" class="text-sm text-indigo-600 dark:text-indigo-400 hover:underline">← Kembali ke histori barang keluar</a>
        </div>
    </div>
</x-app-layout>
