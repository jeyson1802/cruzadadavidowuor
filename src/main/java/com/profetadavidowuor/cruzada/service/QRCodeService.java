package com.profetadavidowuor.cruzada.service;

public interface QRCodeService {

    byte[] generateQRCode(String qrContent, int width, int height);
}
