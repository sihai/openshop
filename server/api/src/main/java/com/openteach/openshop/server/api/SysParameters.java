package com.openteach.openshop.server.api;

public enum SysParameters {
	API_NAME("o-api-name", true),
	API_VERSION("o-api-version", true),
	DEVICE_ID("o-device-id", true),
	DEVICE_NAME("o-device-name", true),
	SYSTEM_NAME("o-system-name", true),
	SYSTEM_VERSION("o-system-version", true);
	
	
	private final String key;
	private final boolean required;

	/**
	 * 
	 * @param key
	 * @param required
	 */
	private SysParameters(String key, boolean required) {
		this.key = key;
		this.required = required;
	}
	
	public String getKey() {
		return key;
	}

	public boolean isRequired() {
		return required;
	}
}