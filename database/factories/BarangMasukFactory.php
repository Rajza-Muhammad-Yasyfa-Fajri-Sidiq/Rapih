<?php

namespace Database\Factories;

use App\Models\Barang;
use App\Models\BarangMasuk;
use App\Models\Supplier;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\BarangMasuk>
 */
class BarangMasukFactory extends Factory
{
    protected $model = BarangMasuk::class;

    private static int $counter = 0;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        self::$counter++;

        $barang = Barang::inRandomOrder()->first();

        return [
            'kode_transaksi' => 'BM-' . now()->format('Ymd') . '-' . str_pad(self::$counter, 4, '0', STR_PAD_LEFT),
            'barang_id' => $barang->id,
            'supplier_id' => Supplier::inRandomOrder()->first()->id,
            'user_id' => User::inRandomOrder()->first()->id,
            'jumlah' => fake()->numberBetween(10, 100),
            'harga_beli' => $barang->harga_beli,
            'tanggal' => fake()->dateTimeBetween('-6 months', 'now')->format('Y-m-d'),
            'keterangan' => fake()->optional(0.5)->sentence(),
        ];
    }
}
