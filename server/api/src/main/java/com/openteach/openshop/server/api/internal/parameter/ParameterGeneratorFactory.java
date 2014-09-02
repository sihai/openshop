package com.openteach.openshop.server.api.internal.parameter;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.openteach.openshop.server.api.ExecutionContext;
import com.openteach.openshop.server.api.SysMappings;
import com.openteach.openshop.server.api.annotation.Param;
import com.openteach.openshop.server.api.annotation.Params;

/**
 * 
 * @author sihai
 *
 */
public abstract class ParameterGeneratorFactory {
	
	private static ConcurrentHashMap<String, ParameterGenerator> gs = new ConcurrentHashMap<String, ParameterGenerator>();
	
	/**
	 * 
	 * @param clazz
	 * @param type
	 * @param name
	 * @param required
	 * @param ecrypted
	 * @return
	 */
	public static ParameterGenerator getSigleGenerator(Class clazz, ParameterType type, String name, boolean required, boolean ecrypted) {
		String key = key(clazz, type, name, required, ecrypted);
		ParameterGenerator old = null;
		ParameterGenerator pg = gs.get(key);
		if(null == pg) {
			pg = newGenerator(clazz, type, name, required, ecrypted);
			old = gs.putIfAbsent(key, pg);
		}
		return null == old ? pg : old;
	}
	
	public static MultiParameterGenerator getMultiGenerator(Class[] pts, Object[] as) {
		Param ap = null;
		Params aps = null;
		ParameterGenerator[] pgs = new ParameterGenerator[pts.length];
		for(int i = 0; i < pts.length; i++) {
			if(null == as[i]) {
				throw new IllegalArgumentException();
			} else if(as[i] instanceof Param) {
				pgs[i] = (getSigleGenerator(pts[i], ((Param)as[i]).type(), ((Param)as[i]).name(), ((Param)as[i]).required(), ((Param)as[i]).ecrypted()));
			} else if(null != aps) {
				pgs[i] = (getSigleGenerator(pts[i], null, null, aps.required(), false));
			}
			
		}
		return new MultiParameterGenerator(pgs);
	}
	
	/**
	 * 
	 * @param clazz
	 * @return
	 */
	private static ParameterGenerator newGenerator(Class clazz, ParameterType type, String name, boolean required, boolean ecrypted) {
		if(Boolean.class == clazz) {
			return new BooleanParameterGenerator(type, name, required);
		} else if(Short.class == clazz) {
			return new ShortParameterGenerator(type, name, required);
		} else if(Integer.class == clazz) {
			return new IntegerParameterGenerator(type, name, required);
		} else if(Long.class == clazz) {
			return new LongParameterGenerator(type, name, required);
		} else if(Float.class == clazz) {
			return new FloatParameterGenerator(type, name, required);
		} else if(Double.class == clazz) {
			return new DoubleParameterGenerator(type, name, required);
		} else if(BigDecimal.class == clazz) {
			return new BigDecimalParameterGenerator(type, name, required);
		} else if (String.class == clazz) {
			return new StringParameterGenerator(type, name, required, ecrypted);
		} else if(Enum.class.isAssignableFrom(clazz)) {
			return new EnumParameterGenerator(clazz, type, name, required);
		} else if(clazz.isArray()) {
			return new ArrayParameterGenerator(clazz.getComponentType(), getSigleGenerator(clazz.getComponentType(), null, null, false, false), type, name, required);
		} else if (ParameterType.SYS == type && HttpServletRequest.class == clazz && SysMappings.HTTP_REQUEST.equals(name)) {
			return new HttpServletRequestParameterGenerator(type, name, required);
		} else if (ParameterType.SYS == type && HttpServletResponse.class == clazz && SysMappings.HTTP_RESPONSE.equals(name)) {
			return new HttpServletResponseParameterGenerator(type, name, required);
		} else if (ParameterType.SYS == type && HttpSession.class == clazz && SysMappings.HTTP_SESSION.equals(name)) {
			return new HttpSessionParameterGenerator(type, name, required);
		} else if (ParameterType.SYS == type && ExecutionContext.class == clazz && SysMappings.EXECUTION_CONTEXT.equals(name)) {
			return new ExecutionContextParameterGenerator(type, name, required);
		} else {
			// complex
			Object[][] aa = getParameterGeneratorsAndParameterSetters(clazz);
			if(0 == aa[0].length) {
				return new ComplexParameterGenerator(clazz, new ParameterGenerator[0], new ParameterSetter[0], required);
			} else {
				return new ComplexParameterGenerator(clazz, (ParameterGenerator[])aa[0], (ParameterSetter[])aa[1], required);	
			}
		}
	}
	
