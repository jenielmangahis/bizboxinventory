<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Inventory extends Model
{
    use SoftDeletes;

    public function item()
    {
        return $this->belongsTo('App\Item');
    }  
}
