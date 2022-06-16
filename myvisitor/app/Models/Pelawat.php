<?php

namespace App\Models;

use App\Models\Lawatan;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Pelawat extends Model
{
    use HasFactory;

    protected $table ='pelawat';

    protected $primaryKey = 'id_pelawat';

    protected $fillable = [
        'id_pelawat',
        'nama',
        'no_pengenalan',
        'no_telefon',
        'id_tujuan',
        'emel',
        'katalaluan',
        'dikemaskini_oleh',
        'tkh_kemaskini',
        'otp',
        'otp_timestamp',
        'aktif',
        'status_blacklist',
        'sebab_blacklist',
        'vaksin',
        'warganegara',
        ];

        public function lawatan()
        {
            $this->belongsTo(Lawatan::class);
        }

}
