<?php

namespace Database\Seeders;

use App\Models\Barang;
use App\Models\Supplier;
use Illuminate\Database\Seeder;

class BarangSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $barangList = Barang::factory(20)->create();

        // Assign random suppliers (many-to-many) ke tiap barang
        $supplierIds = Supplier::pluck('id')->toArray();

        foreach ($barangList as $barang) {
            $randomSuppliers = fake()->randomElements($supplierIds, fake()->numberBetween(1, 3));
            $barang->supplier()->attach($randomSuppliers);

            // Seed dummy images
            $imageCount = fake()->numberBetween(1, 3);
            for ($i = 0; $i < $imageCount; $i++) {
                $dummyImage = fake()->randomElement(['dummy1.jpg', 'dummy2.jpg', 'dummy3.jpg']);
                $barang->images()->create([
                    'path' => 'barang_images/' . $dummyImage
                ]);
            }
        }
    }
}
