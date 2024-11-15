<%@ Page Title="" Language="VB" MasterPageFile="~/Admin-Side/MasterPage.master" AutoEventWireup="false" CodeFile="student_logins.aspx.vb" Inherits="Admin_Side_student_logins" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Student Login Data</title>  
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">  
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="hold-transition sidebar-mini">
<div class="wrapper">  
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Student Login Data</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
              <li class="breadcrumb-item active">Student Login Data</li>
            </ol>
          </div>
        </div>
      </div>
    </section>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-6">
              <div class="card">              
              <div class="card-body">                
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="fmail" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="500px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                            <ItemStyle BorderColor="#000099" Font-Bold="True" Font-Italic="False" />
                            </asp:CommandField>
                          <asp:BoundField DataField="fname" HeaderText="Name" SortExpression="fname" >
                            <ControlStyle Width="40px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fmail" HeaderText="E-Mail" ReadOnly="True" SortExpression="fmail" />
                            <asp:BoundField DataField="fpwd" HeaderText="Password" SortExpression="fpwd" >                            
                            <ControlStyle Width="100px" />
                            </asp:BoundField>
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:data_studentConnectionString %>" DeleteCommand="DELETE FROM [admins_master] WHERE [fmail] = @fmail" InsertCommand="INSERT INTO [admins_master] ([fname], [fmail], [fpwd], [fcpwd]) VALUES (@fname, @fmail, @fpwd, @fcpwd)" SelectCommand="SELECT * FROM [admins_master]" UpdateCommand="UPDATE [admins_master] SET [fname] = @fname, [fpwd] = @fpwd, [fcpwd] = @fcpwd WHERE [fmail] = @fmail">
                            <DeleteParameters>
                                <asp:Parameter Name="fmail" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="fname" Type="String" />
                                <asp:Parameter Name="fmail" Type="String" />
                                <asp:Parameter Name="fpwd" Type="String" />                                
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="fname" Type="String" />
                                <asp:Parameter Name="fpwd" Type="String" />
                                <asp:Parameter Name="fcpwd" Type="String" />                                
                            </UpdateParameters>
                        </asp:SqlDataSource>                      
              </div>              
            </div>            
          </div>          
        </div>        
      </div>      
    </section>    
  </div>  
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.2.0-rc
    </div>
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>
  <aside class="control-sidebar control-sidebar-dark">
  </aside>
</div>
<script src="../../plugins/jquery/jquery.min.js"></script>
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../plugins/jszip/jszip.min.js"></script>
<script src="../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script src="../../dist/js/adminlte.min.js"></script>
<script src="../../dist/js/demo.js"></script>
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
</div>
</asp:Content>