	/**
	 * 
	 * @param clazz
	 * @param type
	 * @param name
	 * @param required
	 * @param ecrypted
	 * @return
	 */
	private static String key(Class clazz, ParameterType type, String name, boolean required, boolean ecrypted) {
		return String.format("%s@%s@%s@%s@%s", clazz.getName(), type, name, Boolean.toString(required), Boolean.toString(ecrypted));
	}
	
	/**
	 * 
	 * @param clazz
	 * @return
	 */
	private static Object[][] getParameterGeneratorsAndParameterSetters(Class clazz) {
		List<ParameterGenerator> pgs = new ArrayList<ParameterGenerator>();
		List<ParameterSetter> pss = new ArrayList<ParameterSetter>();
		Param ap = null;
		Params aps = null;
		Field[] fs = clazz.getFields();
		for(Field f : fs) {
			ap = f.getAnnotation(Param.class);
			aps = f.getAnnotation(Params.class);
			if(null != ap) {
				pgs.add(ParameterGeneratorFactory.getSigleGenerator(f.getType(), ap.type(), ap.name(), ap.required(), ap.ecrypted()));
				pss.add(getSigleParameterSetter(f));
			} else if(null != aps) {
				pgs.add(ParameterGeneratorFactory.getSigleGenerator(f.getType(), null, null, aps.required(), false));
				pss.add(getSigleParameterSetter(f));
			}
		}
		
		Method[] ms = clazz.getMethods();
		for(Method m : ms) {
			ap = m.getAnnotation(Param.class);
			aps = m.getAnnotation(Params.class);
			if(null != ap) {
				pgs.add(ParameterGeneratorFactory.getMultiGenerator(m.getParameterTypes(), getAnnotation(m)));
				pss.add(getMultiParameterSetter(m));
			} else if(null != aps) {
				pgs.add(ParameterGeneratorFactory.getMultiGenerator(m.getParameterTypes(), getAnnotation(m)));
				pss.add(getMultiParameterSetter(m));
			}
		}
		
		return new Object[][] {pgs.toArray(), pss.toArray()};
	}
	
	/**
	 * 
	 * @param f
	 */
	private static SigleParameterSetter getSigleParameterSetter(Field f) {
		// setter method name
		String mn = String.format("set%s%s", f.getName().substring(0, 1).toUpperCase(), f.getName().substring(1).toUpperCase());
		//
		Method m =  null;
		try {
			m = f.getDeclaringClass().getMethod(mn, new Class[] {f.getType()});
			m.setAccessible(true);
		} catch (NoSuchMethodException e) {
			f.setAccessible(true);
		}
		return new SigleParameterSetter(m, f);
	}
	
	/**
	 * 
	 * @param m
	 */
	private static MultiParameterSetter getMultiParameterSetter(Method m) {
		return new MultiParameterSetter(m);
	}
	
	/**
	 * 
	 * @return
	 */
	private static Object[] getAnnotation(Method m) {
		Annotation[] as = new Annotation[m.getParameterTypes().length];
		Annotation[][] ass = m.getParameterAnnotations();
		for(int i = 0; i < ass.length; i++) {
			for(int j = 0; j < ass[i].length; j++) {
				if(ass[i][j] instanceof Param || ass[i][j] instanceof Params) {
					as[i] = ass[i][j];
				}
			}
		}
		
		return as;
	}
}
