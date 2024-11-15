<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="Admin_Side_student_login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Log in</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
    <asp:Label ID="lbl" runat="server"></asp:Label>
    <div class="login-box">
        <!-- /.login-logo -->
        <div class="card card-outline card-primary">
            <div class="card-header">
                <p class="h1 text-center">Tolani Commerce College</p>
            </div>
            <div class="card-body">
                <form runat="server" id="form1">
                    <p class="login-box-msg">Sign in to start your session</p>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="user_mail" CssClass="form-control" placeholder="Email" runat="server"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope" runat="server" id="spn"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="user_pass" TextMode="Password" CssClass="form-control" ViewStateMode="Disabled" placeholder="Password" runat="server"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <asp:Label ID="Label1" runat="server" Text="" ForeColor="red" />
                    <div class="row">
                        <div class="col-4">
                            <asp:Button Text="Sign In" runat="server" ID="lgn_btn" CssClass="btn btn-primary btn-block" />
                        </div>
                    </div>
                    <p class="mb-1">
                        <a href="forgot_pass.aspx">I forgot my password</a>
                    </p>
                    <p class="mb-0">
                        <a href="register.aspx" class="text-center">Register a new membership</a>
                    </p>
                </form>
            </div>
        </div>
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../../dist/js/adminlte.min.js"></script>
</body>
</html>
