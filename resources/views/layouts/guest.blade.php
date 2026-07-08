<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Rapih Inventory') }} - Login</title>
        <link rel="icon" type="image/svg+xml" href="{{ asset('favicon.svg') }}">

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=inter:400,500,600,700&display=swap" rel="stylesheet" />

        <!-- Tailwind CSS CDN -->
        <script src="https://cdn.tailwindcss.com"></script>
        <script>
            tailwind.config = {
                darkMode: 'class',
                theme: {
                    extend: {
                        fontFamily: { sans: ['Inter', 'sans-serif'] },
                    }
                }
            }
        </script>

        <!-- Alpine.js -->
        <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>

        <style>
            [x-cloak] { display: none !important; }
            .glass-effect {
                background: rgba(255, 255, 255, 0.7);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.3);
            }
            .dark .glass-effect {
                background: rgba(17, 24, 39, 0.8);
                border: 1px solid rgba(255, 255, 255, 0.05);
            }
            .bg-animated {
                background: linear-gradient(-45deg, #4f46e5, #ec4899, #3b82f6, #10b981);
                background-size: 400% 400%;
                animation: gradient 15s ease infinite;
            }
            @keyframes gradient {
                0% { background-position: 0% 50%; }
                50% { background-position: 100% 50%; }
                100% { background-position: 0% 50%; }
            }
        </style>
    </head>
    <body class="font-sans text-gray-900 antialiased bg-animated">
        <div class="min-h-screen flex items-center justify-center p-4 sm:p-6">
            <div class="w-full max-w-5xl flex rounded-2xl shadow-2xl overflow-hidden glass-effect min-h-[600px]">
                
                <!-- Left Side: Branding / Visuals -->
                <div class="hidden lg:flex lg:w-1/2 relative bg-indigo-900/40 p-12 flex-col justify-between">
                    <div class="relative z-10">
                        <div class="flex items-center gap-3">
                            <div class="w-10 h-10 bg-white rounded-xl flex items-center justify-center shadow-lg">
                                <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"/></svg>
                            </div>
                            <span class="text-2xl font-bold text-white tracking-wide">RAPIH</span>
                        </div>
                        <h2 class="text-4xl font-bold text-white mt-16 leading-tight">Sistem<br>Inventaris<br>Modern.</h2>
                        <p class="text-indigo-100 mt-6 max-w-sm text-lg leading-relaxed">
                            Kelola stok barang masuk dan keluar dengan mudah, cepat, dan akurat untuk menunjang efisiensi operasional.
                        </p>
                    </div>

                    <!-- Abstract decorative elements -->
                    <div class="absolute bottom-0 right-0 p-8 z-0 opacity-50 pointer-events-none">
                        <div class="w-64 h-64 border-[30px] border-white/10 rounded-full absolute -bottom-16 -right-16 blur-xl"></div>
                        <div class="w-48 h-48 border-[20px] border-pink-400/20 rounded-full absolute bottom-24 right-20 blur-xl"></div>
                    </div>
                </div>

                <!-- Right Side: Auth Form -->
                <div class="w-full lg:w-1/2 p-8 sm:p-12 lg:p-16 flex flex-col justify-center bg-white/90 dark:bg-gray-900/90 relative z-10">
                    <div class="lg:hidden flex items-center gap-2 mb-8 justify-center">
                        <div class="w-8 h-8 bg-indigo-600 rounded-lg flex items-center justify-center">
                            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"/></svg>
                        </div>
                        <span class="text-xl font-bold text-gray-900 dark:text-white">RAPIH</span>
                    </div>
                    
                    {{ $slot }}
                </div>
            </div>
        </div>
    </body>
</html>
