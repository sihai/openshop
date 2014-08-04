<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.supplier.edit")} - Powered By openteach inc.</title>
<meta name="author" content="openteach inc." />
<meta name="copyright" content="openteach inc." />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $browserButton = $("#browserButton");
	
	[@flash_message /]
	
	$browserButton.browser();
	
	// 表单验证
	$inputForm.validate({
		rules: {
			password: {
				required: true,
				pattern: /^[^\s&\"<>]+$/,
				minlength: 4,
				maxlength: 20
			},
			rePassword: {
				required: true,
				equalTo: "#password"
			},
			email: {
				required: false,
				email: true
			}
		},
		messages: {
			username: {
				pattern: "${message("admin.validate.illegal")}",
				remote: "${message("admin.validate.exist")}"
			},
			password: {
				pattern: "${message("admin.validate.illegal")}"
			}
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.supplier.edit")}
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${supplier.id}" />
		<table class="input">
			<tr>
				<th>
					${message("Supplier.name")}:
				</th>
				<td>
					${supplier.name}
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Supplier.password")}:
				</th>
				<td>
					<input type="password" id="password" name="password" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Supplier.rePassword")}:
				</th>
				<td>
					<input type="password" id="rePassword" name="rePassword" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField"></span>${message("Supplier.email")}:
				</th>
				<td>
					<input type="text" id="email" name="email" class="text" value="${supplier.email}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField"></span>${message("Supplier.alipay")}:
				</th>
				<td>
					<input type="text" id="alipay" name="alipay" class="text" value="${supplier.alipay}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField"></span>${message("Supplier.bank")}:
				</th>
				<td>
					<input type="text" id="bank" name="bank" class="text" value="${supplier.bank}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField"></span>${message("Supplier.account")}:
				</th>
				<td>
					<input type="text" id="account" name="account" class="text" value="${supplier.account}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Supplier.level")}:
				</th>
				<td>
					<select id="level" name="level">
						[#list levels as level]
							<option value="${level}" [#if supplier.level?? && supplier.level == level] selected="selected"[/#if]>${message("Supplier.level." + level)}</option>
						[/#list]
					</select>
				</td>
			</tr>
			
			<tr>
				<th>
					${message("supplier.common.setting")}:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isEnabled" value="true"[#if supplier.isEnabled] checked="checked"[/#if] />${message("Supplier.isEnabled")}
						<input type="hidden" name="_isEnabled" value="false" />
					</label>
					[#if supplier.isLocked]
						<label>
							<input type="checkbox" name="isLocked" value="true" checked="checked" />${message("Supplier.isLocked")}
							<input type="hidden" name="_isLocked" value="false" />
						</label>
					[/#if]
				</td>
			</tr>
			
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>