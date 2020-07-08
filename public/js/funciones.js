class Funciones{
 constructor(){

 }

 static autocompletar_usuario_email(config)
 {

     let url = '/autocompletar_usuario_email';
     config.email.autocomplete({
         source:(request,response)=>{
             $.ajax({
                 url:url,
                 method:'post',
                 data:{email:request.term},                    
                   success:response                    
             }).done(function(response){
                 var longitud = response.length;
                 if(longitud == 0)
                 {
                     toastr.error('Email no existe aun','Registrate con ese Email',{timeOut:1000});
                     //alert('busqueda sin resultados');
                 }else{
                     console.log(response);
                     //toastr.success( response[0].nombres + ' ' + response[0].apellidos, 'Usuario:', {timeOut: 5000})
                 }

                 
             });
         },
         select:(e,ui)=>{  
             var celpatient = ui.item.label;
             config.nombres.val(ui.item.nombres + ' '+ ui.item.apellidos);
             config.na.val(ui.item.direccion);
             config.ciudad.val(ui.item.nro_documento);
             if(ui.item.regimen_eps)
             {
                 config.regimen_eps.val('CONTRIBUTIBO')
             }else{
                 config.regimen_eps.val('SUBSIDIADO')
             }
             //codigo para calcular la edad
             var hoy = new Date();
             var cumpleanos = new Date(ui.item.fecha_nacimiento);
             var edad = (hoy.getFullYear() - cumpleanos.getFullYear());

             var m = hoy.getMonth() -cumpleanos.getMonth();
             if (m < 0 || (m === 0 && hoy.getDate() < cumpleanos.getDate())) {
                 edad--;
             }
             $('#edad').val(edad);
             $.ajax({
                 url: '/software/historias/llenartablenuevo',
                 type: 'post',
                 dataType: 'json',
                 data:{id:celpatient},
                 success:function(resp){                        
                      tablahistorias.clear().draw();
                      tablahistorias.rows.add(resp).draw();
                     var inputs = $('#form-historias :input');
                     var este = $('.antecedentes_id');
                     inputs.not(este).val('');                         
                      tabla.clear().draw();
                      tablamedi.clear().draw();
                      tablaprocedi.clear().draw();
                      tablaadjun.clear().draw();
                      $('#form-historias :input').attr('disabled','true');
                      $('.accordion button').removeAttr("disabled");
                      $('#headingSix button').removeAttr("disabled")
                      $('#identificacion').attr('disabled','true');
                      $('#nombres').attr('disabled','true');
                      $('#regimen_eps').attr('disabled','true');
                      $('#direccion').attr('disabled','true');
                      $('#edad').attr('disabled','true');
                      $('#ciudad').attr('disabled','true');
                 }
             })
         }
     })
 }


}