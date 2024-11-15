<%@ Page Language="VB" AutoEventWireup="false" CodeFile="forgot_pass.aspx.vb" Inherits="forgot_pass" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">    
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Forgot Password</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />  
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css" />
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
  <link rel="stylesheet" href="dist/css/adminlte.min.css" />
</head>
<body class="hold-transition login-page">
<form runat="server" id="frm">
    <div class="login-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="#" class="h1">Enter Your E-Mail</a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">You forgot your password? Here you can easily retrieve a new password.</p>      
        <div class="input-group mb-3">          
          <asp:TextBox ID="fmail" cssclass="form-control" placeholder="Email" runat="server"/>
          <div class="input-group-append">        
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <asp:button id="for_pass_btn" cssclass="btn btn-primary btn-block" runat="server" Text="Request new password"/>
          </div>
        </div>
      <p class="mt-3 mb-1">
        <a href="login.aspx">Login</a>
      </p>
    </div>    
  </div>
</div>
  </form>
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="dist/js/adminlte.min.js"></script>
</body>
</html>
