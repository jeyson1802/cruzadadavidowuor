package com.profetadavidowuor.cruzada.service.impl;

import com.profetadavidowuor.cruzada.service.EmailService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;
import java.util.Map;
@Service
public class EmailServiceImpl implements EmailService {

    private static final Logger logger = LogManager.getLogger(SendinBlueServiceImpl.class);

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private SpringTemplateEngine templateEngine;

    @Override
    public void sendMail(String template, String asunto, String destino, Map<String, Object> parametros, Map<String, byte[]> imagenesCorreo,  Map<String, byte[]> adjuntos) throws Exception {

        logger.info("Inicio sendMail");

        Context context = new Context();
        context.setVariable("parametros", parametros);

        String process = templateEngine.process(template, context);
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
        helper.setSubject(asunto);
        helper.setText(process, true);
        helper.setTo(destino);

        for (Map.Entry<String, byte[]> imagenesCorreoEntry : imagenesCorreo.entrySet()) {
            ByteArrayDataSource byteArrayDataSource = new ByteArrayDataSource(imagenesCorreoEntry.getValue(), "image/png");
            helper.addInline(imagenesCorreoEntry.getKey() , byteArrayDataSource);
        }

        for (Map.Entry<String, byte[]> adjuntosEntry : adjuntos.entrySet()) {
            ByteArrayDataSource byteArrayDataSource = new ByteArrayDataSource(adjuntosEntry.getValue(), "application/pdf");
            helper.addAttachment(adjuntosEntry.getKey() , byteArrayDataSource);
        }

        javaMailSender.send(mimeMessage);

        logger.info("Fin sendMail");

    }
}
