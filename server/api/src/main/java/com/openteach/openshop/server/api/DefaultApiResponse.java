package com.openteach.openshop.server.api;

import java.util.HashMap;
import java.util.Map;

/**
 * 
 * @author sihai
 *
 */
public class DefaultApiResponse implements ApiResponse {

	private Result result;
	
	private Map<String, String> headers = new HashMap<String, String>();
	
	@Override
	public void setResult(Result result) {
		this.result = result;
	}

	@Override
	public Result getResult() {
		return result;
	}

	@Override
	public void addHeader(String key, String value) {
		headers.put(key, value);
	}

	@Override
	public void addHeaders(Map<String, String> headers) {
		headers.putAll(headers);
	}
	
	@Override
	public Map<String, String> getHeaders() {
		return headers;
	}
}
