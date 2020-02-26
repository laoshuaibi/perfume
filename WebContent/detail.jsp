<%@page import="dao.ItemsDao"%>
<%@page import="entity.Items"%>
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
    <link rel="stylesheet" href="css/detail.css">
    <link href="toastr/toastr.css" rel="stylesheet">
	<script src="toastr/jquery-3.4.1.min.js"></script>
	<script src="toastr/toastr.js"></script>
    <script type="text/javascript" src="js/lhgcore.js"></script>
    <script type="text/javascript" src="js/lhgdialog.js"></script>
    <script type="text/javascript" src="js/myFun.js"></script>
    <c:set var="id" value="${Integer.parseInt(param.id)}" scope="page"></c:set>
    <c:set var="item" value="${ItemsDao.getItemsById(id)}" scope="page"></c:set>
    <script type="text/javascript">
    toastr.options = {
    		  "closeButton": true,
    		  "debug": false,
    		  "positionClass": "toast-top-left",
    		  "onclick": null,
    		  "showDuration": "100",
    		  "hideDuration": "100",
    		  "timeOut": "1000",
    		  "extendedTimeOut": "100",
    		  "showEasing": "swing",
    		  "hideEasing": "linear",
    		  "showMethod": "fadeIn",
    		  "hideMethod": "fadeOut"
    		}
    </script>
    <script type="text/javascript">
      function add()
      {
    	 
         var num = parseInt(document.getElementById("number").value);
         if(num<${item.getStock()})
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
<body class="fnb_zh_CN fnb_sticky-isOnTop">
    <div class="fnb_navigation">
        <div class="fnb_header fnb_white">
            <div class="fnb_gradient">
            </div>
            <c:import url="head.jsp"></c:import>
            <div class="fnb_main-menu">
            </div>
        </div>
    </div>
    
    <main role="main" class="fnb_main-container">
        <div class="container fnb_pdp-Breadcrumb fnb_breadcrumb-product">
            <div class="breadcrumb">
                <ol class="fnb_breadcrumb fnb_text-4 fnb_font-2 ">
                    <li><a href="index.jsp">首页</a></li>
                    <li>产品名称</li>
                </ol>
            </div>
        </div>
        
        <div class="container fnb_products-container fnb_plp-page load">
            <div class="row">
                <div class="fnb_pdp-image fnb_col-wd5 fnb_thumb-1">
                    <img class="fnb_img-responsive" src="img/${item.getPhoto()}" alt="">
                </div>
                <div class="fnb_col-wd6 information">
                    <div class="fnb_pdp-information">
                        <h1 class="fnb_pdp-title fnb_text-18">${item.getName() }</h1>
                        <p class="fnb_pdp-subtitle fnb_block-blc fnb_text-6">${item.getEngname() }</p>
                    </div>
                    <div class="detailfnb_desc">${item.getDesc() }</div>
                    <div class="item fnb_col-wd12">
                        <div class="title">价格:</div>
                        <div class="price">￥<span>${item.getPrice() }</span></div>
                    </div>
                    <div class="item fnb_col-wd12">
                        <div class="title">规格:</div>
                        <div class="capacity">
                            <ul>
                                <li class="now">30ml</li>
                                <li class="normal">50ml</li>
                                <li class="normal">100ml</li>
                            </ul>
                        </div>
                    </div>
                    <div class="item fnb_col-wd12">
                        <div class="title">库存:</div>
                        <div class="stock">${item.getStock() }</div>
                    </div>
                    <div class="item fnb_col-wd12">
                        <div class="Addcartnum">
                            <div class="numberBox">
                                <input type="text" class="text20" value="1" id="number" name="number">
                            </div>
                            <div class="arrow">
                                <div class="topArrow curPoint"  onclick="add();">
                                    <div class="icon1"></div>
                                </div>
                                <div class="bottomArrow"  onclick="sub();">
                                    <div class="icon2"></div>
                                </div>
                            </div>
                        </div>
                        <div class="button addToBagButton no-gutter-right">
                            <div class="has_btn">
                                <button type="button" onclick="selflog_show(${item.getId()})"
                                    class="shop-btn fnb_btn-state shop-btn-mirror fnb_btn fnb_content_btn fnb_black  fnb_submit fnb_event_listener fnb_font-1-b fnb_text-2 fnb_fulldiv fnb_addtobag-btn "
                                    style="opacity: 1;"><span style="opacity: 1;">加入购物袋</span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </main>
    <c:import url="tail.jsp"></c:import>
</body>

</html>
