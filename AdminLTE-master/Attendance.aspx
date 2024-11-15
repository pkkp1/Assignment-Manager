<%@ Page Title="" Language="VB" MasterPageFile="User-Side.master" AutoEventWireup="false" CodeFile="Attendance.aspx.vb" Inherits="Attendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- Theme style -->
    <%--<link rel="stylesheet" href="../Admin-Side/dist/css/adminlte.min.css">--%>

    <style>
        .dte-footer {
            background-color: white !important;
        }

            .dte-footer > .border-hide {
                border: 0;
            }
    </style>
    <%--<script type="text/javascript">
        $(document).ready((function () {
            $("#attntbl").DataTable({
                "responsive": true, "lengthChange": false, "autoWidth": false,
                "buttons": ["copy", "csv", "excel", "pdf", "print"]
            }).buttons().container().appendTo('#attntbl"_wrapper .col-md-6:eq(0)');

            $.ajax({
                type: "POST",
                url: "Attendance.aspx/GetStudents",
                data: '{}',
                contentType: "application/json: charset=utf-8",
                dataType: "json",
                success: AttendanceSheet
            });

            function AttendanceSheet(response) {
                var xml = $($.parseXML(response.d));
                var data = xml.find("course_enrolled");

                //Make a clone of the template row we made
                var row = $("[id*=attntbl] tbody > tr:last-child").clone(true);

                //Remove the template row
                $("[id*=attntbl] tr").not(':has(th)').remove();

                $.each(data, function () {

                    //Fill data in the row clone
                    $(".sEnroll", row).html($(this).find("Enroll").text());
                    $(".sName", row).html($(this).find("Name").text());
                    $(".sStatus", row).html($(this).find("Name").text());

                    //Append filled row to table
                    $("[id*=attntbl]").append(row);

                    //Make a clone of the last row
                    var row = $("[id*=attntbl] tbody > tr:last-child").clone(true);

                });
            }
        }));
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="hold-transition sidebar-mini">
        <div class="wrapper">
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>DataTables</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">DataTables</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table id="attntbl" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Enrollemnt No.</th>
                                                    <th>Name</th>
                                                    <th>Present/Absent</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1
                                                    </td>
                                                    <td>1
                                                    </td>
                                                    <td>1
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>1
                                                    </td>
                                                    <td>1
                                                    </td>
                                                    <td>1
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>1
                                                    </td>
                                                    <td>1
                                                    </td>
                                                    <td>1
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
    </div>
    <!-- jQuery -->
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- DataTables  & Plugins -->
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
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.min.js"></script>

    <script>
        $(function () {
            $("#attntbl").DataTable({
                "responsive": true, "lengthChange": false, "autoWidth": false,
                "buttons": ["copy", "csv", "excel", "pdf", "print"]
            }).buttons().container().appendTo('#attntbl_wrapper .col-md-6:eq(0)');
        });
    </script>
</asp:Content>
