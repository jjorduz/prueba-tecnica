<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Nucleos extends Model
{
    protected $fillable = [
        "user_id",
        "id_padre"
    ];
}
