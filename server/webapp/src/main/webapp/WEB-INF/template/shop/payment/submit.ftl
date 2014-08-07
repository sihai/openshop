<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="web-mosaic" xmlns:fb="http://www.facebook.com/2008/fbml">
<!--<![endif]-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=[#if requestCharset?has_content]${requestCharset}[#else]utf-8[/#if]" />
		<title>${message("shop.payment.submit")} - Powered By openteach inc.</title>
		<meta name="author" content="openteach inc." />
		<meta name="copyright" content="aigechibaole" />
	</head>
	<body class="women " onload="javascript: document.forms[0].submit();">
		<form action="${requestUrl}"[#if requestMethod??] method="${requestMethod}"[/#if][#if requestCharset?has_content] accept-charset="${requestCharset}"[/#if]>
			[#list parameterMap.entrySet() as entry]
				<input type="hidden" name="${entry.key}" value="${entry.value}" />
			[/#list]
		</form>
	</body>
</html>