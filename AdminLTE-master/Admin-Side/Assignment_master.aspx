<%@ Page Title="" Language="VB" MasterPageFile="~/Admin-Side/MasterPage.master" AutoEventWireup="false" CodeFile="Assignment_master.aspx.vb" Inherits="Admin_Side_Assignment_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Assignment Master</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../dist/css/adminlte.min.css">
    <script src="../plugins/jquery/jquery.min.js"></script>
    <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../dist/js/adminlte.min.js"></script>
    <script src="../dist/js/pages/alrt.js"></script>
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
            <div class="row">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="col-md-12">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Assignment Master</h3>
                        </div>
                        <div class="card-body">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="form-group">
                                        <label for="inputName">Course Name</label>
                                        <asp:DropDownList ID="assCourses" AutoPostBack="true" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Professor Name</label>
                                        <asp:DropDownList ID="profnme" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="form-group">
                                <label for="inputName">Assignment Title</label>
                                <asp:TextBox ID="ass_titl" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Due Date:</label>
                                <asp:TextBox TextMode="date" ID="assign_duedte" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="inputDescription">Assignment Description</label>
                                <asp:TextBox ID="ass_desc" CssClass="form-control" runat="server" Rows="4" Columns="0" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="inputClientCompany">Assignment File</label>
                                <asp:FileUpload CssClass="form-control-file" accept="application/pdf,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" ID="ass_file" runat="server" />
                            </div>
                            <div class="row">
                                <div class="col-md-1.7">
                                    <asp:Button CssClass="btn btn-success float-right" ID="ass_upload" runat="server" Text="Upload Material" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped dataTable dtr-inline" runat="server" AutoGenerateColumns="False" DataKeyNames="assign_id" DataSourceID="AssignmentsSource">
                                        <Columns>
                                            <asp:BoundField DataField="assign_id" HeaderText="assign_id" ReadOnly="True" InsertVisible="False" SortExpression="assign_id"></asp:BoundField>
                                            <asp:BoundField DataField="cID" HeaderText="cID" SortExpression="cID"></asp:BoundField>
                                            <asp:BoundField DataField="assign_name" HeaderText="assign_name" SortExpression="assign_name"></asp:BoundField>
                                            <asp:BoundField DataField="assign_desc" HeaderText="assign_desc" SortExpression="assign_desc"></asp:BoundField>
                                            <asp:BoundField DataField="assign_up_date" HeaderText="assign_up_date" SortExpression="assign_up_date"></asp:BoundField>
                                            <asp:BoundField DataField="assign_due_date" HeaderText="assign_due_date" SortExpression="assign_due_date"></asp:BoundField>
                                            <asp:BoundField DataField="assign_prof" HeaderText="assign_prof" SortExpression="assign_prof"></asp:BoundField>
                                            <asp:BoundField DataField="assign_file" HeaderText="assign_file" SortExpression="assign_file"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource runat="server" ID="AssignmentsSource" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' DeleteCommand="DELETE FROM [assignment_master] WHERE [assign_id] = @assign_id" InsertCommand="INSERT INTO [assignment_master] ([cID], [assign_name], [assign_desc], [assign_up_date], [assign_due_date], [assign_prof], [assign_file]) VALUES (@cID, @assign_name, @assign_desc, @assign_up_date, @assign_due_date, @assign_prof, @assign_file)" SelectCommand="SELECT * FROM [assignment_master]" UpdateCommand="UPDATE [assignment_master] SET [cID] = @cID, [assign_name] = @assign_name, [assign_desc] = @assign_desc, [assign_up_date] = @assign_up_date, [assign_due_date] = @assign_due_date, [assign_prof] = @assign_prof, [assign_file] = @assign_file WHERE [assign_id] = @assign_id">
                                        <DeleteParameters>
                                            <asp:Parameter Name="assign_id" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="cID" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="assign_name" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="assign_desc" Type="String"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="assign_up_date"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="assign_due_date"></asp:Parameter>
                                            <asp:Parameter Name="assign_prof" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="assign_file" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="cID" Type="Decimal"></asp:Parameter>
                                            <asp:Parameter Name="assign_name" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="assign_desc" Type="String"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="assign_up_date"></asp:Parameter>
                                            <asp:Parameter DbType="Date" Name="assign_due_date"></asp:Parameter>
                                            <asp:Parameter Name="assign_prof" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="assign_file" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="assign_id" Type="Int32"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
