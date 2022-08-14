package com.profetadavidowuor.cruzada.enums;


import org.apache.commons.lang3.StringUtils;

public enum EnumErrores {

    ERROR_422001(422001, "El correo ingresado ya existe. Por favor ingresar uno diferente.");

    private EnumErrores(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    private int code;
    private String msg;

    public int getCodigo() {
        return code;
    }

    private void setCodigo(int code) {
        this.code = code;
    }

    public String getMensaje() {
        return msg;
    }

    private void setMensaje(String msg) {
        this.msg = msg;
    }

    public static String getMensaje(int code) {
        String msg = StringUtils.EMPTY;

        for (EnumErrores enumHTTP : EnumErrores.values()) {
            if (enumHTTP.code == code) {
                msg = enumHTTP.msg;
                break;
            }
        }

        return msg;
    }

}
