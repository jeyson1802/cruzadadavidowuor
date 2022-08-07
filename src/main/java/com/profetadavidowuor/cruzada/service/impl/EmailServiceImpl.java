package com.profetadavidowuor.cruzada.service.impl;

import com.profetadavidowuor.cruzada.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

import javax.mail.internet.MimeMessage;
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
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
        helper.setSubject(asunto);
        helper.setText(process, true);
        helper.setTo(destino);
        //helper.addAttachment("FreelanceSuccess.pdf", file);
        javaMailSender.send(mimeMessage);

    }
}
