<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.brand.list")} - Powered By openteach inc.</title>
<meta name="author" content="openteach inc." />
<meta name="copyright" content="openteach inc." />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	[@flash_message /]

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.brand.list")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<div class="bar">
			<a href="add.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						${message("admin.page.pageSize")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li>
								<a href="javascript:;"[#if page.pageSize == 10] class="current"[/#if] val="10">10</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 20] class="current"[/#if] val="20">20</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 50] class="current"[/#if] val="50">50</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 100] class="current"[/#if] val="100">100</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${page.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if page.searchProperty == "name"] class="current"[/#if] val="name">${message("Brand.name")}</a>
						</li>
						<li>
							<a href="javascript:;"[#if page.searchProperty == "url"] class="current"[/#if] val="url">${message("Brand.url")}</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="name">${message("Brand.name")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="logo">${message("Brand.logo")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="url">${message("Brand.url")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="order">${message("admin.common.order")}</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as brand]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${brand.id}" />
					</td>
					<td>
						${brand.name}
					</td>
					<td>
						[#if brand.type == "image"]
							<a href="${brand.logo}" target="_blank">${message("admin.common.view")}</a>
						[#else]
							-
						[/#if]
					</td>
					<td>
						[#if brand.url??]
							<a href="${brand.url}" target="_blank">${brand.url}</a>
						[#else]
							-
						[/#if]
					</td>
					<td>
						${brand.order}
					</td>
					<td>
						<a href="edit.jhtml?id=${brand.id}">[${message("admin.common.edit")}]</a>
						<a href="${base}${brand.path}" target="_blank">[${message("admin.common.view")}]</a>
					</td>
				</tr>
			[/#list]
		</table>
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
	</form>
</body>
</html>