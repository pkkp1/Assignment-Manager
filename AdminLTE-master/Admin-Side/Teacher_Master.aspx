<%@ Page Title="" Language="VB" MasterPageFile="~/Admin-Side/MasterPage.master" AutoEventWireup="false" CodeFile="Teacher_Master.aspx.vb" Inherits="Admin_Side_Teacher_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="content-header">
            <section class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0"></h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                    </div>
                </div>
            </section>
            <section class="content">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div>
                                            <div class="input-group mb-3">
                                                <asp:TextBox ID="teach_name" CssClass="form-control" runat="server" placeholder="Full name"></asp:TextBox>
                                                <div class="input-group-append">
                                                    <div class="input-group-text">
                                                        <span class="fas fa-user"></span>
                                                    </div>
                                                </div>
                                                <asp:RequiredFieldValidator Display="None" ControlToValidate="teach_name" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Student Name"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="input-group mb-3">
                                                <asp:TextBox ID="teach_mail" placeholder="Email" CssClass="form-control" runat="server"></asp:TextBox>
                                                <div class="input-group-append">
                                                    <div class="input-group-text">
                                                        <span class="fas fa-envelope"></span>
                                                    </div>
                                                </div>
                                                <asp:RequiredFieldValidator Display="None" ControlToValidate="teach_mail" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Student E-Mail"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator Display="None" ControlToValidate="teach_mail" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid E-Mail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                                            </div>
                                            <div class="row">
                                                <div class="col-4">
                                                    <asp:Button ID="add_new_teacher" runat="server" CssClass="btn btn-success btn-block" Text="Add Teacher"></asp:Button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <strong>All Teachers</strong>
                                        <asp:GridView ID="all_teachers" runat="server" CssClass="table table-bordered table-striped dataTable dtr-inline" AutoGenerateColumns="False" DataKeyNames="teach_mail" DataSourceID="all_teachers_source">
                                            <Columns>
                                                <asp:BoundField DataField="teach_mail" HeaderText="Mail ID" ReadOnly="True" SortExpression="teach_mail"></asp:BoundField>
                                                <asp:BoundField DataField="teach_name" HeaderText="Name" SortExpression="teach_name"></asp:BoundField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource runat="server" ID="all_teachers_source" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="SELECT * FROM [teacher_master]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </section>
        </div>
    </div>
</asp:Content>

