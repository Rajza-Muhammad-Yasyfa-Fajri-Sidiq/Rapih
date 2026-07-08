<x-app-layout>
    <x-slot name="header">Activity Log</x-slot>
    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 mb-6">
        <form method="GET" class="flex gap-2">
            <input type="text" name="search" value="{{ request('search') }}" placeholder="Cari log..." class="rounded-lg border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white text-sm px-4 py-2 w-64 focus:ring-indigo-500 focus:border-indigo-500">
            <button type="submit" class="px-4 py-2 bg-indigo-600 text-white text-sm rounded-lg hover:bg-indigo-700 transition">Cari</button>
        </form>
    </div>
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow overflow-hidden">
        <table class="w-full text-sm text-left">
            <thead class="bg-gray-50 dark:bg-gray-700 text-gray-600 dark:text-gray-300 uppercase text-xs">
                <tr><th class="px-6 py-3">Waktu</th><th class="px-6 py-3">Aktor</th><th class="px-6 py-3">Aktivitas</th><th class="px-6 py-3">Subject</th></tr>
            </thead>
            <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                @forelse($activities as $log)
                <tr class="hover:bg-gray-50 dark:hover:bg-gray-700/50 text-gray-700 dark:text-gray-300">
                    <td class="px-6 py-4">{{ $log->created_at->format('d/m/Y H:i:s') }}</td>
                    <td class="px-6 py-4">{{ $log->causer->name ?? 'System' }}</td>
                    <td class="px-6 py-4">
                        <span class="px-2 py-1 rounded text-xs font-semibold
                            @if($log->description == 'created') bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400
                            @elseif($log->description == 'updated') bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400
                            @elseif($log->description == 'deleted') bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400
                            @else bg-gray-100 text-gray-700 dark:bg-gray-700 dark:text-gray-300 @endif
                        ">{{ ucfirst($log->description) }}</span>
                    </td>
                    <td class="px-6 py-4 font-mono text-xs">{{ class_basename($log->subject_type) }} #{{ $log->subject_id }}</td>
                </tr>
                @empty
                <tr><td colspan="4" class="px-6 py-8 text-center text-gray-400">Tidak ada log aktivitas.</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <div class="mt-4">{{ $activities->links() }}</div>
</x-app-layout>
