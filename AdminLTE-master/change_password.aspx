<%@ Page Title="" Language="VB" MasterPageFile="User-Side.master" AutoEventWireup="false" CodeFile="change_password.aspx.vb" Inherits="change_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="hold-transition sidebar-mini">
<div class="wrapper">
  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Change Password</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Change Password</li>
            </ol>
          </div>
        </div>
      </div>
    </section>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-9">
            <div class="card card-info">
              <div class="form-horizontal">
                <div class="card-body">
                  <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Current Password</label>
                    <div class="col-sm-10">
                      <asp:TextBox ID="stu_pass" TextMode="Password" runat="server" cssClass="form-control" placeholder="Enter Current Password"></asp:TextBox>
                      <asp:label id="cp" runat="server" ForeColor="red"></asp:label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">New Password</label>
                    <div class="col-sm-10">
                      <asp:TextBox ID="npwd" TextMode="Password" runat="server" cssClass="form-control" placeholder="Enter New Password"></asp:TextBox>
                      <asp:Label id="np" runat="server" ForeColor="red"></asp:Label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">New Password</label>
                    <div class="col-sm-10">
                      <asp:TextBox ID="ncpwd" TextMode="Password" runat="server" cssClass="form-control" placeholder="Enter New Password Again"></asp:TextBox>
                      <asp:Label runat="server" id="cnp" ForeColor="red"></asp:Label>
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <asp:button Text="Change Password" cssClass="btn btn-info" ID="chng" runat="server"></asp:button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>
</div>
</asp:Content>