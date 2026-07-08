<x-app-layout>
    <x-slot name="header">Detail Barang Masuk</x-slot>
    <div class="max-w-2xl">
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-4">
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Kode Transaksi</span><p class="font-mono font-bold text-gray-800 dark:text-gray-200">{{ $barangMasuk->kode_transaksi }}</p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Tanggal</span><p class="text-gray-800 dark:text-gray-200">{{ $barangMasuk->tanggal->format('d F Y') }}</p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Barang</span><p class="font-medium text-gray-800 dark:text-gray-200">{{ $barangMasuk->barang->kode_barang ?? '-' }} - {{ $barangMasuk->barang->nama_barang ?? '-' }}</p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Supplier</span><p class="text-gray-800 dark:text-gray-200">{{ $barangMasuk->supplier->nama_supplier ?? '-' }}</p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Jumlah Masuk</span><p class="text-2xl font-bold text-green-600 dark:text-green-400">+{{ $barangMasuk->jumlah }} {{ $barangMasuk->barang->satuan->nama_satuan ?? '' }}</p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Harga Beli</span><p class="text-gray-800 dark:text-gray-200">Rp {{ number_format($barangMasuk->harga_beli, 0, ',', '.') }}</p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Dicatat Oleh (Petugas)</span><p class="text-gray-800 dark:text-gray-200">{{ $barangMasuk->user->name ?? '-' }}</p></div>
                <div class="md:col-span-2"><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Keterangan</span><p class="text-gray-800 dark:text-gray-200">{{ $barangMasuk->keterangan ?? '-' }}</p></div>
            </div>
        </div>
        <div class="mt-4">
            <a href="{{ route('barang-masuk.index') }}" class="text-sm text-indigo-600 dark:text-indigo-400 hover:underline">← Kembali ke histori barang masuk</a>
        </div>
    </div>
</x-app-layout>
