<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>

<title>大卖场-促销专区</title>
<!--CSS-->
<link rel="stylesheet" href="/sale/resources/css/styles.css" />
<!--Google Webfont -->
<link href='http://fonts.googleapis.com/css?family=Istok+Web' rel='stylesheet' type='text/css' />
<!--Javascript-->
<script type="text/javascript" src="/sale/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/sale/resources/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="/sale/resources/js/jquery.easing.js"></script>
<script type="text/javascript" src="/sale/resources/js/jquery.jcarousel.js"></script>
<script type="text/javascript" src="/sale/resources/js/form_elements.js"></script>
<script type="text/javascript" src="/sale/resources/js/custom.js"></script>
<!--[if lt IE 9]>
    <script src="js/html5.js"></script>
<![endif]-->
<!-- mobile setting -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
<script type="text/javascript">
  window.onload=function(){
	    var sa_bars= document.getElementsByName('sa_bar');
	    for(var i=0;i<sa_bars.length;i++){
	    	 if(i==1){
	    		 document.getElementsByName('sa_bar')[1].className='active';  
	    	 }else{
	    		 document.getElementsByName('sa_bar')[i].className=''; 
	    	 }
	    } 
  }
</script>
<div class="wrapper">
  <jsp:include page="common/top.jsp" flush="true"/>
  <div class="section_container"> 
    <!--Mid Section Starts-->
    <section>
    <!--PRODUCT DETAIL STARTS-->
    <div id="product_detail"> 
      <!--Product Left Starts-->
      <div class="product_leftcol"> <img src="/sale/${product.img}" style="width: 363px;height: 413px;" /> <span class="pr_info"></span>
      </div>
      <!--Product Left Ends--> 
      <!--Product Right Starts-->
      <div class="product_rightcol"> 
        <h1>${product.name}</h1>
        <p class="short_dc" /> ${product.content}
        
        <div class="pr_price"> <big>￥${product.newprice}</big> <small>￥${product.price}</small> </div>
        <div class="add_to_buttons">
          <button onclick="javascript:addCart('${product.id }','${product.newprice }');" class="add_cart">加    入    购    物    车  </button>
        </div>
      </div>
    <!--Product Right Ends--> 
  </div>
  <!--PRODUCT DETAIL ENDS--> 
  <!--Product List Starts-->
  <div class="products_list products_slider">
    <h2 class="sub_title">您可能还喜欢</h2>
    <ul id="first-carousel" class="first-and-second-carousel jcarousel-skin-tango">
      <c:forEach var="cxproduct" items="${cxlist}" varStatus="status">
          <li> <a href="javascript:cxdetail(${cxproduct.id });" class="product_image"><img src="/sale/${cxproduct.img}" style="width: 216px;height: 245px;"/></a>
              <div class="product_info">
                  <h3><a href="javascript:cxdetail(${cxproduct.id });">${cxproduct.name }</a></h3>
                  <small>${cxproduct.content }</small> </div>
              <div class="price_info"> <a href="javascript:addCart('${cxproduct.id }','${cxproduct.newprice }');">+ 加入收藏</a>
                  <button class="price_add" onclick="addCart('${cxproduct.id }','${cxproduct.newprice }');" title="" type="button"><span class="pr_price">¥${cxproduct.newprice }</span><span class="pr_add">加入购物车</span></button>
              </div>
          </li>
      </c:forEach>
    </ul>
  </div>
  <!--Product List Ends--> 
  </section>
  <!--Mid Section Ends--> 
</div>
	<jsp:include page="common/buttom.jsp" flush="true"/> 
</div>
</body>
</html>
