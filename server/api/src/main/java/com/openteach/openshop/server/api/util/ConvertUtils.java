package com.openteach.openshop.server.api.util;

import java.math.BigDecimal;

/**
 * 
 * @author sihai
 *
 */
public abstract class ConvertUtils {
	
	/**
	 * 
	 * @param v
	 * @return
	 */
	public static Boolean asBoolean(Object v) {
		if(null == v) {
			return null;
		}
		Class c = v.getClass();
		if(c == Boolean.class) {
			return (Boolean)v;
		} else if(c == String.class) {
			if(Boolean.TRUE.toString().equals(v)) {
				return true;
			} else if(Boolean.FALSE.toString().equals(v)) {
				return false;
			} else {
				throw new IllegalArgumentException(String.format("%s(type:%s) can not convert to boolean", v, v.getClass().getName()));
			}
		} else {
			throw new IllegalArgumentException(String.format("%s(type:%s) can not convert to boolean", v, v.getClass().getName()));
		}
	}
	
	/**
	 * 
	 * @param v
	 * @return
	 */
	public static Short asShort(Object v) {
		if(null == v) {
			return null;
		}
		Class c = v.getClass();
		if(c == Short.class) {
			return (Short)v;
		} else if(c == String.class) {
			try {
				return Short.valueOf((String)v);
			} catch (NumberFormatException e) {
				throw new IllegalArgumentException(String.format("%s(type:%s) can not convert to short", v, v.getClass().getName()));
			}
		} else {
			throw new IllegalArgumentException(String.format("%s(type:%s) can not convert to short", v, v.getClass().getName()));
		}
	}
	
	/**
	 * 
	 * @param v
	 * @return
	 */
	public static Integer asInt(Object v) {
		if(null == v) {
			return null;
		}
		Class c = v.getClass();
		if(c == Integer.class) {
			return (Integer)v;
		} else if(c == String.class) {
			try {
				return Integer.valueOf((String)v);
			} catch (NumberFormatException e) {
				throw new IllegalArgumentException(String.format("%s(type:%s) can not convert to int", v, v.getClass().getName()));
			}
		} else {
			throw new IllegalArgumentException(String.format("%s(type:%s) can not convert to int", v, v.getClass().getName()));
		}
	}
	
	/**
	 * 
	 * @param v
	 * @return
	 */
	public static Long asLong(Object v) {
		if(null == v) {
			return null;
		}
		Class c = v.getClass();
		if(c == Long.class) {
			return (Long)v;
		} else if(c == String.class) {
			try {
				return Long.valueOf((String)v);
			} catch (NumberFormatException e) {
				throw new IllegalArgumentException(String.format("%s(type:%s) can not convert to long", v, v.getClass().getName()));
			}
		} else {
			throw new IllegalArgumentException(String.format("%s(type:%s) can not convert to long", v, v.getClass().getName()));
		}
	}
	
	/**
	 * 
	 * @param v
	 * @return
	 */
	public static Float asFloat(Object v) {
		if(null == v) {
			return null;
		}
		Class c = v.getClass();
		if(c == Float.class) {
			return (Float)v;
		} else if(c == String.class) {
			try {
				return Float.valueOf((String)v);
			} catch (NumberFormatException e) {
				throw new IllegalArgumentException(String.format("%s(type:%s) can not convert to float", v, v.getClass().getName()));
			}
		} else {
			throw new IllegalArgumentException(String.format("%s(type:%s) can not convert to float", v, v.getClass().getName()));
		}
	}
	
	/**
	 * 
	 * @param v
	 * @return
	 */
	public static Double asDouble(Object v) {
		if(null == v) {
			return null;
		}
		Class c = v.getClass();
		if(c == Double.class) {
			return (Double)v;
		} else if(c == String.class) {
			try {
				return Double.valueOf((String)v);
			} catch (NumberFormatException e) {
				throw new IllegalArgumentException(String.format("%s(type:%s) can not convert to double", v, v.getClass().getName()));
			}
		} else {
			throw new IllegalArgumentException(String.format("%s(type:%s) can not convert to double", v, v.getClass().getName()));
		}
	}
	
	/**
	 * 
	 * @param v
	 * @return
	 */
	public static BigDecimal asBigDecimal(Object v) {
		if(null == v) {
			return null;
		}
		Class c = v.getClass();
		if(c == BigDecimal.class) {
			return (BigDecimal)v;
		} else if(c == String.class) {
			return BigDecimal.valueOf(Double.valueOf((String)v));
		} else {
			return BigDecimal.valueOf(asDouble(v));
		}
	}
	
	/**
	 * 
	 * @param v
	 * @return
	 */
	public static String asString(Object v) {
		if(null == v) {
			return null;
		}
		Class c = v.getClass();
		if(c == String.class) {
			return (String)v;
		} else {
			return String.valueOf(v);
		}
	}
}
