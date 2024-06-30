<%@page import="onlinegroceryshopping.util.ServletUtility"%>
<%@page import="onlinegroceryshopping.controller.UserProductCtl"%>
<%@page import="java.util.List"%>
<%@page import="onlinegroceryshopping.bean.CartBean"%>
<%@page import="onlinegroceryshopping.model.CartModel"%>
<%@page import="onlinegroceryshopping.controller.LoginCtl"%>
<%@page import="onlinegroceryshopping.controller.SOTGView"%>
<%@page import="onlinegroceryshopping.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="/ScienceOlympiadToGo/css/style.css" rel="stylesheet" >
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<script type="text/javascript">
$(document).ready(function(){
    var quantity = 1;

    $('.quantity-right-plus').click(function(e){
        e.preventDefault();
        var quantity = parseInt($('#quantity').val());
        $('#quantity').val(quantity + 1);
    });

    $('.quantity-left-minus').click(function(e){
        e.preventDefault();
        var quantity = parseInt($('#quantity').val());
        if(quantity > 1){
            $('#quantity').val(quantity - 1);
        }
    });

});

</script>
</head>
<body>
 <%
    UserBean userBean = (UserBean) session.getAttribute("user");

    boolean userLoggedIn = userBean != null;

    String welcomeMsg = "Hi, ";

    if (userLoggedIn) {
        String role = (String) session.getAttribute("role");
        welcomeMsg += userBean.getFirstName() + " (" + role + ")";
    } else {
        welcomeMsg += "Guest";
    }

%>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Online Grocery Shopping<br><font style="font-size:13px" >(Buy It Now)</font></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
            
            <%if(userLoggedIn){ %>
 					<%if(userBean.getRoleId()==1){%>              
                <li class="nav-item active">
                    <a class="nav-link" href="<%=SOTGView.HOME_CTL%>">Home <span class="sr-only">(current)</span></a>
                </li>
                
                <li class="nav-item ">
                    <a class="nav-link" href="<%=SOTGView.ADMIN_CTL%>">Add Admin</a>
                </li>
                
                <li class="nav-item ">
                    <a class="nav-link" href="<%=SOTGView.CATEGORY_LIST_CTL%>">Categories </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="<%=SOTGView.PRODUCT_LIST_CTL%>">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=SOTGView.INVOICE_LIST_CTL%>">Sell History</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="<%=SOTGView.CONTECT_LIST_CTL%>">Contacts</a>
                </li>
             
               <%}else if(userBean.getRoleId()==2){ %>
              
               	<li class="nav-item active">
                    <a class="nav-link" href="<%=SOTGView.WELCOME_CTL%>">Home <span class="sr-only">(current)</span></a>
                </li>
               
               <li class="nav-item">
                    <a class="nav-link" href="<%=SOTGView.USER_PRODUCT_LIST_CTL%>">Product</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="<%=SOTGView.INVOICE_LIST_CTL%>">History</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="<%=SOTGView.CONTECT_CTL%>">Contact</a>
                </li>
               <%} %>
              <%}else{%>
              	<li class="nav-item active">
                    <a class="nav-link" href="<%=SOTGView.WELCOME_CTL%>">Home <span class="sr-only">(current)</span> </a>
                </li>
                
                 <li class="nav-item">
                    <a class="nav-link" href="<%=SOTGView.USER_PRODUCT_LIST_CTL%>">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=SOTGView.CONTECT_CTL%>">Contact</a>
                </li>
              <%}%>
             
               
                
            </ul>
            
            <%if(userLoggedIn){%>
            <%if(userBean.getRoleId()==2){ %>
           	 <form class="form-inline my-2 my-lg-0" action="<%=SOTGView.USER_PRODUCT_LIST_CTL%>" method="post">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" aria-label="Small" name="name" aria-describedby="inputGroup-sizing-sm" placeholder="Search Product..." value="<%=ServletUtility.getParameter("name", request)%>" >
                    <div class="input-group-append">
                        <input type="submit" name="operation" class="btn btn-info" value="<%=UserProductCtl.OP_SEARCH%>"/>
                        
                    </div>
                </div>
                </form>
                <%} %>
                <%}else{%>
                 <form class="form-inline my-2 my-lg-0" action="<%=SOTGView.USER_PRODUCT_LIST_CTL%>" method="post">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" aria-label="Small" name="name" aria-describedby="inputGroup-sizing-sm" placeholder="Search Product..." value="<%=ServletUtility.getParameter("name", request)%>">
                    <div class="input-group-append">
                       <input type="submit" name="operation" class="btn btn-info" value="<%=UserProductCtl.OP_SEARCH%>"/>
                        
                    </div>
                </div>
                </form>
                <%} %>
                <%if(userLoggedIn){%>
                	 <%if(userBean.getRoleId()==2){ %>
                <a class="btn btn-success btn-sm ml-3" href="<%=SOTGView.CART_LIST_CTL%>">
                    <i class="fa fa-shopping-cart"></i> Cart
                    
    				<%  CartModel cModel=new CartModel();
                    		CartBean cBean=new CartBean();
                    		cBean.setUserId(userBean.getId());
                    	 List list=cModel.search(cBean);
                    %>
                    <%if(list.size()>0){ %>
                    <span class="badge badge-light"><%=list.size()%></span>
                	<%} %>
                </a>
                <%} %>
                <a class="btn btn-success btn-sm ml-3" href="<%=SOTGView.MY_PROFILE_CTL%>">
                    <i class="fa fa-user"></i>My Profile
                </a>
                <a class="btn btn-success btn-sm ml-3" href="<%=SOTGView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">
                    <i class="fa fa-sign-out"></i> Logout
                </a>  
                <%}else{%>
                <a class="btn btn-success btn-sm ml-3" href="<%=SOTGView.LOGIN_CTL%>">
                    <i class="fa fa-sign-in"></i> Login
                </a>
                <a class="btn btn-success btn-sm ml-3" href="<%=SOTGView.USER_REGISTRATION_CTL%>">
                     <i class="fa fa-user-plus"></i> Register
                </a>
                <%} %> 
            
        </div>
    </div>
</nav>



</body>
</html>