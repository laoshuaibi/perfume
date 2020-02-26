<%@page import="entity.*" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Perfume Store</title>
    <link rel="icon" href="img/icon.png">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/styles_zh_CN.css">
    <link rel="stylesheet"  href="css/cart.css"/>
    <link href="toastr/toastr.css" rel="stylesheet">
	<script src="toastr/jquery-3.4.1.min.js"></script>
	<script src="toastr/toastr.js"></script>
    <script type="text/javascript" src="js/lhgcore.js"></script>
    <script type="text/javascript" src="js/lhgdialog.js"></script>
    <script type="text/javascript" src="js/myFun.js"></script>
    <script language="javascript">
	    function delcfm(id) {
	    	if(window.confirm("确认删除吗？")){
	    		var xmlhttp=new XMLHttpRequest();
	        	xmlhttp.onreadystatechange=function(){
	                if (xmlhttp.readyState==4 && xmlhttp.status==200){
	                	window.location.reload();
	                  }
	                }
	          	xmlhttp.open("GET","servlet/CartServlet?action=delete&id="+id,true);
	          	xmlhttp.send();
	    	}	
	        	
	    }
	      function add()
	      {
	         var num = parseInt(document.getElementById("number").value);
	         if(num<100)
	         {
	            document.getElementById("number").value = ++num;
	         }
	      }
	      function sub()
	      {
	         var num = parseInt(document.getElementById("number").value);
	         if(num>1)
	         {
	            document.getElementById("number").value = --num;
	         }
	      }
   </script>
</head>

