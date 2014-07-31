[#assign current = "messageList" /]
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.member.message.view")}[#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
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
				<div class="message">
					<div class="title">${message("shop.member.message.view")}</div>
					<dl>
						<dt>
							<strong>${memberMessage.title}</strong>
							[#if memberMessage.sender == member]
								<span>${message("Message.receiver")}: [#if memberMessage.receiver??]${memberMessage.receiver.username}[#else]${message("shop.member.message.admin")}[/#if]</span>
							[#else]
								<span>${message("Message.sender")}: [#if memberMessage.sender??]${memberMessage.sender.username}[#else]${message("shop.member.message.admin")}[/#if]</span>
							[/#if]
						</dt>
						<dd>
							<div class="[#if memberMessage.sender == member]right[#else]left[/#if]">
								<p>${memberMessage.content}</p>
								<span>[#if memberMessage.sender??][${memberMessage.sender.username}][#else][${message("shop.member.message.admin")}][/#if] ${memberMessage.createDate?string("yyyy-MM-dd HH:mm:ss")}</span>
								<div class="arrow"></div>
							</div>
						</dd>
						[#list memberMessage.replyMessages as replyMessage]
							<dd>
								<div class="[#if replyMessage.sender == member]right[#else]left[/#if]">
									<p>${replyMessage.content}</p>
									<span>[#if replyMessage.sender??][${replyMessage.sender.username}][#else][${message("shop.member.message.admin")}][/#if] ${replyMessage.createDate?string("yyyy-MM-dd HH:mm:ss")}</span>
									<div class="arrow"></div>
								</div>
							</dd>
						[/#list]
					</dl>
				</div>
				<div class="input">
					<div class="title">${message("shop.member.message.reply")}</div>
					<form id="inputForm" action="reply.jhtml" method="post">
						<input type="hidden" name="id" value="${memberMessage.id}" />
						<table class="input">
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Message.content")}:
								</th>
								<td>
									<textarea name="content" class="text"></textarea>
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<input type="submit" class="button" value="${message("shop.member.message.send")}" />
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
			
			[@flash_message /]
			
			// 表单验证
			$inputForm.validate({
				rules: {
					content: {
						required: true,
						maxlength: 1000
					}
				}
			});
		
		});
	</script>
</html>