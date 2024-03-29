
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="Content-Language" content="zh-cn" />

<meta name="robots" content="all" />

<meta name="author" content="w3school.com.cn" />
<meta name="Copyright" content="Copyright W3school.com.cn All Rights Reserved." />
<meta name="MSSmartTagsPreventParsing" content="true" />
<meta http-equiv="imagetoolbar" content="false" />

<link rel="stylesheet" type="text/css" href="../c5.css" />
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />

<title>AJAX - onreadystatechange 事件</title>
</head>

<body class="browserscripting">
<div id="wrapper">

<div id="header">
<a href="../index.html" title="w3school 在线教程" style="float:left;">w3school 在线教程</a>
<div id="ad_head">
<script type="text/javascript"><!--
google_ad_client = "pub-3381531532877742";
/* 728x90, 创建于 08-12-1 */
google_ad_slot = "7423315034";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<acript type="text/javascript"
src="../../pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</div>
</div>

<div id="navfirst">
<ul id="menu">
<li id="h"><a href="../h.asp" title="HTML 系列教程">HTML 系列教程</a></li>
<li id="b"><a href="../b.asp" title="浏览器脚本教程">浏览器脚本</a></li>
<li id="s"><a href="../s.asp" title="服务器脚本教程">服务器脚本</a></li>
<li id="d"><a href="../d.asp" title="ASP.NET 教程">ASP.NET 教程</a></li>
<li id="x"><a href="../x.asp" title="XML 系列教程">XML 系列教程</a></li>
<li id="ws"><a href="../ws.asp" title="Web Services 系列教程">Web Services 系列教程</a></li>
<li id="w"><a href="../w.asp" title="建站手册">建站手册</a></li>
</ul>
</div>

<div id="navsecond">

<div id="course"><h2>AJAX 基础</h2>
<ul>
<li><a href="index.asp" title="AJAX 教程">AJAX 教程</a></li>
<li><a href="ajax_intro.asp" title="AJAX 简介">AJAX 简介</a></li>
<li><a href="ajax_example.asp" title="AJAX 实例">AJAX 实例</a></li>
</ul>
<h2>AJAX XHR</h2>
<ul>
<li><a href="ajax_xmlhttprequest_create.asp" title="AJAX - 创建 XMLHttpRequest 对象">XHR 创建对象</a></li>
<li><a href="ajax_xmlhttprequest_send.asp" title="AJAX - 向服务器发送请求">XHR 请求</a></li>
<li><a href="ajax_xmlhttprequest_response.asp" title="AJAX - 服务器响应">XHR 响应</a></li>
<li class="currentLink"><a href="ajax_xmlhttprequest_onreadystatechange.asp" title="AJAX - onreadystatechange 事件">XHR readyState</a></li>
</ul>
<h2>AJAX 高级</h2>
<ul>
<li><a href="ajax_asp_php.asp" title="AJAX ASP/PHP 实例">AJAX ASP/PHP</a></li>
<li><a href="ajax_database.asp" title="AJAX 数据库实例">AJAX 数据库</a></li>
<li><a href="ajax_xmlfile.asp" title="AJAX XML 实例">AJAX XML 文件</a></li>
</ul>
<h2>AJAX 实例</h2>
<ul>
<li><a href="../example/ajax_examples.asp" title="AJAX 实例">AJAX 实例</a></li>
</ul>
</div><div id="selected">
<h2>建站手册</h2>
<ul>
<li><a href="../site/index.asp" title="网站构建">网站构建</a></li>
<li><a href="../w3c/index.asp" title="万维网联盟 (W3C)">万维网联盟 (W3C)</a></li>
<li><a href="../browsers/index.asp" title="浏览器信息">浏览器信息</a></li>
<li><a href="../quality/index.asp" title="网站品质">网站品质</a></li>
<li><a href="../semweb/index.asp" title="语义网">语义网</a></li>
<li><a href="../careers/index.asp" title="职业规划">职业规划</a></li>
<li><a href="../hosting/index.asp" title="网站主机">网站主机</a></li>
</ul>

<h2><a href="../about/index.asp" title="关于 W3School" id="link_about">关于 W3School</a></h2>
<h2><a href="../about/about_helping.asp" title="帮助 W3School" id="link_help">帮助 W3School</a></h2>

</div>

</div>

<div id="maincontent">

<h1>AJAX - onreadystatechange 事件</h1>

<div id="tpn">
<ul class="prenext">
<li class="pre"><a href="ajax_xmlhttprequest_response.asp" title="AJAX - 服务器响应">XHR 响应</a></li>
<li class="next"><a href="ajax_asp_php.asp" title="AJAX ASP/PHP 实例">AJAX ASP/PHP</a></li>
</ul>
</div>


