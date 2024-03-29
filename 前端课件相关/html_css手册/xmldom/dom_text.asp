
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

<title>XML DOM - Text 对象</title>
</head>

<body class="xml">
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

<div id="course"><h2>XML DOM</h2>
<ul>
<li><a href="index.asp" title="XML DOM 教程">DOM 首页</a></li>
<li><a href="dom_intro.asp" title="XML DOM 简介">DOM 简介</a></li>
<li><a href="dom_nodes.asp" title="XML DOM 节点">DOM 节点</a></li>
<li><a href="dom_nodetree.asp" title="XML DOM 节点树">DOM 节点树</a></li>
<li><a href="dom_parser.asp" title="解析 XML DOM">DOM 解析</a></li>
<li><a href="dom_loadxmldoc.asp" title="XML DOM 加载函数">DOM 加载</a></li>
<li><a href="dom_methods.asp" title="XML DOM - 属性和方法">DOM 属性和方法</a></li>
<li><a href="dom_nodes_access.asp" title="XML DOM 访问节点">DOM 访问节点</a></li>
<li><a href="dom_nodes_info.asp" title="XML DOM 节点信息">DOM 节点信息</a></li>
<li><a href="dom_nodes_nodelist.asp" title="XML DOM 节点列表">DOM 节点列表</a></li>
<li><a href="dom_nodes_traverse.asp" title="XML DOM 遍历节点">DOM 遍历节点</a></li>
<li><a href="dom_mozilla_vs_ie.asp" title="XML DOM 浏览器差异">DOM 浏览器</a></li>
<li><a href="dom_nodes_navigate.asp" title="XML DOM 定位节点">DOM 定位节点</a></li>
</ul>
<h2>节点操作</h2>
<ul>
<li><a href="dom_nodes_get.asp" title="XML DOM 获取节点值">DOM 获取节点</a></li>
<li><a href="dom_nodes_set.asp" title="XML DOM 改变节点值">DOM 改变节点</a></li>
<li><a href="dom_nodes_remove.asp" title="XML DOM 删除节点">DOM 删除节点</a></li>
<li><a href="dom_nodes_replace.asp" title="XML DOM 替换节点">DOM 替换节点</a></li>
<li><a href="dom_nodes_create.asp" title="XML DOM 创建节点">DOM 创建节点</a></li>
<li><a href="dom_nodes_add.asp" title="XML DOM 添加节点">DOM 添加节点</a></li>
<li><a href="dom_nodes_clone.asp" title="XML DOM 克隆节点">DOM 克隆节点</a></li>
<li><a href="dom_httprequest.asp" title="XMLHttpRequest 对象">DOM HttpRequest</a></li>
</ul>
<h2>XML DOM 参考手册</h2>
<ul>
<li><a href="xmldom_reference.asp" title="XML DOM 参考手册">DOM 手册目录</a></li>
<li><a href="dom_nodetype.asp" title="XML DOM 节点类型（Node Types）">DOM 节点类型</a></li>
<li><a href="dom_attribute.asp" title="XML DOM Attr 对象">DOM Attr</a></li>
<li><a href="dom_cdatasection.asp" title="XML DOM CDATASection 对象">DOM CDATASection</a></li>
<li><a href="dom_characterdata.asp" title="XML DOM CharacterData 对象">DOM CharacterData</a></li>
<li><a href="dom_css2properties.asp" title="XML DOM CSS2Properties 对象">DOM CSS2Properties</a></li>
<li><a href="dom_cssrule.asp" title="XML DOM CSSRule 对象">DOM CSSRule</a></li>
<li><a href="dom_cssstylerule.asp" title="XML DOM CSSStyleRule 对象">DOM CSSStyleRule</a></li>
<li><a href="dom_cssstylesheet.asp" title="XML DOM CSSStyleSheet 对象">DOM CSSStyleSheet</a></li>
<li><a href="dom_comment.asp" title="XML DOM Comment 对象">DOM Comment</a></li>
<li><a href="dom_document.asp" title="XML DOM Document 对象">DOM Document</a></li>
<li><a href="dom_documenttype.asp" title="XML DOM DocumentType 对象">DOM DocumentType</a></li>
<li><a href="dom_domexception.asp" title="XML DOM DOMException 对象">DOM DOMException</a></li>
<li><a href="dom_domimplementation.asp" title="XML DOM Implementation 对象">DOM Implementation</a></li>
<li><a href="dom_domparser.asp" title="XML DOM DOMParser 对象">DOM DOMParser</a></li>
<li><a href="dom_element.asp" title="XML DOM Element 对象">DOM Element</a></li>
<li><a href="dom_event.asp" title="XML DOM Event 对象">DOM Event</a></li>
<li><a href="dom_htmlcollection.asp" title="XML DOM HTMLCollection 对象">DOM HTMLCollection</a></li>
<li><a href="dom_htmldocument.asp" title="XML DOM HTMLDocument 对象">DOM HTMLDocument</a></li>
<li><a href="dom_htmlelement.asp" title="XML DOM HTMLElement 对象">DOM HTMLElement</a></li>
<li><a href="dom_namednodemap.asp" title="XML DOM NamedNodeMap 对象">DOM NamedNodeMap</a></li>
<li><a href="dom_node.asp" title="XML DOM Node 对象">DOM Node</a></li>
<li><a href="dom_nodelist.asp" title="XML DOM NodeList 对象">DOM NodeList</a></li>
<li><a href="dom_errors.asp" title="XML DOM ParseError 对象">DOM ParseError</a></li>
<li><a href="dom_processinginstruction.asp" title="XML DOM ProcessingInstr 对象">DOM ProcessingInstr</a></li>
<li><a href="dom_range.asp" title="XML DOM Range 对象">DOM Range</a></li>
<li><a href="dom_rangeexception.asp" title="XML DOM RangeException 对象">DOM RangeException</a></li>
<li class="currentLink"><a href="dom_text.asp" title="XML DOM Text 对象">DOM Text</a></li>
<li><a href="dom_http.asp" title="XML DOM XMLHttpRequest 对象">DOM XMLHttpRequest</a></li>
<li><a href="dom_xmlserializer.asp" title="XML DOM XMLSerializer 对象">DOM XMLSerializer</a></li>
<li><a href="dom_xpathexpression.asp" title="XML DOM XPathExpression 对象">DOM XPathExpression</a></li>
<li><a href="dom_xpathresult.asp" title="XML DOM XPathResult 对象">DOM XPathResult</a></li>
<li><a href="dom_xsltprocessor.asp" title="XML DOM XSLTProcessor 对象">DOM XSLTProcessor</a></li>
</ul>
<h2>DOM 实例</h2>
<ul>
<li><a href="../example/xdom_examples.asp" title="XML DOM 实例">DOM 实例</a></li>
<li><a href="dom_summary.asp" title="你已经学习了XML DOM，下一步呢？">DOM 总结</a></li>
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

