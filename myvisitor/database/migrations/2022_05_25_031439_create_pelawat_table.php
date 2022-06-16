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
        Schema::create('pelawat', function (Blueprint $table) {
            $table->increments('id_pelawat');
            $table->string('nama', 80)->nullable();
            $table->string('no_pengenalan', 20)->nullable()->comment('No. MyKad / pasport pelawat');
            $table->string('no_telefon', 20)->nullable();
            $table->integer('id_tujuan')->nullable();
            $table->string('emel', 50)->nullable();
            $table->string('katalaluan', 32)->nullable();
            $table->string('dikemaskini_oleh', 12)->nullable();
            $table->datetime('tkh_kemaskini')->nullable();
            $table->integer('otp')->nullable();
            $table->timestamps();
            $table->tinyInteger('aktif')->default(0);
            $table->integer('status_blacklist')->default('0');
            $table->tinyText('sebab_blacklist')->nullable();
            $table->integer('vaksin')->nullable()->comment('0-tidak divaksin, 1-Telah divaksin');
            $table->integer('warganegara')->nullable()->comment('0-warganegara, 1-bukan warganegara');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pelawat');
    }
};
