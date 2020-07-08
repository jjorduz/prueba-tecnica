<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Nucleos;
class PersonasController extends Controller
{
    public function index()
    {
        return User::latest()->get();
    }

    public function store(Request $request)
    {
        $u = User::where("email",$request->email);
        if($u->count()){
            return [
                "mensaje"=>"la persona ya se encuentra registrada.",
                "tipo"=> 2,
                "persona"=>$u
            ];
        } 
        $request["password"] = bcrypt(123456);
        $u = User::create($request->all());
        Nucleos::create([
            "user_id"=>$u->id,
            "id_padre"=>null
        ]);

        if(isset($request->jefe)){
            $jefe = User::where("identificacion",$request->jefe)->first();
            $nucleo = Nucleos::where("user_id",$jefe->id)
            ->whereNull("id_padre")
            ->first();            

            Nucleos::create([
                "user_id"=>$u->id,
                "id_padre"=>$nucleo->id
            ]);
           
        }
        
        return [
            "mensaje"=>"Creado con éxito",
            "tipo"=> 1
        ];
    }

    public function destroy($id){
        User::find($id)->delete();
        return ["mensaje"=>"Eliminado con éxito"];
    }
    public function update(Request $request,$id)
    {
        User::find($id)->fill($request->all())->update();
        return ["mensaje"=>"actualizado con éxito"];
    }
    public function get_nucleo($id)
    {
        $n1 = Nucleos::where("user_id",$id)
        ->whereNull("id_padre")
        ->first();

        if(is_null($n1)){
           return [];
        }else{
            $hijos = Nucleos::where("id_padre",$n1->id)
            ->pluck("user_id");
            
            return User::whereIn("id",$hijos)->get();
        }
    }
}
