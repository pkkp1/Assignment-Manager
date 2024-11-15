<%@ Page Title="" Language="VB" MasterPageFile="~/Admin-Side/MasterPage.master" AutoEventWireup="false" CodeFile="material_master.aspx.vb" Inherits="Admin_Side_material_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Course Master</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../dist/css/adminlte.min.css">
    <script src="../plugins/jquery/jquery.min.js"></script>
    <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../dist/js/adminlte.min.js"></script>
    <script src="../dist/js/pages/alrt.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="hold-transition sidebar-mini">
        <div class="wrapper">
            <div class="content-wrapper">
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Add Material</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Material Master</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Material Details</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="inputName">Course Name</label>
                                        <asp:DropDownList ID="mCourses" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Material Name</label>
                                        <asp:TextBox ID="mname" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputDescription">Material Description</label>
                                        <asp:TextBox ID="mdesc" CssClass="form-control" runat="server" Rows="4" Columns="0" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputStatus">Semester</label>
                                        <asp:DropDownList ID="msem" CssClass="form-control" runat="server">
                                            <asp:ListItem Selected="False">Select Semester</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputClientCompany">Material File</label>
                                        <asp:FileUpload CssClass="form-control-file" accept="application/pdf,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" ID="mfile" runat="server" />
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1.7">
                                            <asp:Button CssClass="btn btn-success float-right" ID="m_add" runat="server" Text="Upload Material" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card card-primary">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                                        <asp:BoundField DataField="cID" HeaderText="cID" SortExpression="cID"></asp:BoundField>
                                        <asp:BoundField DataField="mname" HeaderText="mname" SortExpression="mname"></asp:BoundField>

                                        <asp:BoundField DataField="mdesc" HeaderText="mdesc" SortExpression="mdesc" />
                                        <asp:BoundField DataField="msem" HeaderText="msem" SortExpression="msem" />
                                        <asp:BoundField DataField="mfile" HeaderText="mfile" SortExpression="mfile" />
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:data_studentConnectionString %>" SelectCommand="SELECT * FROM [material_master] WHERE ([cID] = @cID)" DeleteCommand="DELETE FROM [material_master] WHERE [id] = @id" InsertCommand="INSERT INTO [material_master] ([cID], [mname], [mdesc], [msem], [mfile]) VALUES (@cID, @mname, @mdesc, @msem, @mfile)" UpdateCommand="UPDATE [material_master] SET [cID] = @cID, [mname] = @mname, [mdesc] = @mdesc, [msem] = @msem, [mfile] = @mfile WHERE [id] = @id">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id" Type="Decimal"></asp:Parameter>
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="cID" Type="Decimal"></asp:Parameter>
                                        <asp:Parameter Name="mname" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="mdesc" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="msem" Type="Decimal"></asp:Parameter>
                                        <asp:Parameter Name="mfile" Type="String"></asp:Parameter>
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="mCourses" PropertyName="SelectedValue" Name="cID" Type="Decimal"></asp:ControlParameter>
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="cID" Type="Decimal"></asp:Parameter>
                                        <asp:Parameter Name="mname" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="mdesc" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="msem" Type="Decimal"></asp:Parameter>
                                        <asp:Parameter Name="mfile" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="id" Type="Decimal"></asp:Parameter>
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <aside class="control-sidebar control-sidebar-dark">
            </aside>
        </div>
    </div>
</asp:Content>
