<%@ Page Title="" Language="VB" MasterPageFile="User-Side.master" AutoEventWireup="false" CodeFile="user_dash.aspx.vb" Inherits="user_dash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- jQuery -->
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <div class="content-header">
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
        </div>
        <section class="content">
            <div class="container-fluid">
                <%--Student courses and assignments--%>
                <asp:Repeater ID="courseslst_student" runat="server" DataSourceID="enrolledcourses_student">
                    <ItemTemplate>
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" ID="stud_csTitl" Text='<%#Eval("cname") %>'></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="stud_csID" Text='<%#Eval("id") %>' CssClass="hidden"></asp:Label>
                                <strong>
                                    <asp:Label ID="assigncount" runat="server"></asp:Label>
                                </strong>
                                <br />
                                <asp:Label ID="Attendancelbl" runat="server"></asp:Label>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <%--List of assignments due for this week--%>
                                        <asp:Repeater ID="duelst" runat="server" DataSourceID="assign_due_lst">
                                            <ItemTemplate>
                                                <div class="card card-yellow">
                                                    <div class="card-header">
                                                        <h3 class="card-title">Your work is due</h3>
                                                        <div class="card-tools">
                                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                                <i class="fas fa-minus"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label>Assignment</label>
                                                                    <asp:Label runat="server" ID="assign_name" Text='<%#Eval("assign_name") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label>Uploaded On : </label>
                                                                    <asp:Label runat="server" ID="upload_date" Text='<%#CType(Eval("assign_up_date"), Date).ToString("dd-MM-yyyy") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label>Uploaded By : </label>
                                                                    <asp:Label runat="server" ID="Label1" Text='<%#Eval("assign_prof") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-footer">
                                                            <footer>
                                                                Due Date :
                                                                    <asp:Label runat="server" ID="due_date" Text='<%#CType(Eval("assign_due_date"), Date).ToString("dd-MM-yyyy") %>'></asp:Label>
                                                            </footer>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="assign_due_lst" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="Select assign.assign_name,assign.assign_up_date,assign.assign_due_date,assign.assign_prof from assignment_master assign, assignment_submit sub where assign.assign_id = sub.assign_id and assign.cID = @cID and assign.assign_due_date between @today and @seven and sub.sub_file is NULL and sub.stu_id = (Select id from course_enrolled where cID = @cID and uMail = @mail)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="stud_csID" PropertyName="Text" Name="cID"></asp:ControlParameter>
                                                <asp:SessionParameter SessionField="user_mail" Name="mail"></asp:SessionParameter>
                                                <asp:SessionParameter SessionField="Today_date" Name="today"></asp:SessionParameter>
                                                <asp:SessionParameter SessionField="Seven_date" Name="seven"></asp:SessionParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <div class="col-md-6">
                                        <%--List of assignments missing--%>
                                        <asp:Repeater ID="missing_lst" runat="server" DataSourceID="assign_missing_list">
                                            <ItemTemplate>
                                                <div class="card card-red">
                                                    <div class="card-header">
                                                        <h3 class="card-title">Your work is Missing</h3>
                                                        <div class="card-tools">
                                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                                <i class="fas fa-minus"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label>Assignment</label>
                                                                    <asp:Label runat="server" ID="assign_name" Text='<%#Eval("assign_name") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label>Uploaded On : </label>
                                                                    <asp:Label runat="server" ID="upload_date" Text='<%#CType(Eval("assign_up_date"), Date).ToString("dd-MM-yyyy") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label>Uploaded By : </label>
                                                                    <asp:Label runat="server" ID="Label1" Text='<%#Eval("assign_prof") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-footer">
                                                            <footer>
                                                                Due Date :
                                                                    <asp:Label runat="server" ID="due_date" Text='<%#CType(Eval("assign_due_date"), Date).ToString("dd-MM-yyyy") %>'></asp:Label>
                                                            </footer>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="assign_missing_list" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="Select distinct assign.assign_name,assign.assign_up_date,assign.assign_due_date,assign.assign_prof from assignment_master assign, assignment_submit sub where assign.assign_id = sub.assign_id and assign.cID = @cID and assign.assign_due_date < @today and sub.sub_file is NULL and sub.stu_id = (Select id from course_enrolled where cID = @cID and uMail = @mail)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="stud_csID" PropertyName="Text" Name="cID"></asp:ControlParameter>
                                                <asp:SessionParameter SessionField="user_mail" Name="mail"></asp:SessionParameter>
                                                <asp:SessionParameter SessionField="Today_date" Name="today"></asp:SessionParameter>
                                                <asp:SessionParameter SessionField="Seven_date" Name="seven"></asp:SessionParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="enrolledcourses_student" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="Select distinct c.cname,c.id from course_master c,course_enrolled en where en.uMail=@mail and en.cID = c.id and en.uRole = 'Student'">
                    <SelectParameters>
                        <asp:SessionParameter SessionField="user_mail" Name="mail"></asp:SessionParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <%--Teacher courses and assignments--%>
                <asp:Repeater ID="courseslst_teacher" runat="server" DataSourceID="enrolledcourses_teacher">
                    <ItemTemplate>
                        <div class="card">
                            <div class="card-header">
                                <asp:Label runat="server" ID="teach_csTitl" Text='<%#Eval("cname") %>'></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="teach_csID" Text='<%#Eval("id") %>' CssClass="hidden"></asp:Label>
                                <strong>
                                    <asp:Label ID="teach_assigncount" runat="server"></asp:Label>
                                </strong>
                                <asp:Label runat="server" ID="teachheading">Assignments uploaded by you</asp:Label>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <%--List of assignments uploaded--%>
                                        <asp:Repeater ID="teach_assignlst" runat="server" DataSourceID="assign_up_list">
                                            <ItemTemplate>
                                                <div class="card card-yellow">
                                                    <div class="card-header">
                                                        <h3 class="card-title">
                                                            <label>Assignment</label>
                                                            <asp:Label runat="server" ID="assign_name" Text='<%#Eval("assign_name") %>'></asp:Label>
                                                        </h3>
                                                        <div class="card-tools">
                                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                                <i class="fas fa-minus"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label>Uploaded On : </label>
                                                                    <asp:Label runat="server" ID="upload_date" Text='<%#CType(Eval("assign_up_date"), Date).ToString("dd-MM-yyyy") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-12">
                                                                <div class="form-group">
                                                                    <div class="card">
                                                                        <div class="card-header">Submissions</div>
                                                                        <div class="card-body">
                                                                            <asp:Label OnDataBinding="submissionslbl_Load" data-assignID='<%#Eval("assign_ID") %>' ID="submissionslbl" runat="server"></asp:Label>
                                                                            <asp:LinkButton OnClick="viewsubmissions_Click" data-assignID='<%#Eval("assign_ID") %>' runat="server" ID="viewsubmissions" Text="View" CssClass="float-right"></asp:LinkButton>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="card-footer">
                                                                <footer>
                                                                    Due Date :
                                                                <asp:Label runat="server" ID="due_date" Text='<%#CType(Eval("assign_due_date"), Date).ToString("dd-MM-yyyy") %>'></asp:Label>
                                                                </footer>
                                                            </div>
                                                        </div>
                                                    </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="assign_up_list" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="Select assign.assign_id,assign.assign_name,assign.assign_up_date,assign.assign_due_date from assignment_master assign, course_enrolled cs where assign.cID = cs.cID and assign.cID = @cID and cs.uMail = @mail and cs.uRole = 'Teacher';">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="teach_csID" PropertyName="Text" Name="cID"></asp:ControlParameter>
                                                <asp:SessionParameter SessionField="user_mail" Name="mail"></asp:SessionParameter>
                                                <asp:SessionParameter SessionField="Today_date" Name="today"></asp:SessionParameter>
                                                <asp:SessionParameter SessionField="Seven_date" Name="seven"></asp:SessionParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="enrolledcourses_teacher" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="Select distinct c.cname,c.id from course_master c,course_enrolled en where en.uMail=@mail and en.cID = c.id and en.uRole = 'Teacher'">
                    <SelectParameters>
                        <asp:SessionParameter SessionField="user_mail" Name="mail"></asp:SessionParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </section>
    </div>
</asp:Content>
