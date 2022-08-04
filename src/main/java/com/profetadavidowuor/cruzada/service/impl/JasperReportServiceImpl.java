package com.profetadavidowuor.cruzada.service.impl;

import com.profetadavidowuor.cruzada.service.JasperReportService;
import com.profetadavidowuor.cruzada.util.Constante;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

@Service
public class JasperReportServiceImpl<T> implements JasperReportService<T> {

    public void exportarPDFStream(String reporteJrxml, Map<String, Object> parameters, List<T> beanDataSource, OutputStream outputStream) throws JRException {

        JasperPrint jasperPrint = obtenerJasperPrint(reporteJrxml, parameters, (List<Object>) beanDataSource);
        JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
    }

    public void exportarPDFFile(String reporteJrxml, Map<String, Object> parameters, List<T> beanDataSource, String fileName) throws JRException {

        JasperPrint jasperPrint = obtenerJasperPrint(reporteJrxml, parameters, (List<Object>) beanDataSource);
        JasperExportManager.exportReportToPdfFile(jasperPrint, fileName);
    }

    private JasperPrint obtenerJasperPrint(String reporteJrxml, Map<String, Object> parameters, List<Object> beanDataSource) throws JRException {

        InputStream inputStream = this.getClass().getResourceAsStream(Constante.RUTA_REPORTES_JRXML + reporteJrxml + Constante.EXTENSION_JRXML);

        JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);

        JRBeanCollectionDataSource source = new JRBeanCollectionDataSource(beanDataSource);

        return JasperFillManager.fillReport(jasperReport, parameters, source);
    }
}
