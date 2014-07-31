<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.supplier.view")} - Powered By openteach inc.</title>
<meta name="author" content="openteach inc." />
<meta name="copyright" content="openteach inc." />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.cooperation.read")}
	</div>
	<table class="input">
		<tr>
			<th>
				${message("Cooperation.name")}:
			</th>
			<td>
				${cooperation.name}
			</td>
		</tr>
		<tr>
			<th>
				${message("Cooperation.phone")}:
			</th>
			<td>
				${cooperation.phone}
			</td>
		</tr>
		<tr>
			<th>
				${message("Cooperation.email")}:
			</th>
			<td>
				${cooperation.email}
			</td>
		</tr>
		<tr>
			<th>
				${message("Cooperation.msg")}:
			</th>
			<td>
				${cooperation.msg}
			</td>
		</tr>
		<tr>
			<th>
				${message("Cooperation.status")}:
			</th>
			<td>
				${message("Cooperation.status." + cooperation.status.name())}
			</td>
		</tr>
		<tr>
			<th>
				${message("Cooperation.memo")}:
			</th>
			<td>
				<textarea id="memo" style="width:320px;height:160px;">${cooperation.memo}</textarea>
			</td>
		</tr>
		
		<tr>
			<th>
				${message("Cooperation.handle")}:
			</th>
			<td>
				<a id="accept" href="#" class="button">${message("common.accept")}</a>
				<a id="reject" href="#" class="button">${message("common.reject")}</a>
			</td>
		</tr>
		
	</table>
</body>
<script type="text/javascript">
	$().ready(function() {
		var $memo = $('#memo');
		
		function request(status, memo) {
			
			$.ajax({
				url: 'handle.jhtml',
				type: "POST",
				data: {
					id: ${cooperation.id},
					memo: $memo.val(),
					status: status
				},
				dataType: "json",
				cache: false,
				success: function(message) {
					$.message(message);
					if (message.type == "success") {
						window.location.reload();
					}
				}
			});
			
			return false;
		};
		
		function accept(memo) {
			request('${ACCEPTED}', memo);
		};
		
		function reject(memo) {
			request('${REJECTED}', memo);
		};
		
		$('#accept').click(function() {
			accept($memo.val());
		});
		
		$('#reject').click(function() {
			reject($memo.val());
		});
	});
</script>
</html>