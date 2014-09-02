package com.openteach.openshop.server.api.internal.parameter;


/**
 * 
 * @author sihai
 *
 */
public class ParametersMetadata {

	/**
	 * 
	 */
	private ParameterMetadata[] pms;

	/**
	 * 
	 * @param pms
	 */
	public ParametersMetadata(ParameterMetadata[] pms) {
		this.pms = pms;
	}
	
	public ParameterMetadata[] getPms() {
		return pms;
	}
}
