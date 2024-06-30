<%@page import="onlinegroceryshopping.bean.ProductBean"%>
<%@page import="onlinegroceryshopping.model.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
</head>
<body>
<%@ include file="Header.jsp" %>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Product</h1>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%=SOTGView.WELCOME_CTL%>">Home</a></li>
                    <li class="breadcrumb-item active"><a href="<%=SOTGView.USER_PRODUCT_LIST_CTL%>">Products</a></li>
                </ol>
            </nav>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <!-- Image -->
		<% Long productId=(Long)request.getAttribute("ppID"); 
							ProductModel model=new ProductModel();
							ProductBean pBean= model.findByPK(productId);
						%>
        <div class="col-12 col-lg-6">
            <div class="card bg-light mb-3">
                <div class="card-body">
                    <a href="" data-toggle="modal" data-target="#productModal">
                        <img class="img-fluid" src="<%=SOTGView.APP_CONTEXT%>/images/<%=pBean.getImage()%>" />
                    </a>
                </div>
            </div>
        </div>

        <!-- Add to cart -->
        <div class="col-12 col-lg-6 add_to_cart_block">
            <div class="card bg-light mb-3">
                <div class="card-body">
                	<h2><%=pBean.getName()%></h2>
                    <p class="price"><%=pBean.getPrice()%></p>
                    <p><%=pBean.getDescription()%></p>
                    <form method="get" action="cart.html">
                       <%if(userLoggedIn){%>
                       	<%if(userBean.getRoleId()==2){%>
                        <a href="<%=SOTGView.CART_CTL%>?prodId=<%=pBean.getId()%>" class="btn btn-success btn-lg btn-block text-uppercase">
                            <i class="fa fa-shopping-cart"></i> Add To Cart
                        </a>
                        <%} %>
                        <%}else{ %>
                         <a href="<%=SOTGView.USER_LOGIN_CTL%>?product=<%=pBean.getName()%>&proIdd=<%=pBean.getId()%>" class="btn btn-success btn-lg btn-block text-uppercase">
                            <i class="fa fa-shopping-cart"></i> Add To Cart
                        </a>
                        <%}%>
                    </form>

                   
                    
                </div>
            </div>
        </div>
    </div>
    </div>
    
<%@ include file="Footer.jsp" %>
</body>
</html>