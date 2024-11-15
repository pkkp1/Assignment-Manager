<%@ Page Language="VB" AutoEventWireup="false" CodeFile="reg_for_ad.aspx.vb" Inherits="student_registration" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Registration Form For Students</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css" />
    <link rel="stylesheet" href="../plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <link rel="stylesheet" href="../dist/css/adminlte.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="hold-transition register-page">
                <div class="register-box">
                    <div class="card card-outline card-primary">
                        <div class="card-header text-center" style="padding-bottom: 0px;">
                            <a href="../../index2.html" class="h1">Tolani Commerce College</a>
                        </div>
                        <div class="card-body" style="margin-top: 0px">
                            <p class="login-box-msg">Register as Student</p>
                            <div>
                                <div class="input-group mb-3">
                                    <asp:TextBox ID="fname" CssClass="form-control" runat="server" placeholder="Full name"></asp:TextBox>
                                    <asp:RequiredFieldValidator display="none" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Valid Name" ControlToValidate="fname" ForeColor="red"></asp:RequiredFieldValidator>
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-user"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="input-group mb-3">
                                  <asp:TextBox ID="fmail" placeholder="Email" CssClass="form-control" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator display="none" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="fmail" ForeColor="red"></asp:RequiredFieldValidator>
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Email." Display="None" ControlToValidate="fmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                                  <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-envelope"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="input-group mb-3">
                                    <asp:TextBox ID="fpwd" TextMode="Password" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator display="none" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="fpwd" ForeColor="red"></asp:RequiredFieldValidator>
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-lock"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="input-group mb-3">
                                    <asp:TextBox ID="fcpwd" TextMode="Password" CssClass="form-control" runat="server" placeholder="Retype password"></asp:TextBox>
                                    <asp:RequiredFieldValidator display="none" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Valid Confirmed Password." ControlToValidate="fcpwd" ForeColor="red"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator Display="None" ID="CompareValidator1" runat="server" ErrorMessage="Password should be same." ControlToCompare="fpwd" ControlToValidate="fcpwd" Type="String"></asp:CompareValidator>
                                    <div class="input-group-append">
                                        <div class="input-group-text">
                                            <span class="fas fa-lock"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <asp:Button ID="reg" runat="server" CssClass="btn btn-primary btn-block" Text="Register"></asp:Button>
                                    </div>                                    
                                </div>
                              <div class="row">
                                <div class="col-12">
                                      <asp:ValidationSummary ID="ValidationSummary1" runat="server" forecolor="red"/>
                                    </div>
                              </div>
                            </div>
                            <a href="login.aspx" class="text-center">Already have an account ? Login</a>
                        </div>
                    </div>
                </div>
                <script src="../plugins/jquery/jquery.min.js"></script>
                <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="../dist/js/adminlte.min.js"></script>
            </div>
        </div>
    </form>
</body>
</html>
