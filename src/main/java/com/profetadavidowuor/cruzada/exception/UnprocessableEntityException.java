package com.profetadavidowuor.cruzada.exception;

public class UnprocessableEntityException extends RuntimeException {

  private int code;
  private String messageError;

  public UnprocessableEntityException(int code, String messageError) {
    this.code = code;
    this.messageError = messageError;
  }

  public int getCode() {
    return code;
  }

  public void setCode(int code) {
    this.code = code;
  }

  public String getMessageError() {
    return messageError;
  }

  public void setMessageError(String messageError) {
    this.messageError = messageError;
  }
}
