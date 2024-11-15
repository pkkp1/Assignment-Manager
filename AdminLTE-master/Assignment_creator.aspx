<%@ Page Title="" Language="VB" MasterPageFile="~/User-Side.master" AutoEventWireup="false" CodeFile="Assignment_creator.aspx.vb" Inherits="Admin_Side_Assignment_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Assignment Master</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../dist/css/adminlte.min.css">
    <script src="../plugins/jquery/jquery.min.js"></script>
    <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
    <script src="../dist/js/adminlte.min.js"></script>
    <script src="../dist/js/pages/alrt.js"></script>
    <script src="Ajax-Scripts/AjaxFileUploader.js"></script>
    <script>
        $(document).ready(function () {

            setMinDate();
            getProfessors();

            
            $(function () {
                bsCustomFileInput.init();
            });

            $("#Uploadbtn").click(function () {
                var fileuploader = document.getElementById("ass_file");
                var fname = "";
                if (fileuploader.files.length > 0) {
                    fname = uploadFile(fileuploader,'~/files/assignments/');
                }
                var prof = $("#profnme").children("option:selected").val();
                var title = $("#ass_titl").val();
                var duedate = $("#assign_duedte").val();
                var descrip = $("#ass_desc").val();
                var dateIsInValid = (new Date(duedate).setHours(0,0,0,0) <= new Date(new Date()).setHours(0,0,0,0))
                if (!dateIsInValid) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        url: "Assignment_creator.aspx/createassign",
                        data:
                            "{'profnme':'" + prof + "','title':'" + title +
                            "','duedate':'" + duedate + "','descrip':'" + descrip +
                            "','filenme':'" + fname + "'}",
                        dataType: "json",
                        faliure: function () { alert("Faliure") },
                        error: function (request, err) { alert(err); }
                    });
                }
                else {
                    alert("Error: Minimum date exceeded");
                }
                getProfessors();
            });

            function getProfessors() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "Assignment_creator.aspx/getProfs",
                    data: "{}",
                    dataType: "json",
                    success: function (response) {
                        var xml = $($.parseXML(response.d));
                        var data = xml.find("profNames");
                        $.each(data, function () {
                            var option = "<option value='" + $(this).find("uName").text() + "'>" +
                                $(this).find("uName").text() + "</option>";
                            $("#profnme").append(option);
                        });
                    },
                    faliure: function () { alert("Faliure") },
                    error: function (request, err) { alert(err); }
                });
            }

            function setMinDate() {
                var dte = new Date();
                var dd = dte.getDate() + 1;
                dd = (dd < 10 ? '0' + dd : dd);
                var mm = dte.getMonth() + 1;
                mm = (mm < 10 ? '0' + mm : mm);
                var yy = dte.getFullYear();
                $("#assign_duedte").attr('min', yy + '-' + mm + '-' + dd);
            }
        });
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
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Assignment Master</h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="inputName">Professor Name</label>
                                <select id="profnme" class="form-control">
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="inputName">Assignment Title</label><br />
                                <input id="ass_titl" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>Due Date:</label>
                                <input type="date" id="assign_duedte" />
                            </div>
                            <div class="form-group">
                                <label for="ass_desc">Assignment Description</label>
                                <textarea id="ass_desc" class="form-control"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="ass_file">Assignment File(Optional)</label>
                                <label class="h6" style="color:#dc3545">NOTE: Please ensure that file name does not contain dot(.) character</label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="ass_file">
                                    <label id="filelabel" class="custom-file-label" for="ass_file">Choose file</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-1.7">
                                    <input type="reset" class="btn btn-success float-right" id="Uploadbtn" value="Upload Assignment" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