<body>
    <div class="fnb_navigation">
        <div class="fnb_header fnb_white">
            <div class="fnb_gradient">
            </div>
			<c:import url="head.jsp"></c:import>
        </div>
    </div>
    <div class="fnb_navigation">
        <div class="fnb_main-menu">
        </div>
    </div>
    <main role="main" class="fnb_main-container">
        <div class="container fnb_pdp-Breadcrumb fnb_breadcrumb-product">
            <div class="breadcrumb">
                <div class="fnb_breadcrumb fnb_text-5 fnb_font-3 ">
                    <a href="index.jsp"> <img src="img/return.png" alt=""><span>继续购物</span></a>
                </div>
            </div>
        </div>
        <div class="container fnb_products-container fnb_plp-page load">
            <div class="row">
                <div class="fnb_col-wd8 fnb_wider-8 no-gutter-right">
                    <div class="module-checkoutTable checkoutPublic">
                        <div class="module-checkoutTable-body">
                            <div class="_checkbox active"></div>
                            <ul class="module-checkoutTable-body-UHeader">
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-checkAll">全选
                                </li>
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-productInfo">
                                    商品信息
                                </li>
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-productPrice">
                                    单价(元)
                                </li>
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-productNumber">
                                    数量
                                </li>
                                <li
                                    class="module-checkoutTable-body-LHeader module-checkoutTable-Table-productSubtotal">
                                    小计(元)</li>
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-control">操作</li>
                            </ul>
                            <c:if test="${sessionScope.cart!=null}">
	                            <c:set var="goods" value="${sessionScope.cart.getGoods()}"></c:set>
	                            <c:forEach var="it" items="${goods}">
                            <div class="checkout-product-body" id="cont">
                                <div class="checkout-product-body-item">
                                    <div class="checkout-product-body-item-content">
                                        <div class="_checkbox none"></div>
                                        <a href="index.jsp" target="_blank" class="checkout-product-body-item-img">
                                            <img src="img/${it.key.getPhoto()}" class="" alt="" title=""></a>
                                        <div class="checkout-product-body-item-info">
                                            <h6 class="checkout-product-body-item-productNameCN">${it.key.getEngname()}</h6>
                                            <h6 class="checkout-product-body-item-productNameCN">${it.key.getName()}</h6>
                                        </div>
                                        <div class="checkout-product-body-item-unit">
                                            <div class="checkout-product-body-item-unit-price">
                                                <span class="checkout-product-body-item-unit-sapPrice">${it.key.getPrice()}</span>
                                                <span class="checkout-product-body-item-unit-offerPrice"></span>
                                            </div>
                                        </div>
                                        <div class="checkout-product-body-item-amount">
                                            <div class="checkout-product-body-item-amount-warp">
                                                <div class="mlnoe">
                                                    <span
                                                        class="checkout-product-body-item-amount-module-span">仅剩${it.key.getStock()}件</span>
                                                </div>
                                                <div class="checkout-product-body-item-amount-module">
                                                    <i class="checkout-product-body-item-amount-btn minus">-</i>
                                                    <span class="checkout-product-body-item-amount-num">${it.value}</span>
                                                    <i class="checkout-product-body-item-amount-btn">+</i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="checkout-product-body-item-subtotal">
                                            <div class="checkout-product-body-item-unit-price">
                                                <span class="checkout-product-body-item-unit-sapPrice">${it.key.getPrice()*it.value}</span>
                                            </div>
                                        </div>
                                        <div class="checkout-product-body-item-handle" onclick="delcfm(${it.key.getId()})">
                                            <div class="checkout-product-body-item-handle-module">
                                                <i class="checkout-product-body-item-handle-delete" ></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             </c:forEach>
                        </div>
                    </div>
                </div>
                <section class="fnb_bag_summary fnb_col-wd3 fnb_col-wd-offset-12 fnb_wideren_offset-1 no-gutter-left">
                    <section class="fnb_bill">
                        <header class="fnb_section-header">
                            <h2 class="fnb_section_title fnb_text-7 fnb_font-1 fnb_text_lh-25"> 总览</h2>
                            <p class="fnb_section_description fnb_text-4 fnb_font-1"> 订单编号<span class="fnb_font-bold">
                                    74748409</span> </p>
                        </header>
                        <div class="fnb_section-content">
                            <div class="fnb_bill-thl row">
                                <div class="fnb_bill-text fnb_col-wd8 fnb_text-4 fnb_font-1 fnb_half_bottom"> 商品总价</div>
                                <div
                                    class="fnb_bill_price fnb_col-wd4 pull-right no-gutter-left fnb_text-4  fnb_font-1-b">
                                    ${sessionScope.cart.getTotalPrice()}</div>
                            </div>

                            <div class="fnb_bill-tva row fnb_half_bottom">
                                <div class="fnb_bill-text fnb_col-wd8 fnb_text-4 fnb_font-2">
                                    配送费用</div>

                                <div class="fnb_bill_fee fnb_col-wd4 fnb_text-4 pull-right fnb_text-right fnb_font-1-b"
                                    id="taxes"> 免费配送</div>
                            </div>
                            <div class="row">
                                <div class="fnb_bill-text fnb_col-wd8 fnb_text-4 fnb_font-2 ">订单总计</div>
                                <div class="fnb_bill_fee fnb_col-wd4 fnb_text-4 pull-right fnb_font-2 fnb_text-right"
                                    id="taxes">${sessionScope.cart.getTotalPrice()}</div>
                            </div>
                            <div class="row fnb_submit">
                                <button type="submit" class="fnb_btn fnb_black fnb_col-wd12 fnb_font-1-b fnb_text-7">
                                    确认并付款</button>
                            </div>
                        </div>
                    </section>

                    <section class="fnb_question no-gutter">
                        <div class="fnb_section-content">
                            <h2 class="fnb_text-7 fnb_font-8"> 需要更多帮助？</h2>
                            <p class="fnb_text-4 fnb_font-2">
                                <span class="fnb_font-2"> 如有任何问题, <span>欢迎拨打客服热线</span> </span>
                                8888 236 888, 或通过在线客服联系我们</p>
                        </div>
                    </section>
                </section>
            </div>
            </c:if>
        </div>
    </main>
	<c:import url="tail.jsp"></c:import>
</body>
</html>