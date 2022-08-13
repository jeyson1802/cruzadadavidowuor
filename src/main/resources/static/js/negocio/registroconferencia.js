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
var img_qr;
var h2_conferencia;
var h4_codigo_participante;
var h4_participante;
var p_lugar;
var p_horario;
var div_formulario;
var div_constancia;
var celular;

var HttpCodes = {
    success  : 200,
    unprocessableentity : 422,
    error  : 500
};

var Boton = {
    PRIMARY	: "btn-primary",
    WARNING	: "btn-warning",
    INFO	: "btn-info",
    SUCCESS	: "btn-success",
    DANGER	: "btn-danger"
}

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
    img_qr = $("#img_qr");
    h2_conferencia = $("#h2_conferencia");
    h4_codigo_participante = $("#h4_codigo_participante");
    h4_participante = $("#h4_participante");
    p_lugar = $("#p_lugar");
    p_horario = $("#p_horario");
    div_formulario =  $("#div_formulario");
    div_constancia =  $("#div_constancia");
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

    txt_celular.intlTelInput({
        allowDropdown:true,
        autoPlaceholder: "off",
        initialCountry: "do",
        preferredCountries: ["do","pe" ],
        separateDialCode: true,
        formatOnDisplay: false,
        utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.18/js/utils.min.js"
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
                            checkNumeroCelular : {
                                message: 'Número de celular inválido.'
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
                            stringLength: {
                                min: 2,
                                message: 'La edad no puede ser menor a 2 caracteres.',
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
        ).registerValidator('checkNumeroCelular', esNumeroCelularValido);
}

function registrarParticipanteConferencia() {

    var participante = {}
    participante["idConferencia"] = hid_conferencia.val();
    participante["nombres"] = txt_nombres.val();
    participante["apellidos"] = txt_apellidos.val();
    participante["correo"] = txt_correo.val();
    participante["celular"] = txt_celular.intlTelInput("getNumber");
    participante["edad"] = txt_edad.val();
    participante["codePais"] = sel_pais.val();
    participante["iglesia"] = txt_iglesia.val();
    participante["idCargo"] = sel_cargo.val();
    participante["idFuente"] = sel_fuente.val();

    $.ajax({
        type: "POST",
        contentType: "application/json",
        accept: 'text/plain',
        url: '/registrarParticipanteConferencia',
        data: JSON.stringify(participante),
        dataType: 'json',
        beforeSend: function (xhr) {
            loadding(true);
        },
        error: function (xhr, status, error) {
            loadding(false);

            if (xhr.status === HttpCodes.unprocessableentity) {
                if (xhr.responseJSON.code == 422001) {
                    //dialogConfirm(xhr.responseJSON.message, seguirIntentandoConciliar, cancelarReintentoConciliacion);
                } else {
                    //dialogAlert(xhr.responseJSON.message);
                }
            }

            if (xhr.status == HttpCodes.error) {
                var mensaje = "Ocurrió un error inesperado. Por favor contacte al administrador. ";
                //dialogError(mensaje);
            }

        },
        success: function (result, textStatus, xhr) {

            loadding(false);

            if (xhr.status == HttpCodes.success) {

                /*bootbox.dialog({
                    message: "<p>" + result + "</p>",
                    size: 'medium',
                    centerVertical: true,
                    closeButton: false,
                    buttons: {
                        cancel: {
                            label: "Aceptar",
                            className: Boton.PRIMARY
                        }
                    }
                });*/

                div_formulario.addClass("d-none");
                h2_conferencia.text(result.conferencia.descripcion);
                h4_codigo_participante.text('Código de Participante N° ' + result.id);
                h4_participante.text(result.nombres + ' ' + result.apellidos);
                p_lugar.html(result.conferencia.lugar);
                p_horario.html(result.conferencia.horario);
                img_qr.attr('src', 'data:image/png;base64,' + result.qrCodeBase64);
                div_constancia.removeClass("d-none");

                generarConstanciaParticipante(result.id);
                enviarEmailConstanciaParticipante(result.id);
                agregarContactoParticipanteSendinBlue(result.id);

            }
        }
    });

}

function generarConstanciaParticipante(idParticipante) {

    $.ajax({
        type:"POST",
        url : '/generarConstanciaParticipante/' + idParticipante,
        xhrFields: {
            responseType: 'blob'
        },
        error : function(xhr, status, error) {
            console.log('generarConstanciaParticipante ==> Error interno');
        },
        success:function(result, textStatus, xhr) {

            if(xhr.status==HttpCodes.success) {

                var filename = idParticipante + "_" + "ConstanciaConferencia.pdf";

                var blob = new Blob([result], { type: 'application/octet-stream' });

                if (typeof window.navigator.msSaveBlob !== 'undefined') {
                    //   IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
                    window.navigator.msSaveBlob(blob, filename);
                } else {
                    var URL = window.URL || window.webkitURL;
                    var downloadUrl = URL.createObjectURL(blob);

                    if (filename) {
                        // use HTML5 a[download] attribute to specify filename
                        var a = document.createElement("a");

                        // safari doesn't support this yet
                        if (typeof a.download === 'undefined') {
                            window.location = downloadUrl;
                        } else {
                            a.href = downloadUrl;
                            a.download = filename;
                            document.body.appendChild(a);
                            a.target = "_blank";
                            a.click();

                            window.onfocus = function () {
                                document.body.removeChild(a);
                                window.URL.revokeObjectURL(downloadUrl);
                            }
                        }
                    } else {
                        window.location = downloadUrl;
                    }

                    console.log('generarConstanciaParticipante ==> ' + HttpCodes.success);
                }
            }
            }
        });
    }

function enviarEmailConstanciaParticipante(idParticipante) {

    $.ajax({
        type: "POST",
        contentType: "application/json",
        accept: 'text/plain',
        url: '/enviarEmailConstanciaParticipante/' + idParticipante,
        error: function (xhr, status, error) {
            console.log('enviarEmailConstanciaParticipante ==> ' + xhr.responseJSON.message);
        },
        success: function (result, textStatus, xhr) {

            if (xhr.status == HttpCodes.success) {
                console.log('enviarEmailConstanciaParticipante ==> ' + HttpCodes.success);
            }
        }
    });

}

function agregarContactoParticipanteSendinBlue(idParticipante) {

    $.ajax({
        type: "POST",
        contentType: "application/json",
        accept: 'text/plain',
        url: '/agregarContactoParticipanteSendinBlue/' + idParticipante,
        error: function (xhr, status, error) {
            console.log('agregarContactoParticipanteSendinBlue ==> ' + xhr.responseJSON.message);
        },
        success: function (result, textStatus, xhr) {

            if (xhr.status == HttpCodes.success) {
                console.log('agregarContactoParticipanteSendinBlue ==> ' + HttpCodes.success);
            }
        }
    });

}

function loadding(onOff) {
    if (onOff) {
        var div="<div id='loadding' class='box'><div class='image'><img src='images/loading.svg'></div></div>";
        jQuery.blockUI({
            message: div,
            css: {
                border: 'none',
                padding: '0px',
                backgroundColor: ''
            },
            overlayCSS: {
                backgroundColor: 'black',
                opacity: 0.3
            }
        });
    }
    else {
        jQuery.unblockUI();
    }
}

const esNumeroCelularValido = function () {
    return {
        validate: function (input) {
            return {
               valid: $(input.element).intlTelInput('isValidNumber'),
            };
        },
    };
};