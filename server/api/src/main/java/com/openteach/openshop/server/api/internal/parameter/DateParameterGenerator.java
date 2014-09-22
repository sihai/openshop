package com.openteach.openshop.server.api.internal.parameter;

import java.text.ParseException;
import java.util.Date;

import com.openteach.openshop.server.api.ErrorCode;
import com.openteach.openshop.server.api.exception.ParameterGeneratedException;
import com.openteach.openshop.server.api.util.ConvertUtils;

/**
 * 
 * @author sihai
 *
 */
public class DateParameterGenerator extends AbstractSimpleParameterGenerator {

	/**
	 * 
	 * @param type
	 * @param name
	 * @param required
	 */
	public DateParameterGenerator(ParameterType type, String name, boolean required) {
		super(type, name, required);
	}
	
	@Override
	public Object generateValue(Object v) throws ParameterGeneratedException {
		try {
			Date d = ConvertUtils.asDate(v, DATE_FORMAT);
			if(this.isRequired() && d == v) {
				throw new ParameterGeneratedException(ErrorCode.MISSING_BIZ_PARAMETER, this.getName());
			}
			return d;
		} catch (ParseException e) {
			throw new ParameterGeneratedException(ErrorCode.WRONG_BIZ_PARAMETER, this.getName());
		}
	}
}