<h1>XML DOM - Text 对象</h1>

<div id="tpn">
<ul class="prenext">
<li class="pre"><a href="dom_rangeexception.asp" title="XML DOM RangeException 对象">DOM RangeException</a></li>
<li class="next"><a href="dom_http.asp" title="XML DOM XMLHttpRequest 对象">DOM XMLHttpRequest</a></li>
</ul>
</div>

<div id="intro">
<p><strong>Text 对象表示元素或属性的文本内容。</strong></p>
</div>


<div>
<h2>Text 对象描述</h2>

<p>Text 节点表示 HTML 或 XML 文档中的一系列纯文本。因为纯文本出现在 HTML 和 XML 的元素和属性中，所以 Text 节点通常作为 Element 节点和 Attr 节点的子节点出现。</p>

<p>Text 节点继承了 <a href="dom_characterdata.asp">CharacterData 接口</a>，通过从 CharacterData 接口继承的 data 属性或从 Node 接口继承的 nadevalue 属性，可以访问 Text 节点的文本内容。</p>

<p>用从 CharacterData 继承的方法或 Text 接口自身定义的 splitText() 方法可以操作 Text 节点。使用 document.createTextNode() 来创建一个新的 Text 节点。</p>

<p>Text 节点没有子节点。</p>

<p>关于从文档的子树中删除空 Text 节点与合并相邻的 Text 节点的方法，请参阅 &quot;<a href="met_node_normalize.asp" title="XML DOM normalize() 方法">Node.normalize()</a>&quot; 参考页。</p>
</div>


