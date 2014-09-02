package com.openteach.openshop.server.api;

import java.util.Map;

/**
 * 
 * @author sihai
 *
 */
public class DefaultApiRequest implements ApiRequest {

	private Map<String, Object> sysParameters;
	private Map<String, Object> bizParameters;
	
	/**
	 * 
	 * @param account
	 * @param sysParameters
	 * @param bizParameters
	 */
	public DefaultApiRequest(Map<String, Object> sysParameters, Map<String, Object> bizParameters) {
		this.sysParameters = sysParameters;
		this.bizParameters = bizParameters;
	}
	
	@Override
	public String getApiName() {
		return (String)sysParameters.get(SysParameters.API_NAME.getKey());
	}

	@Override
	public String getApiVersion() {
		return (String)sysParameters.get(SysParameters.API_VERSION.getKey());
	}

	@Override
	public Map<String, Object> getSysParameters() {
		return sysParameters;
	}

	@Override
	public Map<String, Object> getBizParameters() {
		return bizParameters;
	}

	@Override
	public Object getSys(String key) {
		return sysParameters.get(key);
	}

	@Override
	public Object getBiz(String key) {
		if(null == bizParameters) {
			return null;
		}
		return bizParameters.get(key);
	}
}
