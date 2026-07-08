<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\BarangImage;
use App\Models\KategoriBarang;
use App\Models\Satuan;
use App\Models\Supplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class BarangController extends Controller
{
    public function index(Request $request)
    {
        $query = Barang::with(['kategori', 'satuan']);
        if ($request->filled('search')) {
            $query->where(function ($q) use ($request) {
                $q->where('nama_barang', 'like', '%' . $request->search . '%')
                  ->orWhere('kode_barang', 'like', '%' . $request->search . '%');
            });
        }
        $barangs = $query->latest()->paginate(10)->withQueryString();
        return view('barang.index', compact('barangs'));
    }

    public function create()
    {
        $kategoris = KategoriBarang::all();
        $satuans = Satuan::all();
        $suppliers = Supplier::all();
        return view('barang.create', compact('kategoris', 'satuans', 'suppliers'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'kode_barang' => 'required|string|max:50|unique:barang,kode_barang',
            'nama_barang' => 'required|string|max:255',
            'kategori_barang_id' => 'required|exists:kategori_barang,id',
            'satuan_id' => 'required|exists:satuan,id',
            'harga_beli' => 'required|numeric|min:0',
            'harga_jual' => 'required|numeric|min:0',
            'stok_minimum' => 'required|integer|min:0',
            'supplier_ids' => 'nullable|array',
            'supplier_ids.*' => 'exists:supplier,id',
            'images' => 'nullable|array',
            'images.*' => 'image|mimes:jpeg,png,jpg,gif,webp|max:2048',
        ]);

        $barang = Barang::create($request->only(
            'kode_barang', 'nama_barang', 'kategori_barang_id', 'satuan_id',
            'harga_beli', 'harga_jual', 'stok_minimum'
        ));

        if ($request->has('supplier_ids')) {
            $barang->supplier()->attach($request->supplier_ids);
        }

        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $path = $image->store('barang', 'public');
                BarangImage::create(['barang_id' => $barang->id, 'path' => $path]);
            }
        }

        return redirect()->route('barang.index')->with('success', 'Barang berhasil ditambahkan.');
    }

    public function show(Barang $barang)
    {
        $barang->load(['kategori', 'satuan', 'supplier', 'images']);
        return view('barang.show', compact('barang'));
    }

    public function edit(Barang $barang)
    {
        $barang->load(['supplier', 'images']);
        $kategoris = KategoriBarang::all();
        $satuans = Satuan::all();
        $suppliers = Supplier::all();
        return view('barang.edit', compact('barang', 'kategoris', 'satuans', 'suppliers'));
    }

    public function update(Request $request, Barang $barang)
    {
        $request->validate([
            'kode_barang' => 'required|string|max:50|unique:barang,kode_barang,' . $barang->id,
            'nama_barang' => 'required|string|max:255',
            'kategori_barang_id' => 'required|exists:kategori_barang,id',
            'satuan_id' => 'required|exists:satuan,id',
            'harga_beli' => 'required|numeric|min:0',
            'harga_jual' => 'required|numeric|min:0',
            'stok_minimum' => 'required|integer|min:0',
            'supplier_ids' => 'nullable|array',
            'supplier_ids.*' => 'exists:supplier,id',
            'images' => 'nullable|array',
            'images.*' => 'image|mimes:jpeg,png,jpg,gif,webp|max:2048',
            'delete_images' => 'nullable|array',
            'delete_images.*' => 'exists:barang_images,id',
        ]);

        $barang->update($request->only(
            'kode_barang', 'nama_barang', 'kategori_barang_id', 'satuan_id',
            'harga_beli', 'harga_jual', 'stok_minimum'
        ));

        $barang->supplier()->sync($request->supplier_ids ?? []);

        // Delete selected images
        if ($request->has('delete_images')) {
            foreach ($request->delete_images as $imageId) {
                $img = BarangImage::find($imageId);
                if ($img) {
                    Storage::disk('public')->delete($img->path);
                    $img->delete();
                }
            }
        }

        // Add new images
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $path = $image->store('barang', 'public');
                BarangImage::create(['barang_id' => $barang->id, 'path' => $path]);
            }
        }

        return redirect()->route('barang.index')->with('success', 'Barang berhasil diperbarui.');
    }

    public function destroy(Barang $barang)
    {
        // Delete associated images from storage
        foreach ($barang->images as $img) {
            Storage::disk('public')->delete($img->path);
        }
        $barang->delete();
        return redirect()->route('barang.index')->with('success', 'Barang berhasil dihapus.');
    }
}
