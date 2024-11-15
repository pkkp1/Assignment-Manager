<%@ Page Language="VB" AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="Admin_Side_student_register" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registration Page</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body class="hold-transition register-page">
    <div class="register-box">
        <form runat="server">
            <div class="card card-outline card-primary">
                <div class="card-header text-center" style="padding-bottom: 0px;">
                    <a href="#" class="h1">Tolani Foundation</a>
                </div>
                <div class="card-body" style="margin-top: 0px">
                    <p class="login-box-msg">Register as Student</p>
                    <div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="stu_name" CssClass="form-control" runat="server" placeholder="Full name"></asp:TextBox>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                            <asp:RequiredFieldValidator Display="None" ControlToValidate="stu_name" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Student Name"></asp:RequiredFieldValidator>
                        </div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="stu_mail" placeholder="Email" CssClass="form-control" runat="server"></asp:TextBox>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                            <asp:RequiredFieldValidator Display="None" ControlToValidate="stu_mail" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Student E-Mail"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display="None" ControlToValidate="stu_mail" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid E-Mail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="stu_enroll" placeholder="Enrollment Number" CssClass="form-control" runat="server"></asp:TextBox>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-id-card"></span>
                                </div>
                            </div>
                            <asp:RequiredFieldValidator Display="None" ControlToValidate="stu_enroll" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Student Enrollment Number"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display="None" ControlToValidate="stu_enroll" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Valid Enrollment Number" ValidationExpression="[0-9]{12}"></asp:RegularExpressionValidator>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="reg" runat="server" CssClass="btn btn-primary btn-block" Text="Register"></asp:Button>
                            </div>
                        </div>
                    </div>
                    <a href="login.aspx" class="text-center">Already have an account ? Login</a>
                    <asp:ValidationSummary ID="ValidationSummary1" ForeColor="red" runat="server" /><br />
                    <asp:Label runat="server" ForeColor="Red" ID="msgLbl"></asp:Label>
                </div>
            </div>
        </form>
    </div>
    <!-- /.register-box -->

    <!-- jQuery -->
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../../dist/js/adminlte.min.js"></script>
</body>
</html>
