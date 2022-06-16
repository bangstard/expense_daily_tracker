<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lawatan', function (Blueprint $table) {
            $table->increments('id_lawatan');
            $table->foreignId('id_pelawat')->nullable()->constrained('pelawat', 'id_pelawat')->comment('pelawat');
            $table->integer('id_tujuan')->nullable()->comment('lkp_tujuan');
            $table->integer('id_lokasi')->nullable()->comment('lkp_lokasi');
            $table->datetime('tkh_lawatan')->nullable();
            $table->datetime('masa_keluar')->nullable();
            $table->string('id_pas', 6)->nullable();
            $table->integer('id_barang_pinjam')->nullable()->comment('lkp_barang_pinjam');
            $table->string('serah_pas_oleh', 12)->nullable();
            $table->datetime('tkh_serah_pas')->nullable();
            $table->string('pulang_pas_oleh', 12)->nullable();
            $table->datetime('tkh_pulang_pas')->nullable();
            $table->integer('id_status_pulang_pas')->nullable()->comment('0-belum pulangkan, 1-telah pulangkan');
            $table->integer('id_status_pulang_barang')->nullable()->comment('0-belum pulangkan, 1-telah pulangkan');
            $table->integer('id_status_pelawat')->default('1')->comment('lkp_status_pelawat');
            $table->string('dikemaskini_oleh', 12)->nullable();
            $table->datetime('tkh_kemaskini')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('lawatan');
    }
};
