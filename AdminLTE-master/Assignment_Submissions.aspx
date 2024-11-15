<%@ Page Title="" Language="VB" MasterPageFile="~/User-Side.master" AutoEventWireup="false" CodeFile="Assignment_Submissions.aspx.vb" Inherits="Assignment_Submissions" %>

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
            <div class="card">
                <div class="card-header">
                    File Submissions
                </div>
                <div class="card-body">
                    <asp:GridView ID="all_Submission" runat="server" AutoGenerateColumns="False" DataSourceID="all_submissions_datasource" CssClass="table table-bordered table-striped dataTable dtr-inline">
                        <Columns>
                            <asp:BoundField DataField="uName" HeaderText="Student Name" SortExpression="uName"></asp:BoundField>
                            <asp:BoundField DataField="sub_dte" HeaderText="Submitted on" SortExpression="sub_dte" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="statuslbl" runat="server" data-due-date='<%#Eval("assign_due_date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Submissions">
                                <ItemTemplate>
                                    <asp:Button CommandName="Submitted_File" CommandArgument='<%#Eval("sub_file")%>' runat="server" CssClass="btn btn-success" Text="View" OnClientClick="target='_blank';" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="all_submissions_datasource" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="SELECT course.uName, sub.sub_file,assign.assign_due_date, sub.sub_dte FROM assignment_submit sub,course_enrolled course,assignment_master assign WHERE sub.assign_id = @assign_id and course.uRole = 'Student' and course.id = sub.stu_id and sub.assign_id = assign.assign_id">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="selectedID" Name="assign_id"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
