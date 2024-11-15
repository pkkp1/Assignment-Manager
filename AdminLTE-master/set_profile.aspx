<%@ Page Title="" Language="VB" MasterPageFile="~/User-Side.master" AutoEventWireup="false" CodeFile="set_profile.aspx.vb" Inherits="set_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Set your profile</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    <script src="plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript">    
        $(document).ready(function () {
            function fetch() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "set_profile.aspx/load_name",
                    data: "{}",
                    dataType: "json",
                    success: function (msg) {
                        $("#stu_name").attr('value', msg.d);
                    },
                    error: function () { alert("An Unexpected Error Occured"); }
                });
            }
            fetch();
            $("#stu_addr").focus();
            $("#btn_in").attr('disabled', 'disabled');
            var val_name = true;
            var val_addr = false;
            var val_fname = false;
            var val_mname = false;
            var cname = document.getElementById("stu_name");
            cname.addEventListener('blur', () => { validateStuname(); });
            function validateStuname() {
                let name = $("#stu_name").val();
                if (name.length == '') {
                    $("#stu_name").css("border-color", "red");
                    val_name = false;
                    $("#btn_in").attr('disabled', 'disabled');
                }
                else {
                    $("#stu_name").css("border-color", "#ced4da");
                    val_name = true;
                }
            }
            var caddr = document.getElementById("stu_addr");
            caddr.addEventListener('blur', () => { validateStuaddr(); });
            function validateStuaddr() {
                let name = $("#stu_addr").val();
                if (name.length == '') {
                    $("#stu_addr").css("border-color", "red");
                    val_addr = false;
                    $("#btn_in").attr('disabled', 'disabled');
                }
                else {
                    $("#stu_addr").css("border-color", "#ced4da");
                    val_addr = true;
                }
            }
            var cfname = document.getElementById("stu_f_name");
            cfname.addEventListener('blur', () => { validateStufname(); });
            function validateStufname() {
                let name = $("#stu_f_name").val();
                if (name.length == '') {
                    $("#stu_f_name").css("border-color", "red");
                    val_fname = false;
                    $("#btn_in").attr('disabled', 'disabled');
                }
                else {
                    $("#stu_f_name").css("border-color", "#ced4da");
                    val_fname = true;
                }
            }
            var cmname = document.getElementById("stu_m_name");
            cmname.addEventListener('blur', () => { validateStumname(); });
            function validateStumname() {
                let name = $("#stu_m_name").val();
                if (name.length == '') {
                    $("#stu_m_name").css("border-color", "red");
                    val_mname = false;
                    $("#btn_in").attr('disabled', 'disabled');
                }
                else {
                    $("#stu_m_name").css("border-color", "#ced4da");
                    val_mname = true;
                    if (val_name == true && val_addr == true && val_fname == true && val_mname == true) {
                        $("#btn_in").removeAttr('disabled', 'disabled');
                        $("#btn_in").focus();
                    }
                }
            }
            function validate_input() {
                if (val_name == true && val_addr == true && val_fname == true && val_mname == true) {
                    return true;
                }
                else {
                    return false;
                }
            }
            $("#btn_in").click(function () {
                var validator = validate_input();
                if (validator == true) {
                    var stu_name = document.getElementById("stu_name").value;
                    var stu_addr = document.getElementById("stu_addr").value;
                    var stu_f_name = document.getElementById("stu_f_name").value;
                    var stu_m_name = document.getElementById("stu_m_name").value;
                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        url: "set_profile.aspx/SaveProfile",
                        data: "{'stu_name':'" + stu_name + "','stu_addr':'" + stu_addr + "','stu_f_name':'" + stu_f_name + "','stu_m_name':'" + stu_m_name + "'}",
                        dataType: "json",
                        success: function () {
                            alert("Updated Succcessfully.");
                            fill_records();
                        },
                        error: function () { alert("An Unexpected Error Occured"); }
                    });
                }
                else {

                }
            });
            function fill_records() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "set_profile.aspx/load_addr",
                    data: "{}",
                    dataType: "json",
                    success: function (msg) {
                        $("#stu_addr").attr('value', msg.d);
                    },
                    error: function () { alert("An Unexpected Error Occured"); }
                });
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "set_profile.aspx/load_fname",
                    data: "{}",
                    dataType: "json",
                    success: function (msg) {
                        $("#stu_f_name").attr('value', msg.d);
                    },
                    error: function () { alert("An Unexpected Error Occured"); }
                });
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "set_profile.aspx/load_mname",
                    data: "{}",
                    dataType: "json",
                    success: function (msg) {
                        $("#stu_m_name").attr('value', msg.d);
                    },
                    error: function () { alert("An Unexpected Error Occured"); }
                });
            }
        });
    </script>
    <style>
        .hidden {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="hold-transition sidebar-mini">
        <div class="wrapper">
            <div class="content-wrapper">
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Profile Details</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">Setup Your Profile</li>
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
                                    <h3 class="card-title">General</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="inputName">Name</label>
                                        <input type="text" id="stu_name" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputDescription">Address</label>
                                        <textarea id="stu_addr" class="form-control" rows="4"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Father's Name</label>
                                        <input type="text" id="stu_f_name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputName">Mother's Name</label>
                                        <input type="text" id="stu_m_name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <input type="submit" value="Update" id="btn_in" class="btn btn-success float-left">
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
        <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    </div>
</asp:Content>
