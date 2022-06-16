<?php

namespace App\Models;

use App\Models\Pelawat;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Lawatan extends Model
{
    use HasFactory;

    protected $table = 'lawatan';

    protected $fillable = [
        'id_lawatan',
        'id_pelawat',
        'id_tujuan',
        'id_lokasi',
        'tkh_lawatan',
        'masa_keluar',
        'id_pas',
        'id_barang_pinjam',
        'serah_pas_oleh',
        'tkh_serah_pas',
        'pulang_pas_oleh',
        'tkh_pulang_pas',
        'id_status_pulang_pas',
        'id_status_pulang_barang',
        'id_status_pelawat',
        'dikemaskini_oleh',
        'tkh_kemaskini',
    ];

    public function pelawat()
    {
        $this->hasOne(Pelawat::class);
    }
}
