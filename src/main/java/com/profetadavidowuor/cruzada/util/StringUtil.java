package com.profetadavidowuor.cruzada.util;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class StringUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(StringUtil.class);
	private static ObjectMapper mapper = new ObjectMapper();

	public static Long toLong(Object objeto) {
		if (isEmpty(objeto)) {
			return null;
		}
		try {
			return Long.parseLong(objeto.toString());
		} catch (NumberFormatException e) {
			logger.error("Ocurri\u00f3 un error en Utilidades.toLong", e);
			return null;
		}
	}

	public static Short toShort(Object objeto) {
		if (isEmpty(objeto)) {
			return null;
		}
		try {
			return Short.parseShort(objeto.toString());
		} catch (NumberFormatException e) {
			logger.error("Ocurri\u00f3 un error en Utilidades.toShort", e);
			return null;
		}
	}

	public static Boolean toBoolean(Object objeto) {
		if (isEmpty(objeto)) {
			return null;
		}
		try {
			return Boolean.parseBoolean(objeto.toString());
		} catch (Exception e) {
			logger.error("Ocurri\u00f3 un error en Utilidades.toBoolean", e);
			return null;
		}
	}

	public static Integer toInteger(Object objeto) {
		if (isEmpty(objeto)) {
			return null;
		}
		try {
			return Integer.parseInt(objeto.toString());
		} catch (Exception e) {
			logger.error("Ocurrio un error en Utilidades.toInteger", e);
			return null;
		}
	}

	public static Double toDouble(Object objeto) {
		if (isEmpty(objeto)) {
			return null;
		}
		try {
			return Double.parseDouble(objeto.toString());
		} catch (NumberFormatException e) {
			logger.error("Ocurri\u00f3 un error en Utilidades.toDouble", e);
			return null;
		}
	}

	public static Float toFloat(Object objeto) {
		if (isEmpty(objeto)) {
			return null;
		}
		try {
			return Float.parseFloat(objeto.toString());
		} catch (NumberFormatException e) {
			logger.error("Ocurri\u00f3 un error en Utilidades.toFloat", e);
			return null;
		}
	}

	public static String toStr(Object cadena) {
		return isEmpty(cadena) ? null : toBlank(cadena.toString());
	}

	public static String toBlank(Object object) {
		return isEmpty(object) ? "" : object.toString();
	}

	public static String toDefault(Object cadena, String strDefault) {
		return isEmpty(cadena) ? strDefault : cadena.toString().trim();
	}

	public static BigDecimal defaultBigDecimal(BigDecimal valor) {
        try {
        	return valor == null ? BigDecimal.ZERO : valor;
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return BigDecimal.ZERO;
        }
	}

	public static BigDecimal toBigDecimal(Object obj) {
		try {
			return new BigDecimal(toStr(obj));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return BigDecimal.ZERO;
		}
	}

	public static BigDecimal roundDecimal(BigDecimal valor, Integer decimales) {
        try {
        	return valor.setScale(decimales, BigDecimal.ROUND_HALF_UP);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return BigDecimal.ZERO;
        }
	}

	public static BigDecimal round2Decimal(BigDecimal valor) {
		return roundDecimal(valor, 2);
	}

	public static boolean isEmpty(Object object) {
		if (object == null) {
			return true;
		}
		if (object instanceof String) {
			return object.toString().trim().length() == 0;
		}
		if (object instanceof StringBuilder) {
			return object.toString().trim().length() == 0;
		}
		if (object instanceof List<?> || object instanceof ArrayList<?>) {
			return ((List<?>) object).isEmpty();
		}
		if (object instanceof Map<?, ?> || object instanceof HashMap<?, ?>) {
			return ((Map<?, ?>) object).isEmpty();
		}
		return false;
	}

	public static boolean equiv(Object object1, Object object2) {
		if (object1 == null || object2 == null) {
			return false;
		}
		if (isEmpty(object1) && !isEmpty(object2) || !isEmpty(object1) && isEmpty(object2)) {
			return false;
		}
		if (isEmpty(object1) && isEmpty(object2) || object1 == object2) {
			return true;
		}

		if (object1 instanceof String && object2 instanceof String) {
			return toBlank(object1.toString()).equals(toBlank(object2.toString()));
		}
		return object1.equals(object2);
	}

}