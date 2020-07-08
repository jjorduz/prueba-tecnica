<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    


    public function autocompletar_usuario_email(Request $request)
    {

            try {
                if($request->ajax())
                {
                    
                    return Pacientes::selectRaw("email as label,
                    apellidos,
                    direccion,
                    direccion,
                    name")
                    ->where('email','like','%'.$request->email.'%')
                    ->get();
                }

            } catch (\Exception $e) {

            }

    }
}
