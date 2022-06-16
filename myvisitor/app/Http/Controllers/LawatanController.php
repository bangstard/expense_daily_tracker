<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Lawatan;
use App\Models\Pelawat;
use Illuminate\Http\Request;

class LawatanController extends Controller
{
    public function storeInfoeKonsular(Request $request)
    {

        $this->validate($request, [
            'nama' => 'required|string|min:4|max:80',
            'no_telefon'  => 'required|string|max:20',
            'no_pengenalan'  => 'required|alpha_num|string|max:20',

        ]);

        $pelawatID = Pelawat::where('no_pengenalan', request('no_pengenalan'))->first();

        if ($pelawatID !== null) {
            $pelawatID->update([
                /*'nama' =>  $request->nama,*/
                'no_telefon'   => $request->no_telefon,
                'tkh_kemaskini' => Carbon::now(),
            ]);
        } else {
            $pelawatID = Pelawat::create([
                'no_pengenalan' => $request->no_pengenalan,
                'nama' => $request->nama,
                'no_telefon'   => $request->no_telefon,
                'id_tujuan'   => 1,
                'tkh_kemaskini' => Carbon::now(),
                //'vaksin'=> 1,

            ]);
        }

        $visit = Lawatan::create([
            'id_tujuan'   => 1,
            'id_pelawat'  => $pelawatID->id_pelawat,
            'id_lokasi'   => 2,
            'tkh_lawatan' => Carbon::now(),
        ]);

        return response()->json(['status' => 'success', 'title' => '' . __('Berjaya!') . '', 'message' => '' . __('Data baru telah ditambah.') . '']);

    }
}
