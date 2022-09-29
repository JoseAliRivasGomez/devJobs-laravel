<?php

namespace App\Models;

use App\Models\User;
use App\Models\Salario;
use App\Models\Candidato;
use App\Models\Categoria;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Vacante extends Model
{
    use HasFactory;

    protected $dates = ['ultimo_dia'];

    protected $fillable = [
        'titulo',
        'salario_id',
        'categoria_id',
        'user_id',
        'empresa',
        'ultimo_dia',
        'descripcion',
        'imagen',
    ];

    public function categoria() {
        return $this->belongsTo(Categoria::class);
    }

    public function salario() {
        return $this->belongsTo(Salario::class);
    }

    public function candidatos() {
        return $this->hasMany(Candidato::class)->orderBy('created_at', 'desc');
    }

    public function reclutador() {
        return $this->belongsTo(User::class, 'user_id');
    }
}
