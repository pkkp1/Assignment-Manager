<%@ Page Title="" Language="VB" MasterPageFile="~/User-Side.master" AutoEventWireup="false" CodeFile="Attendance_history.aspx.vb" Inherits="Attendance_history" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
        function toDataTable() {
            $("[id$=attntbl]").DataTable({
                "responsive": false, "lengthChange": false, "autoWidth": false,
                "buttons": ["excel", "pdf", "print"]
            }).buttons().container().appendTo('#' + $("[id$=attntbl]").attr("id") + '_wrapper .col-md-6:eq(0)');
        }
    </script>
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <section class="content">
                    <div class="card-body">
                        <div id="attendance-card" class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="attndte">Date:</label>
                                            <asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="dateList" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label>Period:</label>
                                            <asp:DropDownList CssClass="form-control" ID="periodList" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <asp:Button runat="server" ID="viewBtn" Text="View" CssClass="btn btn-success" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <asp:GridView ID="attntbl" runat="server" CssClass="table table-bordered table-striped dataTable dtr-inline" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="Enroll" HeaderText="Enroll" SortExpression="Enroll"></asp:BoundField>
                                        <asp:BoundField DataField="Name" ItemStyle-CssClass="stu-nme" HeaderStyle-CssClass="stu-nme" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="presentlbl" Text='<%#IIf(Eval("a_status") = 0, "Absent", "Present") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </section>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
