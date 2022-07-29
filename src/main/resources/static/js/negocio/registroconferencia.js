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

    alert('OK');

}