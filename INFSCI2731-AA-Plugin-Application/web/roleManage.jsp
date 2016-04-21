<%-- 
    Document   : RBACtest3
    Created on : April 19, 2016, 7:38:49 PM
    Author     : Hanwei Cheng
--%>



<%@page import="model.UserAccountInfo"%>
<%@page import="java.util.List"%>
<%@ page import="controller.RBAC" %> 
<%@ page import="dataAccessObject.RBACDao" %> 

<%
    //check whether the role ID of the user has priviledge for current page
    if (request.getSession().getAttribute("user") != null) {
        UserAccountInfo user = (UserAccountInfo) session.getAttribute("user");
        RBACDao accessControl = new RBACDao();
        List<Integer> UserPool = accessControl.getRolebyPath("roleManage.jsp");
        if (!UserPool.contains(user.getAccess_role_id())) {
            response.sendRedirect("index.jsp");
        }
    } else {
        response.sendRedirect("login.jsp");
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>test3</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

    </head>
    <body>

        <!-- Fixed navbar -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">IS2731</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="hostilelist.jsp">Hostile</a></li>
                        <li class="active"><a href="roleManage.jsp">Role Management</a></li>
                        <li><a href="admin.jsp">Admin Page</a></li>
                        <li><a href="RBACtest.jsp">RBAC Test</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <!--put the name on the navigation bar-->
                        <br>
                        <%                            if (request.getSession().getAttribute("user") != null) {
                                UserAccountInfo user = (UserAccountInfo) session.getAttribute("user");
                                out.print("<a href='#'>" + user.getFirstName() + user.getLastName() + "</a>");
                                out.print("&nbsp;&nbsp;|&nbsp;&nbsp;");
                                out.print("<a href='LogOut'>Log Out</a>");
                            }
                        %>

                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>


        <!-- Begin page content -->
        <div class="container" style="margin-top:100px;margin-bottom:250px;">

            <div class="page-header">
                <h1>Role Management</h1>
            </div>

            <!--management area-->
            <div class="ManagementArea" style="margin-top:30px">

                <form class="form-inline" action="RoleManageServlet" method="post">
                    <div class="form-group">
                        <label for="userID">UserID</label>
                        <input name="userID" type="text" class="form-control"  placeholder="1" value="1">
                    </div>

                    <select name="roleChoice" class="form-control">
                        <option value="1">User</option>
                        <option value ="2">Administrator</option>
                        <option value ="3">Super Administrator</option>
                    </select>

                    <button type="submit" class="btn btn-default">Change</button>
                </form>
                <div class="message">
                    <%--bug!!!!!!!!!!!!!
                    if((request.getAttribute("isSuccess"))!= null & (Boolean)request.getAttribute("isSuccess") == true ){
                          out.print("Change role successfully!");
                    }
                    --%>
                    <%
                        String StatusSymbol = "";
                        if ((request.getAttribute("isSuccess")) != null & (Boolean) request.getAttribute("isSuccess") == true) {
                            StatusSymbol = "we change the role successful";
                        }
//                        else
//                        {
//                            
//                        }
                    %>
                    <%=StatusSymbol %>  
                   
                </div>
            </div><!--management area-->


        </div><!--container-->

        <footer class="footer">
            <div class="container">
                <p class="text-muted">&copy; 2016 E-Commerce Security &middot; <a href="#">Privacy</a>
                    &middot; <a href="#">Terms</a></p>
            </div>
        </footer>


        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous">
        </script>

    </body>
</html>
