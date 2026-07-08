<x-app-layout>
    <x-slot name="header">Profil</x-slot>

    <div class="space-y-6 max-w-4xl">
        <div class="p-6 sm:p-8 bg-white dark:bg-gray-800 shadow rounded-xl">
            <div class="max-w-xl">
                @include('profile.partials.update-profile-information-form')
            </div>
        </div>

        <div class="p-6 sm:p-8 bg-white dark:bg-gray-800 shadow rounded-xl">
            <div class="max-w-xl">
                @include('profile.partials.update-password-form')
            </div>
        </div>

        <div class="p-6 sm:p-8 bg-white dark:bg-gray-800 shadow rounded-xl border border-red-100 dark:border-red-900/50">
            <div class="max-w-xl">
                @include('profile.partials.delete-user-form')
            </div>
        </div>
    </div>
</x-app-layout>
