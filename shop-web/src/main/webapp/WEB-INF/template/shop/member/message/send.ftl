[#assign current = "messageSend" /]
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>${message("shop.member.message.send")}[#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
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
					<div class="title">${message("shop.member.message.send")}</div>
					<form id="inputForm" action="send.jhtml" method="post">
						<input type="hidden" name="draftMessageId" value="${(draftMessage.id)!}" />
						<input type="hidden" id="isDraft" name="isDraft" value="false" />
						<table class="input">
							<tr>
								<th>
									<span class="requiredField">*</span>${message("shop.member.message.sendTo")}:
								</th>
								<td>
									<label>
										<input type="radio" name="type" value="member"[#if !draftMessage?? || (draftMessage?? && draftMessage.receiver??)] checked="checked"[/#if] />${message("shop.member.message.otherMember")}
									</label>
									<label>
										<input type="radio" name="type" value="admin"[#if draftMessage?? && !draftMessage.receiver??] checked="checked"[/#if] />${message("shop.member.message.admin")}
									</label>
								</td>
							</tr>
							<tr id="receiverTr"[#if draftMessage?? && !draftMessage.receiver??] class="hidden"[/#if]>
								<th>
									<span class="requiredField">*</span>${message("shop.member.message.receiverUsername")}:
								</th>
								<td>
									<input type="text" id="username" name="username" class="text" maxlength="${setting.usernameMaxLength}" value="${(draftMessage.receiver.username)!}"[#if draftMessage?? && !draftMessage.receiver??] disabled="disabled"[/#if] />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Message.title")}:
								</th>
								<td>
									<input type="text" name="title" class="text" maxlength="200" value="${(draftMessage.title)!}" />
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>${message("Message.content")}:
								</th>
								<td>
									<textarea name="content" class="text">${(draftMessage.content?html)!}</textarea>
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<input type="button" id="send" class="button" value="${message("shop.member.message.sendNow")}" />
									[#if !draftMessage??]
										<input type="button" id="save" class="button" value="${message("shop.member.message.saveDraft")}" />
									[/#if]
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
			var $isDraft = $("#isDraft");
			var $type = $("input[name='type']");
			var $receiverTr = $("#receiverTr");
			var $username = $("#username");
			var $send = $("#send");
			var $save = $("#save");
			
			// 发送类型
			$type.click(function() {
				var $this = $(this);
				if ($this.val() == "member") {
					$username.prop("disabled", false);
					$receiverTr.show();
				} else {
					$username.prop("disabled", true);
					$receiverTr.hide();
				}
			});
			
			// 立即发送
			$send.click(function() {
				$isDraft.val("false");
				$inputForm.submit();
			});
			
			// 保存为草稿
			$save.click(function() {
				$isDraft.val("true");
				$inputForm.submit();
			});
			
			$.validator.addMethod("notEqualsIgnoreCase", 
				function(value, element, param) {
					return this.optional(element) || param.toLowerCase() != value.toLowerCase()
				}
			);
			
			// 表单验证
			$inputForm.validate({
				rules: {
					username: {
						required: true,
						notEqualsIgnoreCase: "${member.username}",
						remote: {
							url: "check_username.jhtml",
							cache: false
						}
					},
					title: {
						required: true
					},
					content: {
						required: true,
						maxlength: 1000
					}
				},
				messages: {
					username: {
						notEqualsIgnoreCase: "${message("shop.member.message.notAllowSelf")}",
						remote: "${message("shop.member.message.memberNotExsit")}"
					}
				}
			});
		
		});
	</script>
</html>