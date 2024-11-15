<%@ Page Title="" Language="VB" MasterPageFile="User-Side.master" AutoEventWireup="false" CodeFile="Course.aspx.vb" Inherits="Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Course.aspx specific CSS -->
    <link href="CSS/CourseStylest.css" rel="stylesheet" />
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- jQuery -->
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- DataTables & Plugins -->
    <script src="plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
    <script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
    <script src="plugins/jszip/jszip.min.js"></script>
    <script src="plugins/pdfmake/pdfmake.min.js"></script>
    <script src="plugins/pdfmake/vfs_fonts.js"></script>
    <script src="plugins/datatables-buttons/js/buttons.html5.min.js"></script>
    <script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
    <script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
    <script>
        $(document).ready(function () {
            toDataTable();
            $.ajax({
                type: "POST",
                contentType: "application/JSON",
                dataType: "json",
                data: '{}',
                url: "Course.aspx/getRole?" + (new URLSearchParams(window.location.search)),
                success: function (msg) {
                    if (msg.d == "Teacher") {
                        removeStudentOnly();
                    }
                    else {
                        removeTeacherOnly();
                    }
                },
                error: function () {
                    alert("Fail");
                }
            });
        });
    </script>
    <script>
        function toDataTable() {
            $("[id$=attntbl]").DataTable({
                "responsive": false, "lengthChange": false, "autoWidth": false,
                "buttons": ["excel", "pdf", "print"]
            }).buttons().container().appendTo('#' + $("[id$=attntbl]").attr("id") + '_wrapper .col-md-6:eq(0)');
        }
        function removeTeacherOnly() {
            var onlyTeacher = document.getElementsByClassName('teacher-only');
            for (let i = 0; i < onlyTeacher.length; i++) {
                onlyTeacher[i].style.display = 'none';
                onlyTeacher[i].innerHTML = '';
            }
        }
        function removeStudentOnly() {
            var onlyStudent = document.getElementsByClassName('student-only');
            for (let i = 0; i < onlyStudent.length; i++) {
                onlyStudent[i].style.display = 'none';
                onlyStudent[i].innerHTML = '';
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0"></h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="user_dash">Home</a></li>
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="card">
                <div class="card-header d-flex p-0">
                    <h3 class="card-title p-3">
                        <!-- Label that displays the name of current course -->
                        <asp:Label ID="Course_Name" runat="server"></asp:Label>
                    </h3>
                    <ul class="nav nav-pills ml-auto p-2">
                        <li class="nav-item">
                            <a class="nav-link active" href="#assignments" data-toggle="tab">
                                <i class=" nav-icon fas fa-book"></i>
                                Assignments
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#people" data-toggle="tab">
                                <i class="nav-icon fas fa-users"></i>
                                Users
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#materials" data-toggle="tab">
                                <i class="nav-icon fas fa-bookmark"></i>
                                Materials
                            </a>
                        </li>
                        <li class="nav-item teacher-only">
                            <a class="nav-link" href="#attendance_register" data-toggle="tab">
                                <i class="nav-icon fas fa-address-book"></i>
                                Attendance
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="tab-content">

                        <!-- Assignments -->
                        <div class="tab-pane active" id="assignments">
                            <div class="card-header teacher-only">
                                <a href="Assignment_creator.aspx" runat="server" class="btn btn-success">
                                    <i class="fa fa-plus"></i>
                                    Create Assignment
                                </a>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <asp:Repeater ID="assignrepeat" runat="server" DataSourceID="AssignmentsList">
                                            <ItemTemplate>
                                                <div class="col-md-6">
                                                    <div class="card">
                                                        <div class="card-header" style="background-color: #007bff;">
                                                            <asp:HiddenField runat="server" ID="assignID" Value='<%#Eval("assign_id") %>' />
                                                            <h3 class="card-title" style="color: white;">
                                                                <asp:Label runat="server" Text='<%#Eval("assign_name") %>'></asp:Label>
                                                            </h3>
                                                            <div class="teacher-only card-tools">
                                                                <asp:Button CommandName="DelAssign" CssClass="btn btn-danger" CommandArgument='<%#Eval("assign_id") %>' runat="server" Text="Delete" />
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label>Uploaded On : </label>
                                                                        <asp:Label ID="updtetbl" runat="server" Text='<%#CType(Eval("assign_up_date"), Date).ToString("dd-MM-yyyy")%>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12" style="min-height: 150px">
                                                                    <label>Description</label><br />
                                                                    <asp:Label ID="desc" runat="server" Text='<%#Eval("assign_desc") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <label>Attachment:</label>
                                                                    <asp:LinkButton ID="viewassign" CommandArgument='<%#Eval("assign_file") %>' href='<%# "../files/assignments/" & Eval("assign_file")%>' runat="server" CssClass="btn btn-success" Text="View" OnClientClick="target='_blank';" />
                                                                    <br />
                                                                </div>
                                                            </div>
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <div class="form-group">
                                                                        <label class="form-control">
                                                                            <label>Uploaded By</label>
                                                                            <asp:Label ID="profnme" runat="server" Text='<%#Eval("assign_prof") %>'></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 student-only">
                                                                    <asp:Label runat="server" ID="submit_status_lbl" CssClass="h5"></asp:Label>
                                                                </div>
                                                                <div class="col-sm-12 student-only">
                                                                    <div class="form-group">
                                                                        <div class="input-group">
                                                                            <asp:Button runat="server" CommandName="Uploadassign" CommandArgument='<%#Eval("assign_id")%>' CssClass="btn btn-success btn-lg" Text="Details" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 teacher-only">
                                                                    <div class="card">
                                                                        <div class="card-header">Submissions</div>
                                                                        <div class="card-body">
                                                                            <asp:Label ID="submissionsLbl" runat="server"></asp:Label>
                                                                            <asp:LinkButton CommandName="viewsubmissions" CommandArgument='<%#Eval("assign_id") %>' runat="server" ID="viewsubmissions" Text="View" CssClass="float-right"></asp:LinkButton>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="card-footer">
                                                                <footer>
                                                                    Due Date :
                                                            <asp:Label ID="duedtelbl" runat="server" Text='<%#CType(Eval("assign_due_date"), Date).ToString("dd-MM-yyyy") %>'></asp:Label>
                                                                </footer>
                                                            </div>
                                                        </div>
                                                        <!-- /.card-body -->
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <asp:SqlDataSource runat="server" ID="AssignmentsList" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="SELECT * FROM [assignment_master] WHERE ([cID] = @cID) ORDER BY assign_name">
                                        <SelectParameters>
                                            <asp:SessionParameter SessionField="cID" Name="cID" Type="Decimal"></asp:SessionParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                        <!-- Users -->
                        <div class="tab-pane" id="people">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <div class="card card-red card-columns">
                                        <div class="card-header">
                                            <h3 class="card-title">Teachers</h3>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <asp:Repeater ID="teach_lst" runat="server" DataSourceID="TeacherDataSource">
                                                    <ItemTemplate>
                                                        <div class="card card-primary card-outline col-md-4">
                                                            <div class="card-header">
                                                                <h5 class="card-title"><%#Eval("uName") %></h5>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:SqlDataSource runat="server" ID="TeacherDataSource" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="Select uName from course_enrolled where uRole='teacher' and cID in (Select id from course_master where clink = @link);">
                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="link" DbType="String" Name="link"></asp:QueryStringParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <div class="card card-blue card-columns">
                                        <div class="card-header">
                                            <h3 class="card-title">Students</h3>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <asp:Repeater ID="stud_lst" runat="server" DataSourceID="StudentDataSource">
                                                    <ItemTemplate>
                                                        <div class="card card-blue card-outline col-md-4">
                                                            <div class="card-header">
                                                                <h5 class="card-title"><%#Eval("uName") %></h5>
                                                                <h6 class="float-right teacher-only">
                                                                    <asp:Label runat="server" ID="attenlabel"></asp:Label>
                                                                </h6>
                                                                <!-- /.card-header -->
                                                            </div>
                                                            <!-- /.card-tools -->
                                                            <div class="card-body teacher-only">
                                                                <asp:Button ID="removeStudent" runat="server" class="btn btn-block btn-danger" Text="Remove" CommandName="Remove_User" CommandArgument='<%#Eval("id") %>'></asp:Button>
                                                            </div>
                                                            <!-- /.card-body -->
                                                        </div>
                                                        <!-- /.card -->
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                        <asp:SqlDataSource runat="server" ID="StudentDataSource" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="Select * from course_enrolled where uRole='Student' and cID in (Select id from course_master where clink = @link);" DeleteCommand="Delete from course_enrolled where id = @enrollid">
                                            <DeleteParameters>
                                                <asp:Parameter Name="enrollid"></asp:Parameter>
                                            </DeleteParameters>
                                            <SelectParameters>
                                                <asp:QueryStringParameter QueryStringField="link" DbType="String" Name="link"></asp:QueryStringParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                        <!-- Materials -->
                        <div class="tab-pane" id="materials">
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <div class="card card-red">
                                        <div class="card-header">Study Materials</div>
                                        <div class="card-body">
                                            <asp:Repeater ID="mat_lst" runat="server" DataSourceID="MaterialsDataSource">
                                                <ItemTemplate>
                                                    <div class="card">
                                                        <div class="card-title">
                                                            <h5 class="card-header">
                                                                <%#Eval("mname") %>
                                                            </h5>
                                                        </div>
                                                        <div class="card-body">
                                                            <asp:LinkButton runat="server" Text="View" CssClass="btn btn-success" CommandName="ViewMat" href='<%# "../files/materials" & Eval("mfile") %>' OnClientClick="document.forms[0].target='_blank';"></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                    <asp:SqlDataSource runat="server" ID="MaterialsDataSource" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="SELECT * FROM [material_master] WHERE ([cID] = @cID)">
                                        <SelectParameters>
                                            <asp:SessionParameter SessionField="cID" Name="cID" Type="Decimal"></asp:SessionParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                        <!-- Attendance -->
                        <div class="tab-pane teacher-only" id="attendance_register">

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="card-body">
                                        <div id="attendance-card" class="card">
                                            <div class="card-header">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Teacher Name:</label>
                                                            <asp:Label ID="teach_name" runat="server"></asp:Label>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="attndte">Date:</label>
                                                            <asp:TextBox CssClass="form-control" TextMode="date" ID="attndte" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Period:</label>
                                                            <asp:TextBox CssClass="form-control" ID="attenperiod" runat="server"></asp:TextBox>
                                                        </div>
                                                        <div class="form-group">
                                                            <asp:Button runat="server" ID="lockBtn" Text="Lock" CssClass="btn btn-success" />
                                                            <asp:LinkButton runat="server" ID="historybtn" PostBackUrl="~/Attendance_history.aspx" Text="Attendance History" CssClass="btn btn-success"></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <asp:GridView Enabled="false" ID="attntbl" runat="server" CssClass="table table-bordered table-striped dataTable dtr-inline" AutoGenerateColumns="False" DataKeyNames="enrollid" DataSourceID="AttendanceList">
                                                    <Columns>
                                                        <asp:BoundField DataField="Enroll" HeaderText="Enroll" SortExpression="Enroll"></asp:BoundField>
                                                        <asp:BoundField DataField="Name" ItemStyle-CssClass="stu-nme" HeaderStyle-CssClass="stu-nme" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                                                        <asp:TemplateField HeaderText="Status">
                                                            <ItemTemplate>
                                                                <asp:Button ID="Atten_Toggle" OnClick="Atten_Toggle_Click" runat="server" data-enrollid='<%#Eval("enrollid") %>' Text="Present" CssClass="attnbtn btn btn-success" />
                                                                <asp:Label runat="server" ID="statuslbl" class="hidden">Present</asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource runat="server" ID="AttendanceList" ConnectionString='<%$ ConnectionStrings:data_studentConnectionString %>' SelectCommand="Select s.stu_enroll Enroll,c.uName Name,c.id enrollid from course_enrolled c,student_master s where c.uRole = 'Student' and s.stu_mail = c.uMail and c.cID in (Select id from course_master where clink = @link)">
                                                    <SelectParameters>
                                                        <asp:QueryStringParameter QueryStringField="link" Name="link"></asp:QueryStringParameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:Button ID="commitbtn" Enabled="false" runat="server" Text="Save Attendance" CssClass="btn btn-success btn-lg disabled" />
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.card-body -->
            </div>
            <!-- ./card -->
        </section>
    </div>
</asp:Content>
