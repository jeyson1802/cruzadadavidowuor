package com.profetadavidowuor.cruzada.service.impl;

import com.profetadavidowuor.cruzada.service.EmailService;
import org.apache.commons.lang3.CharEncoding;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

import javax.mail.internet.ContentType;
import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Map;
@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private SpringTemplateEngine templateEngine;

    @Override
    public void sendMail(String template, String asunto, String destino, Map<String, Object> parametros) throws Exception {

        Context context = new Context();
        context.setVariable("parametros", parametros);

        String process = templateEngine.process(template, context);
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
        helper.setSubject(asunto);
        helper.setText(process, true);
        helper.setTo(destino);
        byte[] qrCode = (byte[]) parametros.get("IMG_BASE_64_BYTES");
        ByteArrayDataSource byteArrayDataSource = new ByteArrayDataSource(qrCode, "image/png");
        helper.addInline("qr" , byteArrayDataSource);
        byte[] pdf = (byte[]) parametros.get("PDF_BYTES");
        ByteArrayDataSource byteArrayDataSourcePDF = new ByteArrayDataSource(pdf, "application/pdf");
        helper.addAttachment("pdf", byteArrayDataSourcePDF);
        javaMailSender.send(mimeMessage);

    }
}
