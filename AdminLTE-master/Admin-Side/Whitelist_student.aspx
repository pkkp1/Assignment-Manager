<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="Whitelist_student.aspx.vb" Inherits="Admin_Side_Whitelist_student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
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
            </div>
        </section>
        <section class="content">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Whitelist Student</h3>
                                </div>
                                <div class="card-body">
                                    <div class="form-group col-md-6">
                                        <label>Student E-mail</label>
                                        <asp:TextBox ID="sMail" runat="server"></asp:TextBox>
                                        <asp:Button CssClass="btn btn-success float-right" ID="addBtn" Text="Add Student" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <label>Students whitelisted: </label>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="stu_mail" DataSourceID="Students_whitelist" CssClass="table table-bordered table-striped dataTable dtr-inline">
                                            <Columns>
                                                <asp:BoundField DataField="stu_mail" HeaderText="stu_mail" ReadOnly="True" SortExpression="stu_mail"></asp:BoundField>                                                
                                                <asp:TemplateField HeaderText="Remove">
                                                    <ItemTemplate>
                                                        <asp:Button CssClass="btn btn-danger" runat="server" ID="removestud" Text="Remove Student" CommandName="Delstudent" CommandArgument='<%#Eval("stu_mail") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>                                            
                                        </asp:GridView>
                                        <asp:SqlDataSource runat="server" ID="Students_whitelist" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="SELECT [stu_mail] FROM [student_master]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </section>
    </div>
</asp:Content>
