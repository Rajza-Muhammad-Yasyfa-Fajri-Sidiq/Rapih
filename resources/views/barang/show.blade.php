<x-app-layout>
    <x-slot name="header">Detail Barang</x-slot>
    <div class="max-w-4xl">
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6 mb-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-4">
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Kode Barang</span><p class="font-mono font-medium text-gray-800 dark:text-gray-200">{{ $barang->kode_barang }}</p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Nama Barang</span><p class="font-medium text-gray-800 dark:text-gray-200">{{ $barang->nama_barang }}</p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Kategori</span><p class="text-gray-800 dark:text-gray-200">{{ $barang->kategori->nama_kategori ?? '-' }}</p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Satuan</span><p class="text-gray-800 dark:text-gray-200">{{ $barang->satuan->nama_satuan ?? '-' }}</p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Stok</span><p class="text-2xl font-bold {{ $barang->stok < $barang->stok_minimum ? 'text-red-600' : 'text-green-600' }}">{{ $barang->stok }} <span class="text-xs font-normal text-gray-400">(min: {{ $barang->stok_minimum }})</span></p></div>
                <div><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Harga Beli / Jual</span><p class="text-gray-800 dark:text-gray-200">Rp {{ number_format($barang->harga_beli,0,',','.') }} / Rp {{ number_format($barang->harga_jual,0,',','.') }}</p></div>
                <div class="md:col-span-2"><span class="text-xs text-gray-500 dark:text-gray-400 uppercase">Supplier</span>
                    <div class="flex flex-wrap gap-2 mt-1">
                        @forelse($barang->supplier as $sup)
                        <span class="px-2 py-1 bg-indigo-100 dark:bg-indigo-900 text-indigo-700 dark:text-indigo-300 text-xs rounded-full">{{ $sup->nama_supplier }}</span>
                        @empty
                        <span class="text-gray-400 text-sm">Tidak ada supplier</span>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
        @if($barang->images->count())
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
            <h3 class="text-sm font-semibold text-gray-700 dark:text-gray-300 mb-3">Galeri Gambar</h3>
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                @foreach($barang->images as $img)
                <img src="{{ asset('storage/' . $img->path) }}" class="w-full h-40 object-cover rounded-lg border dark:border-gray-600 hover:scale-105 transition cursor-pointer" onclick="window.open(this.src)">
                @endforeach
            </div>
        </div>
        @endif
        <div class="mt-4">
            <a href="{{ route('barang.index') }}" class="text-sm text-indigo-600 dark:text-indigo-400 hover:underline">← Kembali ke daftar barang</a>
        </div>
    </div>
</x-app-layout>
