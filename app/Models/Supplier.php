<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Supplier extends Model
{
    use HasFactory;

    protected $table = 'supplier';

    protected $fillable = [
        'nama_supplier',
        'alamat',
        'telepon',
        'email',
    ];

    /**
     * Supplier belongs to many barang (many-to-many).
     */
    public function barang(): BelongsToMany
    {
        return $this->belongsToMany(Barang::class, 'barang_supplier', 'supplier_id', 'barang_id')->withTimestamps();
    }

    /**
     * Supplier has many barang masuk.
     */
    public function barangMasuk(): HasMany
    {
        return $this->hasMany(BarangMasuk::class, 'supplier_id');
    }
}
