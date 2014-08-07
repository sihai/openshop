<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta property="qc:admins" content="3275546717611753012174563757" />
		<meta property="wb:webmaster" content="955a134bdab20b26" />
		[@seo type = "index"]
			<title>[#if seo.title??][@seo.title?interpret /][#else]${message("shop.index.title")}[/#if][#if systemShowPowered] - Powered By openteach inc.[/#if]</title>
			[#if seo.keywords??]
				<meta name="keywords" content="[@seo.keywords?interpret /]" />
			[/#if]
			[#if seo.description??]
				<meta name="description" content="[@seo.description?interpret /]" />
			[/#if]
		[/@seo]

		[#include "/shop/include/metaAndcss.ftl" /]
		
	</head>
	<body>
		<div class="page">
			<div class="content">
				<div class="big-block">
					<div class="title">
						<div class="title_head"></div>
						<a href="#" style="margin-left:20px;"><strong>${message("shop.member.receiver.edit")}</strong></a>
					</div>
					<div class="body">
						<div class="input">
							<form id="inputForm" action="update.jhtml" method="post">
								<input type="hidden" name="id" value="${receiver.id}" />
								<table class="input">
									<tr>
										<th>
											${message("Receiver.consignee")}: 
										</th>
										<td>
											<input type="text" name="consignee" class="text" value="${receiver.consignee}" maxlength="200" />
										</td>
									</tr>
									<tr>
										<th>
											${message("Receiver.area")}: 
										</th>
										<td>
											<span class="fieldSet">
												<input type="hidden" id="areaId" name="areaId" value="${(receiver.area.id)!}" treePath="${(receiver.area.treePath)!}" />
											</span>
										</td>
									</tr>
									<tr>
										<th>
											${message("Receiver.address")}: 
										</th>
										<td>
											<input type="text" name="address" class="text" value="${receiver.address}" maxlength="200" />
										</td>
									</tr>
									<tr>
										<th>
											${message("Receiver.zipCode")}: 
										</th>
										<td>
											<input type="text" name="zipCode" class="text" value="${receiver.zipCode}" maxlength="200" />
										</td>
									</tr>
									<tr>
										<th>
											${message("Receiver.phone")}: 
										</th>
										<td>
											<input type="text" name="phone" class="text" value="${receiver.phone}" maxlength="200" />
										</td>
									</tr>
									<tr>
										<th>
											${message("Receiver.isDefault")}:
										</th>
										<td>
											<input type="checkbox" name="isDefault" value="true"[#if receiver.isDefault] checked="checked"[/#if] />
											<input type="hidden" name="_isDefault" value="false" />
										</td>
									</tr>
									<tr>
										<th>
											&nbsp;
										</th>
										<td>
											<input type="submit" class="button" value="${message("shop.member.submit")}" />
											<input type="button" class="button" value="${message("shop.member.back")}" onclick="location.href='list.jhtml'" />
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	[#include "/shop/include/js.ftl" /]
	<script type="text/javascript">
		$().ready(function() {
		
			var $inputForm = $("#inputForm");
			var $areaId = $("#areaId");
			
			[@flash_message /]
			
			// 地区选择
			$areaId.lSelect({
				url: "${base}/common/area.jhtml"
			});
			
			$.validator.addMethod("requiredOne", 
				function(value, element, param) {
					return $.trim(value) != "" || $.trim($(param).val()) != "";
				},
				"${message("shop.member.receiver.requiredOne")}"
			);
			
			// 表单验证
			$inputForm.validate({
				rules: {
					consignee: "required",
					areaId: "required",
					address: "required",
					zipCode: "required",
					phone: "required"
				}
			});
		
		});
	</script>
</html>