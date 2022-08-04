package com.profetadavidowuor.cruzada.service;

import net.sf.jasperreports.engine.JRException;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;

public interface JasperReportService<T> {

    void exportarPDFStream(String reporteJrxml, Map<String, Object> parameters, List<T> beanDataSource, OutputStream outputStream) throws JRException;

    void exportarPDFFile(String reporteJrxml, Map<String, Object> parameters, List<T> beanDataSource, String fileName) throws JRException;
}
