var hid_conferencia;
var txt_nombres;
var txt_apellidos;
var txt_correo;
var txt_celular;
var txt_edad;
var sel_pais;
var sel_fuente;
var txt_iglesia;
var sel_cargo;
var btn_registro;
var form_registro_conferencia_validation;

var HttpCodes = {
    success  : 200,
    unprocessableentity : 422,
    error  : 500
};

$(document).ready(function(){
    initVariables();
    initComponentes();
});

function initVariables() {
    hid_conferencia = $("#hid_conferencia");
    txt_nombres = $("#txt_nombres");
    txt_apellidos = $("#txt_apellidos");
    txt_correo = $("#txt_correo");
    txt_celular = $("#txt_celular");
    txt_edad = $("#txt_edad");
    sel_pais = $("#sel_pais");
    sel_fuente = $("#sel_fuente");
    txt_iglesia = $("#txt_iglesia");
    sel_cargo = $("#sel_cargo");
    btn_registro = $("#btn_registro");
}

function initComponentes() {

    validacionFormularioRegistroConferencia();

    btn_registro.on("click", function(){

        form_registro_conferencia_validation.validate().then(function(status) {
            if(status === 'Valid') {
                registrarParticipanteConferencia();
            }
        });
    });
}

function validacionFormularioRegistroConferencia() {

    form_registro_conferencia_validation = FormValidation.formValidation(document.getElementById('form_conferencia'),
            {
                fields: {
                    txt_nombres: {
                        validators: {
                            notEmpty: {
                                message: 'Los nombres son obligatorios.',
                            },
                            stringLength: {
                                max: 200,
                                message: 'Los nombres no puede sobrepasar 200 caracteres.',
                            },
                        },
                    },
                    txt_apellidos: {
                        validators: {
                            notEmpty: {
                                message: 'Los apellidos son obligatorios.',
                            },
                            stringLength: {
                                max: 200,
                                message: 'Los apellidos no puede sobrepasar 200 caracteres.',
                            },
                        },
                    },
                    txt_correo: {
                        validators: {
                            notEmpty: {
                                message: 'El correo es obligatorio.',
                            },
                            emailAddress: {
                                message: 'Debe ingresar un correo válido.',
                            },
                            stringLength: {
                                max: 200,
                                message: 'El correo no puede sobrepasar 200 caracteres.',
                            },
                        },
                    },
                    txt_celular: {
                        validators: {
                            notEmpty: {
                                message: 'El celular es obligatorio.',
                            },
                            integer: {
                                message: 'Debe ingresar un valor numérico.',
                            },
                            stringLength: {
                                max: 20,
                                message: 'El celular no puede sobrepasar 20 caracteres.',
                            },
                        },
                    },
                    txt_edad: {
                        validators: {
                            integer: {
                                message: 'Debe ingresar un valor numérico.',
                            },
                            stringLength: {
                                max: 3,
                                message: 'La edad no puede sobrepasar 3 caracteres.',
                            },
                        },
                    },
                    sel_pais: {
                        validators: {
                            notEmpty: {
                                message: 'Debe seleccionar un país.',
                            },
                        },
                    },
                    sel_fuente: {
                        validators: {
                            notEmpty: {
                                message: 'Debe seleccionar como conoció al profeta.',
                            },
                        },
                    },
                    txt_iglesia: {
                        validators: {
                            stringLength: {
                                max: 200,
                                message: 'El nombre de la iglesia no puede sobrepasar 200 caracteres.',
                            },
                        },
                    },
                    sel_cargo: {
                        validators: {
                            notEmpty: {
                                message: 'Debe seleccionar un país.',
                            },
                        },
                    },
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    bootstrap3: new FormValidation.plugins.Bootstrap3(),
                    submitButton: new FormValidation.plugins.SubmitButton(),
                    icon: new FormValidation.plugins.Icon({
                        valid: 'fa fa-check',
                        invalid: 'fa fa-times',
                        validating: 'fa fa-refresh',
                    }),
                },
            }
        );
}

function registrarParticipanteConferencia() {

    var participante = {}
    participante["idConferencia"] = hid_conferencia.val();
    participante["nombres"] = txt_nombres.val();
    participante["apellidos"] = txt_apellidos.val();
    participante["correo"] = txt_correo.val();
    participante["celular"] = txt_celular.val();
    participante["edad"] = txt_edad.val();
    participante["idPais"] = sel_pais.val();
    participante["iglesia"] = txt_iglesia.val();
    participante["idCargo"] = sel_cargo.val();
    participante["idFuente"] = sel_fuente.val();

    $.ajax({
        type:"POST",
        contentType : "application/json",
        accept: 'text/plain',
        url : '/registrarParticipanteConferencia',
        data : JSON.stringify(participante),
        dataType: 'json',
        beforeSend: function(xhr) {
            //mostrarModalProgreso("Generando Conciliación");
        },
        error : function(xhr, status, error) {
            //ocultarModalProgreso();

            if(xhr.status == HttpCodes.unprocessableentity) {
                if(xhr.responseJSON.code == 422001) {
                    //dialogConfirm(xhr.responseJSON.message, seguirIntentandoConciliar, cancelarReintentoConciliacion);
                } else {
                    //dialogAlert(xhr.responseJSON.message);
                }
            }

            if(xhr.status == HttpCodes.error) {
                var mensaje = "Ocurrió un error inesperado. Por favor contacte al administrador. ";
                //dialogError(mensaje);
            }

        },
        success:function(result, textStatus, xhr) {
            //ocultarModalProgreso();
            if(xhr.status == HttpCodes.success){
                alert('OK');
                //deshabilitarGenerarConciliacion(true);
                //mostrarBox(box_reporte_conciliacion);
                //dialogInfo(result.message);
            }
        }
    });

}