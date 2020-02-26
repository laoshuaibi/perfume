<%@ page pageEncoding="utf-8"%>
<%
	String username = "未登录";
	if(session.getAttribute("username")!=null){
		username = (String)session.getAttribute("username");
	}
%>
<div class="container">
                <div class="row fnb_gradient-menu">
                    <div class="fnb_text-center fnb_col-wd6 fnb_col-wd-offset-2">
                        <div class="fnb_logo">
                            <a href="index.jsp">
                                <img src="img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-wd-4 pull-right ">
                        <ul class="fnb_fixed-menu">
                            <li><input type="text" name="search" id="search" placeholder="请输查询内容...">
                                <i class="fa fa-search" aria-hidden="true"></i></li>
                            <li><i class="fa fa-user" aria-hidden="true"></i><span> <%=username %></span></li>
                            <li><i class="fa fa-shopping-bag" aria-hidden="true"></i> <a
                                    href="cart.jsp">购物袋(<span id="tolNum">0</span>)</a></li>
                        </ul>
                    </div>
                </div>
            </div>