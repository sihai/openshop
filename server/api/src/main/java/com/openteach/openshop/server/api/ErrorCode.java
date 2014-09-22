package com.openteach.openshop.server.api;

/**
 * 错误码
 * @author sihai
 *
 */
public enum ErrorCode {

	SUCCEED,
	MISSING_SYS_PARAMETER,
	RESOURCE_LIMITED,
	SERVLET_TIMEOUT,
	BIZ_TIMEOUT,
	UNKNOWN_API,
	BIZ_ERROR,
	MISSING_BIZ_PARAMETER,
	WRONG_BIZ_PARAMETER,
	UNKNOWN_ERROR;
}
