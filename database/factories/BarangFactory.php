<?php

namespace Database\Factories;

use App\Models\Barang;
use App\Models\KategoriBarang;
use App\Models\Satuan;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Barang>
 */
class BarangFactory extends Factory
{
    protected $model = Barang::class;

    private static int $counter = 0;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        self::$counter++;

        $namaBarang = [
            'Kertas HVS A4 70gsm', 'Pulpen Pilot G2', 'Tinta Printer Canon 790',
            'Buku Tulis Sidu 58 Lembar', 'Pensil 2B Faber Castell', 'Spidol Snowman Boardmarker',
            'Map Plastik Folio', 'Amplop Coklat Folio', 'Stapler Kenko HD-10',
            'Isi Staples No.10', 'Penghapus Steadtler', 'Penggaris 30cm',
            'Gunting Kenko', 'Lem Stick UHU 21g', 'Correction Pen Joyko',
            'Paper Clip No.3', 'Binder Clip 32mm', 'Post-it Note 3x3',
            'Kalkulator Casio MX-12B', 'Tipe-X Joyko',
        ];

        $index = (self::$counter - 1) % count($namaBarang);

        $hargaBeli = fake()->numberBetween(5, 200) * 1000;
        $hargaJual = $hargaBeli * fake()->randomFloat(2, 1.15, 1.50);

        return [
            'kode_barang' => 'BRG-' . str_pad(self::$counter, 4, '0', STR_PAD_LEFT),
            'nama_barang' => $namaBarang[$index],
            'kategori_barang_id' => KategoriBarang::inRandomOrder()->first()->id,
            'satuan_id' => Satuan::inRandomOrder()->first()->id,
            'stok' => 0, // stok dimulai dari 0, akan diupdate via transaksi
            'harga_beli' => $hargaBeli,
            'harga_jual' => round($hargaJual, -2),
            'stok_minimum' => fake()->randomElement([5, 10, 15, 20]),
        ];
    }
}
