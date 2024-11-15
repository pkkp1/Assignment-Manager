<%@ Page Title="" Language="VB" MasterPageFile="~/Admin-Side/MasterPage.master" AutoEventWireup="false" CodeFile="course_master.aspx.vb" Inherits="Admin_Side_course_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Course Master</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <link rel="shortcut icon" href="#" />
    <script src="../plugins/jquery/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="hold-transition sidebar-mini">
                <div class="wrapper">
                    <div class="content-wrapper">
                        <section class="content-header">
                            <div class="container-fluid">
                                <div class="row mb-2">
                                    <div class="col-sm-6">
                                        <h1>Add Course</h1>
                                    </div>
                                    <div class="col-sm-6">
                                        <ol class="breadcrumb float-sm-right">
                                            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                                            <li class="breadcrumb-item active">Course Master</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <asp:Label runat="server"></asp:Label>
                        <section class="content">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-primary">
                                        <div class="card-header">
                                            <h3 class="card-title">Course Details</h3>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="inputName">Course Name</label>
                                                <asp:TextBox ID="cname" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputName">Course Code</label>
                                                <asp:TextBox ID="ccode" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputDescription">Course Description</label>
                                                <asp:TextBox ID="cdesc" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputStatus">Semester</label>
                                                <asp:DropDownList ID="csem" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="0">Select Semester</asp:ListItem>
                                                    <asp:ListItem Value="1">1</asp:ListItem>
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>
                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                    <asp:ListItem Value="6">6</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-1.7">
                                                    <asp:Button ID="addbtn" runat="server" Text="Add Course" CssClass="btn btn-success float-right" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-body card-body table-responsive p-0">
                                            <asp:GridView ID="Courses_grid" CssClass="table table-bordered table-striped text-nowrap" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="Course_datasource">
                                                <Columns>
                                                    <asp:BoundField DataField="cname" HeaderText="Name" SortExpression="cname"></asp:BoundField>
                                                    <asp:BoundField DataField="ccode" HeaderText="Subject Code" SortExpression="ccode"></asp:BoundField>
                                                    <asp:BoundField DataField="cdesc" HeaderText="Description" SortExpression="cdesc"></asp:BoundField>
                                                    <asp:BoundField DataField="csem" HeaderText="Sem" SortExpression="csem"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Action">
                                                        <ItemTemplate>
                                                            <asp:Button CommandName="delcourse" CommandArgument='<%#Eval("id") %>' runat="server" Text="Delete" CssClass="btn btn-danger" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource runat="server" ID="Course_datasource" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="SELECT * FROM [course_master]" DeleteCommand="DELETE FROM [course_master] WHERE [id] = @id" InsertCommand="INSERT INTO [course_master] ([cname], [ccode], [cdesc], [csem], [clink]) VALUES (@cname, @ccode, @cdesc, @csem, @clink)" UpdateCommand="UPDATE [course_master] SET [cname] = @cname, [ccode] = @ccode, [cdesc] = @cdesc, [csem] = @csem, [clink] = @clink WHERE [id] = @id">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="id" Type="Decimal"></asp:Parameter>
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="cname" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="ccode" Type="Decimal"></asp:Parameter>
                                                    <asp:Parameter Name="cdesc" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="csem" Type="Decimal"></asp:Parameter>
                                                    <asp:Parameter Name="clink" Type="String"></asp:Parameter>
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="cname" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="ccode" Type="Decimal"></asp:Parameter>
                                                    <asp:Parameter Name="cdesc" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="csem" Type="Decimal"></asp:Parameter>
                                                    <asp:Parameter Name="clink" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="id" Type="Decimal"></asp:Parameter>
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card card-primary">
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="inputStatus">Generate Course Link</label>

                                                <asp:DropDownList ID="links" CssClass="form-control csem" runat="server" AutoPostBack="true">
                                                    <asp:ListItem Selected="True">Select Course</asp:ListItem>
                                                </asp:DropDownList><br />

                                                <div class="input-group">
                                                    <div class="input-group-append">
                                                        <asp:Button runat="server" ID="course_link" class="btn btn-success" Text="Generate"></asp:Button>
                                                    </div>
                                                    <asp:TextBox ReadOnly="true" CssClass="form-control" ID="txt_link" runat="server"></asp:TextBox>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <strong>All Teachers</strong>
                                                        <asp:GridView ID="all_teachers" runat="server" CssClass="table table-bordered table-striped dataTable dtr-inline" AutoGenerateColumns="False" DataKeyNames="teach_mail" DataSourceID="all_teachers_source">
                                                            <Columns>
                                                                <asp:BoundField DataField="teach_mail" HeaderText="Mail ID" ReadOnly="True" SortExpression="teach_mail"></asp:BoundField>
                                                                <asp:BoundField DataField="teach_name" HeaderText="Name" SortExpression="teach_name"></asp:BoundField>
                                                                <asp:TemplateField HeaderText="Action">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="add_teacher" OnClick="add_teacher_Click" runat="server" Text="Add to Course" CssClass="btn btn-success" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource runat="server" ID="all_teachers_source" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="SELECT * FROM [teacher_master]"></asp:SqlDataSource>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <strong>Teachers in course</strong>
                                                        <asp:GridView ID="Teachers_in_course" runat="server" CssClass="table table-bordered table-striped dataTable dtr-inline" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="Teachers_in_course_datasource">
                                                            <Columns>
                                                                <asp:BoundField DataField="uMail" HeaderText="Mail ID" SortExpression="uMail"></asp:BoundField>
                                                                <asp:BoundField DataField="uName" HeaderText="Name" SortExpression="uName"></asp:BoundField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource runat="server" ID="Teachers_in_course_datasource" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="SELECT * FROM [course_enrolled] WHERE (([uRole] = 'Teacher') AND ([cID] = @cID))">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="links" PropertyName="SelectedValue" Name="cID" Type="Decimal"></asp:ControlParameter>
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                    <aside class="control-sidebar control-sidebar-dark">
                    </aside>
                </div>
                <script src="plugins/jquery/jquery.min.js"></script>
                <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="dist/js/pages/alrt.js"></script>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
