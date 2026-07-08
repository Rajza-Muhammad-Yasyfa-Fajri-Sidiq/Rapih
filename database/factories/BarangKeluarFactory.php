<?php

namespace Database\Factories;

use App\Models\Barang;
use App\Models\BarangKeluar;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\BarangKeluar>
 */
class BarangKeluarFactory extends Factory
{
    protected $model = BarangKeluar::class;

    private static int $counter = 0;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        self::$counter++;

        return [
            'kode_transaksi' => 'BK-' . now()->format('Ymd') . '-' . str_pad(self::$counter, 4, '0', STR_PAD_LEFT),
            'barang_id' => Barang::inRandomOrder()->first()->id,
            'user_id' => User::inRandomOrder()->first()->id,
            'jumlah' => fake()->numberBetween(1, 20),
            'tanggal' => fake()->dateTimeBetween('-6 months', 'now')->format('Y-m-d'),
            'keterangan' => fake()->optional(0.5)->sentence(),
        ];
    }
}
