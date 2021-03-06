package com.openteach.openshop.server.biz.api;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.openteach.openshop.server.api.ErrorCode;
import com.openteach.openshop.server.api.ExecutionContext;
import com.openteach.openshop.server.api.SysMappings;
import com.openteach.openshop.server.api.annotation.Api;
import com.openteach.openshop.server.api.annotation.Apis;
import com.openteach.openshop.server.api.annotation.Param;
import com.openteach.openshop.server.api.annotation.Params;
import com.openteach.openshop.server.api.internal.parameter.ParameterType;
import com.openteach.openshop.server.biz.UserBO;
import com.openteach.openshop.server.service.Message;
import com.openteach.openshop.server.service.entity.Member;
import com.openteach.openshop.server.service.entity.Member.Gender;

/**
 * 
 * @author sihai
 *
 */
@Component
@Apis
public class UserApi {

	@Resource(name = "userBO")
	private UserBO userBO;

	/**
	 * 
	 * @param userName
	 * @param password
	 * @return
	 */
	@Api(name = "com.openteach.openshop.server.user.register", version = "0.0.1")
	public void register(
			@Param(type = ParameterType.BIZ, name = "user_name", required = true) String username,
			@Param(type = ParameterType.BIZ, name = "email", required = true) String email,
			@Param(type = ParameterType.BIZ, name = "enPassword", required = true, ecrypted = true) String password,
			@Param(type = ParameterType.BIZ, name = "birthday", required = false) Date birthday,
			@Param(type = ParameterType.BIZ, name = "telephone", required = false) String telephone,
			@Param(type = ParameterType.BIZ, name = "gender", required = false) Gender gender,
			@Param(type = ParameterType.BIZ, name = "area_id", required = false) Long areaid,
			@Param(type = ParameterType.BIZ, name = "address", required = false) String address,
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_REQUEST) HttpServletRequest request, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_RESPONSE) HttpServletResponse response, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_SESSION) HttpSession session,
			@Param(type = ParameterType.SYS, name = SysMappings.EXECUTION_CONTEXT) ExecutionContext context) {
		Message msg = userBO.register(email, password, username, telephone, birthday, gender, areaid, address, request, response, session);
		if(msg.isSucceed()) {
			context.setCode(ErrorCode.SUCCEED);
		} else {
			context.setCode(ErrorCode.BIZ_ERROR);
			context.setErrorMsg(msg.getContent());
		}
	}
	
	/**
	 * 
	 * @param userName
	 * @param password
	 * @return
	 */
	@Api(name = "com.openteach.openshop.server.user.login", version = "0.0.1")
	public void login(
			@Param(type = ParameterType.BIZ, name = "username_or_email", required = true) String username,
			@Param(type = ParameterType.BIZ, name = "enPassword", required = true, ecrypted = true) String password,
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_REQUEST, required = true) HttpServletRequest request, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_RESPONSE, required = true) HttpServletResponse response, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_SESSION, required = true) HttpSession session,
			@Param(type = ParameterType.SYS, name = SysMappings.EXECUTION_CONTEXT, required = true) ExecutionContext context) {
		Message msg = userBO.login(username, password, request, response, session);
		if(msg.isSucceed()) {
			context.setCode(ErrorCode.SUCCEED);
		} else {
			context.setCode(ErrorCode.BIZ_ERROR);
			context.setErrorMsg(msg.getContent());
		}
	}
	
	@Api(name = "com.openteach.openshop.server.user.logout", version = "0.0.1")
	public void logout(
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_REQUEST) HttpServletRequest request, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_RESPONSE) HttpServletResponse response, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_SESSION) HttpSession session,
			@Param(type = ParameterType.SYS, name = SysMappings.EXECUTION_CONTEXT) ExecutionContext context) {
		Message msg = userBO.logout(request, response, session);
		if(msg.isSucceed()) {
			context.setCode(ErrorCode.SUCCEED);
		} else {
			context.setCode(ErrorCode.BIZ_ERROR);
			context.setErrorMsg(msg.getContent());
		}
	}
	
	@Api(name = "com.openteach.openshop.server.user.info.get", version = "0.0.1")
	public void getUserInfo(
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_REQUEST) HttpServletRequest request, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_RESPONSE) HttpServletResponse response, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_SESSION) HttpSession session,
			@Param(type = ParameterType.SYS, name = SysMappings.EXECUTION_CONTEXT) ExecutionContext context) {
		Message msg = userBO.logout(request, response, session);
		if(msg.isSucceed()) {
			context.setCode(ErrorCode.SUCCEED);
		} else {
			context.setCode(ErrorCode.BIZ_ERROR);
			context.setErrorMsg(msg.getContent());
		}
	}
	
	@Api(name = "com.openteach.openshop.server.user.info.update", version = "0.0.1")
	public void update(
			@Params(type = ParameterType.BIZ, name = "member", required = true) Member member,
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_REQUEST) HttpServletRequest request, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_RESPONSE) HttpServletResponse response, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_SESSION) HttpSession session,
			@Param(type = ParameterType.SYS, name = SysMappings.EXECUTION_CONTEXT) ExecutionContext context) {
		Message msg = userBO.logout(request, response, session);
		if(msg.isSucceed()) {
			context.setCode(ErrorCode.SUCCEED);
		} else {
			context.setCode(ErrorCode.BIZ_ERROR);
			context.setErrorMsg(msg.getContent());
		}
	}
	
	@Api(name = "com.openteach.openshop.server.user.password.find", version = "0.0.1")
	public void findPassword(
			@Params(type = ParameterType.BIZ, name = "email", required = true) String email,
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_REQUEST) HttpServletRequest request, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_RESPONSE) HttpServletResponse response, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_SESSION) HttpSession session,
			@Param(type = ParameterType.SYS, name = SysMappings.EXECUTION_CONTEXT) ExecutionContext context) {
		Message msg = userBO.findPassword(email, request, response, session);
		if(msg.isSucceed()) {
			context.setCode(ErrorCode.SUCCEED);
		} else {
			context.setCode(ErrorCode.BIZ_ERROR);
			context.setErrorMsg(msg.getContent());
		}
	}
	
	@Api(name = "com.openteach.openshop.server.user.password.reset", version = "0.0.1")
	public void resetPassword(
			@Param(type = ParameterType.BIZ, name = "token", required = true) String token,
			@Param(type = ParameterType.BIZ, name = "enPassword", required = true, ecrypted = true) String password,
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_REQUEST) HttpServletRequest request, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_RESPONSE) HttpServletResponse response, 
			@Param(type = ParameterType.SYS, name = SysMappings.HTTP_SESSION) HttpSession session,
			@Param(type = ParameterType.SYS, name = SysMappings.EXECUTION_CONTEXT) ExecutionContext context) {
		Message msg = userBO.resetPassword(token, password, request, response, session);
		if(msg.isSucceed()) {
			context.setCode(ErrorCode.SUCCEED);
		} else {
			context.setCode(ErrorCode.BIZ_ERROR);
			context.setErrorMsg(msg.getContent());
		}
	}
}
