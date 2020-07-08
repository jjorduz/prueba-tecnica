
var tabla = null
var esEditar = false
var personaId = null

const crear = (evt)=>{
    esEditar = false
    $('#modal-crear').modal('toggle')
}

const guardar = (evt)=>{
    evt.preventDefault()
    
    let formulario = $('#el-formulario')
    let data = $(formulario).serialize()
    $.ajax({
        url: esEditar ? `/personas/${personaId}` :  '/personas',
        method: esEditar ? 'PUT' : 'POST' ,
        data,
        success(response){
            
            formulario[0].reset()
            $("#modal-crear").modal('toggle')
            listar()
        }
    })
}

const eliminar = (evt)=>{
    let id = evt.target.dataset.id

    $.ajax({
        url: `/personas/${id}`,
        method: 'DELETE',
        success(response){
            console.log(response);
            listar()
            alert(response.mensaje)
        }
    })

}

const listar = ()=>{
    $.ajax({
        url: 'personas',
        method: 'GET',
        success(response){
            console.log(response);
            tabla.clear().draw()
            tabla.rows.add(response).draw()
        }
    })
}

const editar = (evt)=>{    
    esEditar = true
    let info = tabla.row(evt.target.closest('tr')).data()
    personaId = info.id
    $('#modal-crear').modal('toggle')
    for (let [key,value]  of Object.entries(info)){
        $(`[name='${key}']`).val(value)
    }
}

const nucleoVer = (evt)=>{
    $('#modal-ver-nucleo').modal('toggle')
    let id = evt.target.dataset.id
    $.ajax({
        url: `/personas/nucleo/${id}`,
        method: 'GET',
        success(response){
            $("#contenedor-hijos").html('')
            let k = 1;
            for (let row of response) {
                $("#contenedor-hijos").append(`
                <div class="col-sm-12 d-flex">
                    <div class="mr-1">${k}</div>
                    <div class="mr-1">${row.identificacion}</div>
                    <div class="text-capitalize">${row.name} - ${row.apellido}</div>
                </div>
                `)
                k++
            }
        }
    })
}
$(()=>{
    

    tabla = $("#family").DataTable({
        order: [[ 0, "asc" ]],
        columns:[
            {
                title: 'nombres',
                data: 'name'
            },
            {
                title: 'apellidos',
                data: 'apellido'
            },
            {
                title: 'Correo electrónico',
                data: 'email'
            },
            {
                title: 'Dirección',
                data: 'direccion'
            },
            {
                title: 'Acciones',
                data: null,
                width: 220,
                render(data,type,row,meta){
                    return `
                    <div class="w-100 text-right">
                        <button type="button" class="btn-nucleo btn-sm btn-info m-1" data-id="${data.id}"> Ver nucleo </button>
                        <button type="button" class="btn-editar btn-sm btn-primary m-1" data-id="${data.id}"> Editar </button>
                        <button type="button" class="btn-eliminar btn-sm btn-danger m-1" data-id="${data.id}"> Eliminar </button>
                    </div>
                    `
                }
            },
        ],
        data: []
    })

    $('#btn-crear').on('click',crear)
    $("#el-formulario").on('submit',guardar)
    $(document).on('click','.btn-eliminar',eliminar)
    $(document).on('click','.btn-editar',editar)
    $(document).on('click','.btn-nucleo',nucleoVer)

    listar()
})