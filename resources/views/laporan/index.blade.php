<x-app-layout>
    <x-slot name="header">Laporan & Export</x-slot>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 max-w-4xl">
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6 flex flex-col items-center justify-center text-center">
            <div class="w-16 h-16 bg-green-100 dark:bg-green-900/30 text-green-600 dark:text-green-400 rounded-full flex items-center justify-center mb-4">
                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 17v-2m3 2v-4m3 4v-6m2 10H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
            </div>
            <h3 class="text-lg font-bold text-gray-800 dark:text-gray-200 mb-2">Laporan Stok (Excel)</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400 mb-6">Unduh laporan stok barang menyeluruh dalam format Microsoft Excel (.xlsx) untuk diolah lebih lanjut.</p>
            <a href="{{ route('laporan.export-excel') }}" class="w-full py-2.5 bg-green-600 text-white font-medium rounded-lg hover:bg-green-700 transition">Download Excel</a>
        </div>
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6 flex flex-col items-center justify-center text-center">
            <div class="w-16 h-16 bg-red-100 dark:bg-red-900/30 text-red-600 dark:text-red-400 rounded-full flex items-center justify-center mb-4">
                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 21h10a2 2 0 002-2V9.414a1 1 0 00-.293-.707l-5.414-5.414A1 1 0 0012.586 3H7a2 2 0 00-2 2v14a2 2 0 002 2z"/></svg>
            </div>
            <h3 class="text-lg font-bold text-gray-800 dark:text-gray-200 mb-2">Laporan Stok (PDF)</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400 mb-6">Unduh laporan stok barang dalam format dokumen PDF yang siap dicetak.</p>
            <a href="{{ route('laporan.export-pdf') }}" class="w-full py-2.5 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition">Download PDF</a>
        </div>
    </div>
</x-app-layout>
