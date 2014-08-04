var online = new Array();
var qq = new Array();
qq[0] = new Array(); // 虚拟主机
qq[0][0] = "售前咨询";
qq[0][1] = "2456083389";


qq[1] = new Array(); //租用托管 / VPS
qq[1][0] = "售后技术支持";
qq[1][1] = "2450083389";
qq[1][2] = "2456083389";



qq[2] = new Array(); //投诉建议
qq[2][0] = "合作建议";
qq[2][1] = "2456083389";

var script_src = "http:\/\/webpresence.qq.com\/getonline?Type=1&"
// dynamic generate script src
for(i=0;i<qq.length;i++){
	for(j=1;j<qq[i].length;j++){
		script_src += qq[i][j];
		script_src += ":";
	}
}

document.write( "<script language=\"javascript\" src=\"" + script_src + "\"> <\/script>");

lastScrollY=0;

function heartBeat()
{ 
	var diffY;
	var ioc = document.getElementById("full");
	if(ioc == null || ioc == undefined)
			return;
	
	if (document.documentElement && document.documentElement.scrollTop)
			diffY = document.documentElement.scrollTop;
	else if (document.body)
	    diffY = document.body.scrollTop
	else
	    {/*Netscape stuff*/}

	percent = .1 * (diffY - lastScrollY); 
	if(percent>0){
		percent=Math.ceil(percent); 
	}
	else{
		percent=Math.floor(percent); 
	}
	ioc.style.top = ((isNaN(parseInt(ioc.style.top)) ? 0 :parseInt(ioc.style.top))  + percent).toString() + "px";
	lastScrollY = lastScrollY+percent; 
}
function mClk(){ //自
	event.srcElement.click();
}

var suspendcode;
var contactHandler;
contactHandler = setInterval("checkData()", 2000);

function definedData(varData){
	if(varData == null && varData == undefined){
		return false;
	}
	return true;
}
function checkData(){
	if(definedData(online[0])){
		clearInterval(contactHandler);
		suspendcode="<div id=\"full\" style='right:3px; top:150px; position:absolute;z-index:1000;text-align:center;'>\n"
		+ "<div id='con'>\n"
		+ "<div class='list'>\n";
		var onlineP = 0;
		for(i=0;i<qq.length;i++){
			suspendcode += " <div class='contact'>\n";
			suspendcode += "     <h3>" + qq[i][0] + "</h3>\n";
			for(j=1;j<qq[i].length;j++){
				suspendcode += "         <a href='tencent://message/?uin=" + qq[i][j] + "&Site=www.fqip.com&Menu=yes' class='qq'>\n";
				suspendcode += "            <img  border='0' align='absmiddle' src='/resources/shop/images/qqs_" + online[onlineP++] + ".gif' title='点击QQ与我们交流'/>在线客服" + j + "\n";
				suspendcode += "         </a>\n";
			}
			suspendcode += " </div>\n";
		}
		

		suspendcode = suspendcode + "</div>\n"
		+ "<a href='#' title='回到顶部' id='toTop' onfocus='this.blur()'><img src='/resources/shop/images/con_bom.png' width='128' height='22' style='border:0px' /></a>\n"
		+ "</div>\n"
		+ "</div>\n";
		document.getElementById("contactContanier").innerHTML = suspendcode;
	}
}



document.write("<div id=\"contactContanier\"><div id=\"toTop\"></div></div>"); 
window.setInterval("heartBeat()", 1);