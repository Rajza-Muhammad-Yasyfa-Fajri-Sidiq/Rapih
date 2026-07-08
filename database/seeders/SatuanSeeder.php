<?php

namespace Database\Seeders;

use App\Models\Satuan;
use Illuminate\Database\Seeder;

class SatuanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $satuans = ['pcs', 'box', 'rim', 'lusin'];

        foreach ($satuans as $satuan) {
            Satuan::create(['nama_satuan' => $satuan]);
        }
    }
}