<div>
<h2>onreadystatechange 事件</h2>

<p>当请求被发送到服务器时，我们需要执行一些基于响应的任务。</p>

<p>每当 readyState 改变时，就会触发 onreadystatechange 事件。</p>

<p>readyState 属性存有 XMLHttpRequest 的状态信息。</p>

<p>下面是 XMLHttpRequest 对象的三个重要的属性：</p>

<table class="dataintable">
<tr>
<th style="width:25%;">属性</th>
<th>描述</th>
</tr>

<tr>
<td>onreadystatechange</td>
<td>存储函数（或函数名），每当 readyState 属性改变时，就会调用该函数。</td>
</tr>

<tr>
<td>readyState</td>
<td>
	<p>存有 XMLHttpRequest 的状态。从 0 到 4 发生变化。</p>
	<ul class="listintable">
	<li>0: 请求未初始化</li>
	<li>1: 服务器连接已建立</li>
	<li>2: 请求已接收</li>
	<li>3: 请求处理中</li>
	<li>4: 请求已完成，且响应已就绪</li>
	</ul>
</td>
</tr>

<tr>
<td>status</td>
<td><p>200: &quot;OK&quot;</p><p>404: 未找到页面</p></td>
</tr>
</table>

<p>在 onreadystatechange 事件中，我们规定当服务器响应已做好被处理的准备时所执行的任务。</p>

<p>当 readyState 等于 4 且状态为 200 时，表示响应已就绪：</p>

<pre>
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById(&quot;myDiv&quot;).innerHTML=xmlhttp.responseText;
    }
  }
</pre>

<p class="tiy"><a target="_blank" href="../tiy/t.asp@f=ajax_async_true">亲自试一试</a></p>

<p class="note"><span>注释：</span>onreadystatechange 事件被触发 5 次（0 - 4），对应着 readyState 的每个变化。</p>
</div>


<div>
<h2>使用 Callback 函数</h2>

<p>callback 函数是一种以参数形式传递给另一个函数的函数。</p>

<p>如果您的网站上存在多个 AJAX 任务，那么您应该为创建 XMLHttpRequest 对象编写一个<em>标准</em>的函数，并为每个 AJAX 任务调用该函数。</p>

<p>该函数调用应该包含 URL 以及发生 onreadystatechange 事件时执行的任务（每次调用可能不尽相同）：</p>

<pre>
function myFunction()
{
loadXMLDoc(&quot;ajax_info.txt&quot;,function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById(&quot;myDiv&quot;).innerHTML=xmlhttp.responseText;
    }
  });
}
</pre>

<p class="tiy"><a target="_blank" href="../tiy/t.asp@f=ajax_callback">亲自试一试</a></p>
</div>


<div id="bpn">
<ul class="prenext">
<li class="pre"><a href="ajax_xmlhttprequest_response.asp" title="AJAX - 服务器响应">XHR 响应</a></li>
<li class="next"><a href="ajax_asp_php.asp" title="AJAX ASP/PHP 实例">AJAX ASP/PHP</a></li>
</ul>
</div>

</div>

<div id="sidebar">

<div id="searchui">
<form method="get" id="searchform" action="http://www.google.com.hk/search">
<p><label for="searched_content">Search:</label></p>
<p><input type="hidden" name="sitesearch" value="w3school.com.cn" /></p>
<p>
<input type="text" name="as_q" class="box"  id="searched_content" title="在此输入搜索内容。" />
<input type="submit" value="Go" class="button" title="搜索！" />
</p>
</form>
</div><div id="ad">
<script type="text/javascript"><!--
google_ad_client = "ca-pub-3381531532877742";
/* sidebar-160x600 */
google_ad_slot = "3772569310";
google_ad_width = 160;
google_ad_height = 600;
//-->
</script>
<acript type="text/javascript"
src="../../pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</div>

</div>

<div id="footer">
<p>
W3School 提供的内容仅用于培训。我们不保证内容的正确性。通过使用本站内容随之而来的风险与本站无关。W3School 简体中文版的所有内容仅供测试，对任何法律问题及风险不承担任何责任。
</p>

<p>
当使用本站时，代表您已接受了本站的<a href="../about/about_use.asp" title="关于使用">使用条款</a>和<a href="../about/about_privacy.asp" title="关于隐私">隐私条款</a>。版权所有，保留一切权利。
赞助商：<a href="../../www.yktz.net/default.htm" title="上海赢科投资有限公司">上海赢科投资有限公司</a>。
<a href="../../www.miitbeian.gov.cn/default.htm">蒙ICP备06004630号</a>
</p>
</div>

</div>
</body>
</html>