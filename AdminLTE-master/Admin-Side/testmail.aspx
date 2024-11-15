<%@ Page Title="" Language="VB" MasterPageFile="~/Admin-Side/MasterPage.master" AutoEventWireup="false" CodeFile="testmail.aspx.vb" Inherits="testmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Course Master</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    <style>
        .hidden{
          display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="hold-transition sidebar-mini">
        <div class="wrapper">
            <div class="content-wrapper">
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Send E-Mail</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">E-Mail Testing</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">E-Mail Details</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="inputName">Send To</label>
                                        <asp:TextBox ID="mailto" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Subject</label>
                                        <asp:TextBox ID="msub" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputDescription">Body</label>
                                        <asp:TextBox ID="mmsg" CssClass="form-control" runat="server" Rows="4" Columns="0" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                    <div class="row">
                                      <div class="col-md-1.7">
                                          <asp:Button CssClass="btn btn-success float-right" ID="snd" runat="server" Text="Send" />
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
        <script src="../plugins/jquery/jquery.min.js"></script>
        <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../dist/js/adminlte.min.js"></script>
        <script src="../dist/js/demo.js"></script>
        <script src="../dist/js/pages/alrt.js"></script>        
      </div>
</asp:Content>
