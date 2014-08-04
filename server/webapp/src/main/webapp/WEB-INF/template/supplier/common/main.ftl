[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("supplier.main.title")} - Powered By openteach inc.</title>
<meta name="author" content="openteach inc." />
<meta name="copyright" content="openteach inc." />
<link href="${base}/resources/supplier/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/supplier/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/supplier/js/jquery.js"></script>
<style type="text/css">
*{
	font: 12px tahoma, Arial, Verdana, sans-serif;
}
html, body {
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $nav = $("#nav a:not(:last)");
	var $menu = $("#menu dl");
	var $menuItem = $("#menu a");
	
	$nav.click(function() {
		var $this = $(this);
		$nav.removeClass("current");
		$this.addClass("current");
		var $currentMenu = $($this.attr("href"));
		$menu.hide();
		showMenu($currentMenu);
		return false;
	});
	
	$menuItem.click(function() {
		var $this = $(this);
		$menuItem.removeClass("current");
		$this.addClass("current");
	});
	
	function showMenu(menu) {
		var href = $("#" + menu.attr("id") + " a:first").attr("href");
		menu.show();
		$("#iframe").attr("src", href);
	}
});
</script>
</head>
<body>
	<script type="text/javascript">
		if (self != top) {
			top.location = self.location;
		};
	</script>
	<table class="main">
		<tr>
			<th class="logo">
				<a href="main.jhtml">
					<img width="160" height="80" src="${base}/resources/admin/images/header_logo.gif" alt="AIGECHIBAOLE" />
				</a>
			</th>
			<th>
				<div id="nav" class="nav">
					<ul>
						<li>
							<a href="#supplier">${message("supplier.main.myInfoNav")}</a>
						</li>
						
						<li>
							<a href="#order">${message("supplier.main.orderNav")}</a>
						</li>
						
						<li>
							<a href="${base}/" target="_blank">${message("supplier.main.home")}</a>
						</li>
					</ul>
				</div>
				<div class="link">
					<a href="http://www.aigechibaole.com" target="_blank">${message("supplier.main.official")}</a>|
					<a href="http://bbs.aigechibaole" target="_blank">${message("supplier.main.bbs")}</a>|
					<a href="http://www.aigechibaole.com/about.html" target="_blank">${message("supplier.main.about")}</a>
				</div>
				<div class="link">
					<strong>[@shiro.principal /]</strong>
					${message("supplier.main.hello")}!
					<a href="../profile/edit.jhtml" target="iframe">[${message("supplier.main.profile")}]</a>
					<a href="../logout.jsp" target="_top">[${message("supplier.main.logout")}]</a>
				</div>
			</th>
		</tr>
		<tr>
			<td id="menu" class="menu">
				
				<dl id="supplier" class="default">
					<dt>${message("supplier.main.myInfoGroup")}</dt>
					<dd>
						<a href="../common/my_info.jhtml" target="iframe">${message("supplier.main.myInfo")}</a>
					</dd>
				</dl>
			
				<dl id="order">
					<dt>${message("supplier.main.orderGroup")}</dt>
						<dd>
							<a href="../order/list.jhtml" target="iframe">${message("supplier.main.order")}</a>
						</dd>
				</dl>
			</td>
			<td>
				<iframe id="iframe" name="iframe" src="index.jhtml" frameborder="0"></iframe>
			</td>
		</tr>
	</table>
</body>
</html>