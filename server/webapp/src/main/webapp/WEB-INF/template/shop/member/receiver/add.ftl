[#assign current = "receiverList" /]
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.member.receiver.add")}[#if systemShowPowered] - Powered By openteach inc.[/#if]</title>
		[#include "/shop/include/metaAndcss.ftl" /]
		<link href="${base}/resources/shop/css/member.css" rel="stylesheet" type="text/css" />
		
	</head>
	<body class="women ">
		
		<div id="fb-root"></div>
		<script src="${base}/assets/front/js/browser_detect.js"></script>
		
	    [#include "/shop/include/newHeader.ftl" /]
	    [#include "/shop/include/announcement.ftl" /]
	    
		<div class="container member">
			[#include "/shop/member/include/navigation.ftl" /]
			<div class="span18 last">
				<div class="input">
					<div class="title">${message("shop.member.receiver.add")}</div>
					<form id="inputForm" action="save.jhtml" method="post">
						<table class="input">
							<tr>
								<th>
									${message("Receiver.consignee")}: 
								</th>
								<td>
									<input type="text" name="consignee" class="text" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									${message("Receiver.area")}: 
								</th>
								<td>
									<span class="fieldSet">
										<input type="hidden" id="areaId" name="areaId" />
									</span>
								</td>
							</tr>
							<tr>
								<th>
									${message("Receiver.address")}: 
								</th>
								<td>
									<input type="text" name="address" class="text" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									${message("Receiver.zipCode")}: 
								</th>
								<td>
									<input type="text" name="zipCode" class="text" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									${message("Receiver.phone")}: 
								</th>
								<td>
									<input type="text" name="phone" class="text" maxlength="200" />
								</td>
							</tr>
							<tr>
								<th>
									${message("Receiver.isDefault")}:
								</th>
								<td>
									<input type="checkbox" name="isDefault" value="true" />
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
		[#include "/shop/include/newFooter.ftl" /]
	</body>
	<script type="text/javascript">
		$().ready(function() {
		
			var $inputForm = $("#inputForm");
			var $areaId = $("#areaId");
			
			[@flash_message /]
			
			// 地区选择
			$areaId.lSelect({
				url: "${base}/common/area.jhtml"
			});
			
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