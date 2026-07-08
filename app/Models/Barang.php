<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Spatie\Activitylog\Support\LogOptions;
use Spatie\Activitylog\Models\Concerns\LogsActivity;

class Barang extends Model
{
    use HasFactory, LogsActivity;

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()->logFillable()->logOnlyDirty();
    }

    protected $table = 'barang';

    protected $fillable = [
        'kode_barang',
        'nama_barang',
        'kategori_barang_id',
        'satuan_id',
        'stok',
        'harga_beli',
        'harga_jual',
        'stok_minimum',
    ];

    /**
     * Barang belongs to kategori.
     */
    public function kategori(): BelongsTo
    {
        return $this->belongsTo(KategoriBarang::class, 'kategori_barang_id');
    }

    /**
     * Barang belongs to satuan.
     */
    public function satuan(): BelongsTo
    {
        return $this->belongsTo(Satuan::class, 'satuan_id');
    }

    /**
     * Barang belongs to many supplier (many-to-many).
     */
    public function supplier(): BelongsToMany
    {
        return $this->belongsToMany(Supplier::class, 'barang_supplier', 'barang_id', 'supplier_id')->withTimestamps();
    }

    /**
     * Barang has many images.
     */
    public function images(): HasMany
    {
        return $this->hasMany(BarangImage::class, 'barang_id');
    }

    /**
     * Barang has many barang masuk.
     */
    public function barangMasuk(): HasMany
    {
        return $this->hasMany(BarangMasuk::class, 'barang_id');
    }

    /**
     * Barang has many barang keluar.
     */
    public function barangKeluar(): HasMany
    {
        return $this->hasMany(BarangKeluar::class, 'barang_id');
    }
}
