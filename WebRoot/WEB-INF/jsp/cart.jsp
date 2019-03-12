<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>

<title>大卖场-购物车</title>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
	function setValue(id){
		var count = document.getElementById("count"+id).value;
		window.location.href="/sale/order/changeCount?id="+id+"&count="+count;
	}
	function deleteorder(id){
		window.location.href="/sale/order/deleteorder?id="+id;
	}
	function toIndex(){
		window.location.href="/sale/index/toIndex";
	}
	function checkout(price){
		window.location.href="/sale/order/tocheckout?price="+price;
	}
</script>
</head>

<body>
<div class="wrapper">
<c:if test="${msg!=null}">
	<script>
		alert("${msg}");
	</script>
</c:if>
  <jsp:include page="common/top.jsp" flush="true"/> 
  <div class="section_container"> 
    <!--Mid Section Starts-->
    <section> 
      <!--CART STARTS-->
      <div id="shopping_cart" class="full_page">
        <h1>购物车</h1>
<c:choose>
	<c:when test="${count==0}">
        <div class="message success">您的购物车内没有任何产品.</div>
    </c:when>
	<c:otherwise>
		<div class="action_buttonbar">
        <div class="cart_table">
          <table class="data-table cart-table" id="shopping-cart-table" cellpadding="0" cellspacing="0">
            <tr>
              <th colspan="2">产品</th>
              <th class="align_center" width="6%"></th>
              <th class="align_center" width="12%">单价</th>
              <th class="align_center" width="10%">数量</th>
              <th class="align_center" width="12%">总价</th>
              <th class="align_center" width="6%"></th>
            </tr>
        <c:forEach var="order" items="${list}" varStatus="status">
	         <tr>
	           <td width="10%"><img src="/sale/${order.product.img}" /></td>
	           <td class="align_left" width="44%"><a class="pr_name" href="#">${order.product.name}</a><span class="pr_info">${order.product.content}</span></td>
	           <td class="align_center"><a href="#" class="edit"></a></td>
	           <td class="align_center vline">￥<span class="price" id="price${order.id}">${order.singleprice}</span></td>
	           <td class="align_center vline"><input <c:if test="${order.product.sfms == 1 || order.product.sfjp == 1}">disabled="disabled"</c:if> class="qty_box" type="text" value=${order.count } id="count${order.id}" name="count${order.id}" onchange="setValue(${order.id});"/></td>
	           <td class="align_center vline">￥<span class="price" id="dsumpirce${order.id}">${order.price}</span></td>
	           <td class="align_center vline"><a href="javascript:deleteorder(${order.id});" class="remove"></a></td>
	         </tr>
        </c:forEach>
          </table>
          <div class="totals">
            <table id="totals-table">
                <tr>
                  <td width="60%" colspan="1" class="align_left"><strong>共计</strong></td>
                  <td class="align_right" style=""><strong><span class="price">￥${sumprice}</span></strong></td>
                </tr>
                <tr>
                  <td width="60%" colspan="1" class="align_left total">需支付</td>
                  <td class="align_right" style=""><span class="total">￥${sumprice}</span></td>
                </tr>                
            </table>
          </div>
        </div>
        <div class="action_buttonbar">
          <button type="button" title="" onclick="toIndex();" class="continue">继续购物</button>
          <button type="button" onclick="checkout('${sumprice}');" title="" class="checkout">结算</button>
        </div>
	</c:otherwise>
</c:choose>
      </div>
      <!--CART ENDS--> 
      
    </section>
    <!--Mid Section Ends--> 
  </div>
  <jsp:include page="common/buttom.jsp" flush="true"/> 
</div>
</body>
</html>