<x-app-layout>
    <x-slot name="header">Edit Satuan</x-slot>
    <div class="max-w-2xl">
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
            <form method="POST" action="{{ route('satuan.update', $satuan) }}">
                @csrf @method('PUT')
                <div class="mb-6">
                    <label class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">Nama Satuan <span class="text-red-500">*</span></label>
                    <input type="text" name="nama_satuan" value="{{ old('nama_satuan', $satuan->nama_satuan) }}" required class="w-full rounded-lg border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white text-sm focus:ring-indigo-500 focus:border-indigo-500">
                </div>
                <div class="flex gap-3">
                    <button type="submit" class="px-6 py-2 bg-indigo-600 text-white text-sm font-medium rounded-lg hover:bg-indigo-700 transition">Perbarui</button>
                    <a href="{{ route('satuan.index') }}" class="px-6 py-2 bg-gray-200 dark:bg-gray-600 text-gray-700 dark:text-gray-300 text-sm font-medium rounded-lg hover:bg-gray-300 dark:hover:bg-gray-500 transition">Batal</a>
                </div>
            </form>
        </div>
    </div>
</x-app-layout>
