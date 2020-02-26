<%@page import="entity.Cart"%>
<%@page import="javax.websocket.Session"%>
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
    <link href="toastr/toastr.css" rel="stylesheet">
	<script src="toastr/jquery-3.4.1.min.js"></script>
	<script src="toastr/toastr.js"></script>
    <script type="text/javascript" src="js/lhgcore.js"></script>
    <script type="text/javascript" src="js/lhgdialog.js"></script>
    <script type="text/javascript" src="js/myFun.js"></script>
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
</head>

<body class="fnb_zh_CN fnb_sticky-isOnTop">
    <div class="fnb_navigation">
        <div class="fnb_header fnb_white">
            <div class="fnb_gradient">
            </div>
            <c:import url="head.jsp"></c:import>
            <div class="fnb_main-menu">
                <div class="fnb_main-menu-items">
                  
                    <div class="total menuitem">

                        <div class="fnb_main-menu-item">
                            <a class="fnb_active" href="" data-link="#totaltab">ALL</a>
                        </div>
                    </div>
                    <div class="Chanel menuitem">
                        <div class="fnb_main-menu-item">
                            <a class="" href="" data-link="#Chaneltab">CHANEL</a>
                        </div>
                    </div>
                    <div class="dior menuitem">
                        <div class="fnb_main-menu-item">
                            <a class="" href="" data-link="#diortab">Dior</a>
                        </div>
                    </div>
                    <div class="Lancome menuitem">
                        <div class="fnb_main-menu-item">
                            <a class="" href="" data-link="#Lancometab">LANCOME</a>
                        </div>
                    </div>
                    <div class="BVLGARI menuitem">
                        <div class="fnb_main-menu-item">
                            <a class="" href="" data-link="#BVLGARItab">BVLGARI</a>
                        </div>
                    </div>
                    <div class="Other menuitem">
                        <div class="fnb_main-menu-item">
                            <a class="" href="" data-link="#Othertab">Other</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <main role="main" class="fnb_main-container">
        <div class="pushZone">
            <section class="fnb_fullbleed-container fnb_is-parent">
                <div class="paredito parsys"></div>
            </section>
        </div>
        <div class="container fnb_products-container fnb_plp-page load">
            <div class="fnb_products__ container clearfix fnb_products-container">
                <ul class="row">
                	<c:set var="list" value="${ItemsDao.getAllItems()}" scope="page"></c:set>
                		<c:if test="${not empty list}">
	                		<c:forEach items="${list}" var="item">
			                    <li class="fnb_inline">
			                        <div class="fnb_col-wd6 fnb_product-grid clearfix fnb_event_listener fadding">
			                            <div class="fnb_col-wd6 fnb_product-img">
			                                <a href="detail.jsp?id=${item.getId()}"><img class="fnb_img-responsive fnb_img-desc load" src="img/${item.getPhoto()}" alt=""></a>
			                            </div>
			                            <div class="fnb_col-wd6 fnb_product-grid-infos">
			                                <div class="fnb_inline-block">
			                                    <div class="fnb_product-title"><a href="detail.jsp?id=${item.getId()}">${item.getEngname()}</a></div>
			                                </div>
			                                <div class="fnb_product_grid_description">
			                                    <p><a href="detail.jsp?id=${item.getId()}">${item.getName()}</a></p>
			                                    <p class="fnb_desc">${item.getDesc()}</p>
			                                </div>
			                                <p class="fnb_text-3 fnb_product-price fnb_font-2 ">￥<span>${item.getPrice()}</span></p>
			                                <div class="fnb_buy">
			                                    <div class="quickbuyButton button">
			                                        <div style="text-align: left">
			                                            <div class="fnb_buy">
			                                                <button class="fnb_btn fnb_content_btn fnb_black  fnb_font-1 fnb_quickbuy-btn  " type="button">立即购买</button>
			                                                <button class="fnb_btn fnb_content_btn fnb_black  fnb_font-1 fnb_quickbuy-btn  " type="button" onclick="selflog_show(${item.getId()});showNum()">加入购物袋</button>
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
			                    </li>
	                    </c:forEach>
                    </c:if>
                </ul>
            </div>
        </div>
        <div class="container fnb_products-container">
            <div id="pagination" class="pagination">
                <ul>
                    <li class="disabled">&lt;</li>
                    <li class="active">1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li>&gt;</li>
                </ul>
            </div>
        </div>
    </main>
    <c:import url="tail.jsp"></c:import>
</body>

</html>

