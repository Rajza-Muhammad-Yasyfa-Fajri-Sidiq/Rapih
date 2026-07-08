<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class BarangImage extends Model
{
    protected $table = 'barang_images';

    protected $fillable = [
        'barang_id',
        'path',
    ];

    /**
     * Image belongs to barang.
     */
    public function barang(): BelongsTo
    {
        return $this->belongsTo(Barang::class, 'barang_id');
    }
}
