package com.profetadavidowuor.cruzada.service.impl;

import com.profetadavidowuor.cruzada.dto.RegistroConferenciaDto;
import com.profetadavidowuor.cruzada.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private SpringTemplateEngine templateEngine;

    @Override
    public String sendMailRegistroConferencia(RegistroConferenciaDto registroConferenciaDto) throws Exception {

        Context context = new Context();
        context.setVariable("registroConferenciaDto", registroConferenciaDto);

        String process = templateEngine.process("emails/welcome", context);
        javax.mail.internet.MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
        helper.setSubject("Welcome " + registroConferenciaDto.getNombres());
        helper.setText(process, true);
        helper.setTo(registroConferenciaDto.getCorreo());
        javaMailSender.send(mimeMessage);

        return "Sent";
    }
}
