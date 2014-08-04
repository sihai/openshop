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
		<title>${message("shop.member.receiver.list")}[#if systemShowPowered] - Powered By aigechibaole[/#if]</title>
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
				<div class="list">
					<div class="title">${message("shop.member.receiver.list")}</div>
					<div class="bar">
						<a href="add.jhtml" class="button">${message("shop.member.receiver.add")}</a>
					</div>
					<table id="listTable" class="list">
						<tr>
							<th>
								${message("Receiver.consignee")}
							</th>
							<th>
								${message("Receiver.address")}
							</th>
							<th>
								${message("Receiver.isDefault")}
							</th>
							<th>
								${message("shop.member.handle")}
							</th>
						</tr>
						[#list page.content as receiver]
							<tr[#if !receiver_has_next] class="last"[/#if]>
								<td>
									<input type="hidden" name="id" value="${receiver.id}" />
									${receiver.consignee}
								</td>
								<td>
									<span title="${receiver.areaName}${receiver.address}">${receiver.areaName}${abbreviate(receiver.address, 30, "...")}</span>
								</td>
								<td>
									${receiver.isDefault?string(message("shop.member.true"), message("shop.member.false"))}
								</td>
								<td>
									<a href="edit.jhtml?id=${receiver.id}">[${message("shop.member.handle.edit")}]</a>
									<a href="javascript:;" class="delete">[${message("shop.member.handle.delete")}]</a>
								</td>
							</tr>
						[/#list]
					</table>
					[#if !page.content?has_content]
						<p>${message("shop.member.noResult")}</p>
					[/#if]
				</div>
				[@pagination pageNumber = page.pageNumber totalPages = page.totalPages pattern = "?pageNumber={pageNumber}"]
					[#include "/shop/include/pagination.ftl"]
				[/@pagination]
			</div>
		</div>
		[#include "/shop/include/newFooter.ftl" /]
	</body>
	<script type="text/javascript">
		$().ready(function() {
			
			var $listTable = $("#listTable");
			var $delete = $("#listTable a.delete");
			
			[@flash_message /]
		
			// 删除
			$delete.click(function() {
				if (confirm("${message("shop.dialog.deleteConfirm")}")) {
					var $tr = $(this).closest("tr");
					var id = $tr.find("input[name='id']").val();
					$.ajax({
						url: "delete.jhtml",
						type: "POST",
						data: {id: id},
						dataType: "json",
						cache: false,
						success: function(message) {
							$.message(message);
							if (message.type == "success") {
								var $siblings = $tr.siblings();
								if ($siblings.size() <= 1) {
									$listTable.after('<p>${message("shop.member.noResult")}<\/p>');
								} else {
									$siblings.last().addClass("last");
								}
								$tr.remove();
							}
						}
					});
				}
				return false;
			});
		
		});
	</script>
</html>