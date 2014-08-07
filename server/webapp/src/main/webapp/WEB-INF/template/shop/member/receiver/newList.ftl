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
						<a href="#" style="margin-left:20px;"><strong>管理收货地址</strong></a>
						
						<div style="float:right;margin-right:20px;">
							<a href="add.jhtml" class="button">${message("shop.member.receiver.add")}</a>
						</div>
							
					</div>
					<div class="body">
						<div class="list">
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
											<a href="javascript:;" class="use" onclick="parent.useAddress('${receiver.id}')">[${message("shop.member.handle.use")}]</a>
										</td>
									</tr>
								[/#list]
							</table>
							[#if !page.content?has_content]
								<p>${message("shop.member.noResult")}</p>
							[/#if]
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</body>
	[#include "/shop/include/js.ftl" /]
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