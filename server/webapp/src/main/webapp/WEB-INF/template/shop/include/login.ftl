<div id="login-form-div" class="login-form">
	<form id="login-form" action="${base}/login/submit.jhtml" method="post" style="height:100%;width:100%;">
		<table style="height:100%;width:100%;">
			<tr>
				<td style="width:100px;">
				</td>
				<td style="width:250px;">
					<input type="text" id="login_username" name="username" class="text" data-empty="请输入邮箱或用户名"></input>
				</td>
				<td style="width:40px;">
				</td>
				<td style="width:250px;">
					<input type="password" id="login_password" name="password" class="text" data-empty="请输入密码"></input>
				</td>
				<td style="width:40px;">
				</td>
				<td style="width:350px;">
					<input type="text" id="login_captcha" name="captcha" class="text" data-empty="请输入验证码"></input>
					<img id="login_captchaImage" class="captchaImage" src="${base}/assets/front/images/spacer.gif" title="${message("shop.captcha.imageTitle")}" />
				</td>
				
				<td style="width:10px;">
				</td>
				<td>
					<input type="submit" class="myButton" value="登录"></input>
				</td>
			</tr>
		</table>
	</form>
</div>