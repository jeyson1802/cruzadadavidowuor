package com.profetadavidowuor.cruzada.exception;

import java.util.Date;

public class ResponseMessage {

  private Date timestamp;
  private int code;
  private String message;
  private String description;

  public ResponseMessage(Date timestamp, int code, String message, String description) {
    this.timestamp = timestamp;
    this.code = code;
    this.message = message;
    this.description = description;
  }

  public Date getTimestamp() {
    return timestamp;
  }

  public int getCode() {
    return code;
  }

  public String getMessage() {
    return message;
  }

  public String getDescription() {
    return description;
  }
}