<div>
<h2>Text 对象属性</h2>
<table class="dataintable">
<tr>
    <th style="width:32%">属性</th>
    <th>描述</th>
    <th style="width:6%">IE</th>
    <th style="width:6%">F</th>
    <th style="width:6%">O</th>
    <th style="width:7%">W3C</th>
</tr>
<tr>
	<td><a href="prop_text_data.asp">data</a></td>
	<td>设置或返回元素或属性的文本</td>
	<td>6</td>
	<td>1</td>
	<td>9</td>
	<td>Yes</td>
</tr>
<tr>
	<td>isElementContentWhitespace</td>
	<td>判断文本节点是否包含空白字符内容。</td>
	<td>No</td>
	<td>No</td>
	<td>No</td>
	<td>Yes</td>
</tr>
<tr>
	<td><a href="prop_text_length.asp">length</a></td>
	<td>返回元素或属性的文本长度</td>
	<td>6</td>
	<td>1</td>
	<td>9</td>
	<td>Yes</td>
</tr>
<tr>
	<td>wholeText</td>
	<td>以文档中的顺序向此节点返回相邻文本节点的所有文本</td>
	<td>No</td>
	<td>No</td>
	<td>No</td>
	<td>Yes</td>
</tr>
</table>
</div>


<div>
<h2>Text 对象方法</h2>
<table class="dataintable">
<tr>
    <th style="width:32%">方法</th>
    <th>描述</th>
    <th style="width:6%">IE</th>
    <th style="width:6%">F</th>
    <th style="width:6%">O</th>
    <th style="width:7%">W3C</th>
</tr>
<tr>
	<td><a href="met_text_appenddata.asp">appendData()</a></td>
	<td>向节点追加数据</td>
	<td>6</td>
	<td>1</td>
	<td>9</td>
	<td>Yes</td>
</tr>
<tr>
	<td><a href="met_text_deletedata.asp">deleteData()</a></td>
	<td>从节点删除数据</td>
	<td>6</td>
	<td>1</td>
	<td>9</td>
	<td>Yes</td>
</tr>
<tr>
	<td><a href="met_text_insertdata.asp">insertData()</a></td>
	<td>向节点中插入数据</td>
	<td>6</td>
	<td>1</td>
	<td>9</td>
	<td>Yes</td>
</tr>
<tr>
	<td><a href="met_text_replacedata.asp">replaceData()</a></td>
	<td>替换节点中的数据</td>
	<td>6</td>
	<td>1</td>
	<td>9</td>
	<td>Yes</td>
</tr>
<tr>
	<td>replaceWholeText()</td>
	<td>使用指定文本来替换此节点以及所有相邻的文本节点</td>
	<td>No</td>
	<td>No</td>
	<td>No</td>
	<td>Yes</td>
</tr>
<tr>
	<td><a href="met_text_splittext.asp">splitText()</a></td>
	<td>把一个 Text 节点分割成两个。</td>
	<td>6</td>
	<td>1</td>
	<td>9</td>
	<td>Yes</td>
</tr>
<tr>
	<td><a href="met_text_substringdata.asp">substringData()</a></td>
	<td>从节点提取数据</td>
	<td>6</td>
	<td>1</td>
	<td>9</td>
	<td>Yes</td>
</tr>
</table>
</div>


<div>
<h2>相关页面</h2>

<p>XML DOM 参考手册：<a href="dom_characterdata.asp">CharacterData 对象</a></p>
</div>


<div id="bpn">
<ul class="prenext">
<li class="pre"><a href="dom_rangeexception.asp" title="XML DOM RangeException 对象">DOM RangeException</a></li>
<li class="next"><a href="dom_http.asp" title="XML DOM XMLHttpRequest 对象">DOM XMLHttpRequest</a></li>
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
</div>

<div id="tools">
<h5 id="tools_reference"><a href="xmldom_reference.asp">XML DOM 参考手册</a></h5>
<h5 id="tools_example"><a href="../example/xdom_examples.asp">XML DOM 实例</a></h5>
</div>

<div id="ad">
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