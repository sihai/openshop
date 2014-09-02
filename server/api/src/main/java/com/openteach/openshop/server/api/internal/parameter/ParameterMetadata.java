package com.openteach.openshop.server.api.internal.parameter;


/**
 * 单个参数的meta (不过这个参数可能是复杂类型)
 * @author sihai
 *
 */
public class ParameterMetadata {

	/**
	 * 
	 */
	private ParameterGenerator pg;
	
	/**
	 * 
	 * @param pg
	 */
	public ParameterMetadata(ParameterGenerator pg) {
		this.pg = pg;
	}
	
	public ParameterGenerator getPg() {
		return pg;
	}
}
