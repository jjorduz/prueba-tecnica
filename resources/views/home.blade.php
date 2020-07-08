@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Administración núcleo Familiar</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    <div class="col-12 justify-content-end d-flex  mb-3">
                        <button 
                        type="button" 
                        id="btn-crear" 
                        class="btn btn-primary" 
                        > 
                            <i class="fa fa-plus"></i> Crear Registro
                        </button>
                    </div>
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table 
                            id="family" 
                            class="table table-hover table-striped table-sm w-100"
                            /> 
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal crear persona-->
        <div 
        class="modal fade" 
        id="modal-crear" 
        tabindex="-1" 
        role="dialog" 
        aria-labelledby="modal-crearLabel" 
        aria-hidden="true"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modal-crearLabel">
                            Formulario crear persona del nucleo Familiar
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="el-formulario">

                            <div class="row">
                                <div class="col-12 mb-2">
                                    <label for="jefe" class="mb-0">Cédula del jefe familiar</label>
                                    <input type="text" name="jefe" class="form-control form-control-sm">
                                    <span style="font-size: 12px;" class="text-muted">
                                        Digite el número de cédula si tiene ya un nucleo familiar de lo contrario no diligencia este campo.
                                    </span>
                                </div>
                                <div class="col-sm-4">
                                    <label for="identificacion" class="mb-0">Identificación</label>
                                    <input id="identificacion" type="text" name="identificacion" required class="form-control form-control-sm">
                                </div>
                                <div class="col-sm-4">
                                    <label for="nombres" class="mb-0">Nombres</label>
                                    <input id="nombres" type="text" name="name" required class="form-control form-control-sm">
                                </div>
                                <div class="col-sm-4">
                                    <label for="apellidos" class="mb-0">apellidos</label>
                                    <input id="apellidos" type="text" name="apellido" required class="form-control form-control-sm">
                                </div>
                                <div class="col-12 mt-2">
                                    <label for="correo" class="mb-0">Correo electrónico</label>
                                    <input id="correo" type="email" name="email" required class="form-control form-control-sm">
                                </div>
                                <div class="col-12 mt-2">
                                    <label for="direccion" class="mb-0">Dirección</label>
                                    <textarea id="direccion" name="direccion" required row="3" class="form-control form-control-sm" ></textarea>
                                </div>
                                <div class="col-12 mt-2 text-right">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                        Cerrar
                                    </button>
                                    <button type="submit" class="btn btn-primary">
                                        Guardar
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal ver nucleo -->
        <div 
        class="modal fade" 
        id="modal-ver-nucleo" 
        tabindex="-1" 
        role="dialog" 
        aria-labelledby="modal-ver-nucleoLabel" 
        aria-hidden="true"
        >
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="modal-ver-nucleoLabel">Nucleo familiar</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                    <div id="contenedor-hijos" class="row"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
            </div>
        </div>
    </div>

    <!-- plantilla de hijos -->
    <template id="plantilla1">
        <div class="col-sm-12">
            <div>identificacion</div>
            <div>nombres - apellidos</div>
        </div>
    </template>
</div>
@endsection

@section('js')
<script src="/js/principal.js"></script>
@endsection

