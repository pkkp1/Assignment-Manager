<%@ Page Title="" Language="VB" MasterPageFile="~/User-Side.master" AutoEventWireup="false" CodeFile="Assign_Submit.aspx.vb" Inherits="AssignUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../dist/css/adminlte.min.css">
    <link rel="shortcut icon" href="#" />
    <script src="plugins/jquery/jquery.min.js"></script>
    <script src="plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
    <script src="Ajax-Scripts/AjaxFileUploader.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            checkSubmission();
            function checkSubmission() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "Assign_Submit.aspx/assignSubmited",
                    data: "{}",
                    dataType: "json",
                    success: function (Msg) {
                        if (Msg.d[0] == undefined) {
                            $("#Uploadbtn").text("Submit");
                            $("#updfile").removeAttr('disabled');
                            $("#updfile").removeClass('disabled');
                        }
                        else {
                            $("#Uploadbtn").text("Unsubmit");
                            $("#updfile").attr('disabled', 'disabled');
                            $("#updfile").addClass('disabled');
                        }
                    }
                });
            }

            $(function () {
                bsCustomFileInput.init();
            });

            $("#Uploadbtn").click(function () {
                checkSubmission();
                if ($("#Uploadbtn").text() == "Submit") {
                    submit_assignment();
                }
                else if ($("#Uploadbtn").text() == "Unsubmit") {
                    unsubmit_assignment();
                }
            });

            function submit_assignment() {
                var fileuploader = document.getElementById("updfile");
                var fname = uploadFile(
                    fileuploader,
                    '~/files/Submitted_assignments/');
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "Assign_Submit.aspx/submitassign",
                    data: "{'filenme':'" + fname + "'}",
                    dataType: "json",
                    success: function () {
                        fileuploader.value = '';
                        $("#filelabel").text("Choose file");
                        $("#Uploadbtn").text("Unsubmit");
                        $("#updfile").attr('disabled', 'disabled');
                        $("#updfile").addClass('disabled');
                    },
                    faliure: function () { alert("Faliure") },
                    error: function (request, err) { alert(err); }
                });
            }

            function unsubmit_assignment() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "Assign_Submit.aspx/unsubmitassign",
                    data: "{}",
                    dataType: "json",
                    success: function () {
                        $("#Uploadbtn").text("Submit");
                        $("#updfile").removeAttr('disabled');
                        $("#updfile").removeClass('disabled');
                    },
                    faliure: function () { alert("Faliure") },
                    error: function (request, err) { alert(err); }
                });
            }
        });
    </script>
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
            <div class="card">
                <div class="card-header" style="background-color: #007bff;">
                    <h3 class="card-title" style="color: white;">
                        <asp:Label runat="server" ID="assign_name"></asp:Label>
                    </h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Uploaded On : </label>
                                <asp:Label ID="uploaddte" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="min-height: 150px">
                            <label>Description:</label><br />
                            <asp:Label ID="desc" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Attachment:</label><br />
                            <asp:LinkButton ID="ViewFile" runat="server" Text="View" CssClass="btn btn-success"></asp:LinkButton>
                            <br />
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Upload Your Work</label>
                                <label class="h6" style="color:#dc3545">NOTE: Please ensure that file name does not contain dot(.) character</label>
                                <div class="custom-file">
                                    <input type="file" disabled="disabled" class="custom-file-input" id="updfile">
                                    <label id="filelabel" class="custom-file-label" for="updfile">Choose file</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="input-group">
                                    <a id="Uploadbtn" class="btn btn-success btn-lg float-right">Submit</a>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label class="form-control">
                                    <label>Uploaded By</label>
                                    <asp:Label ID="profnme" runat="server"></asp:Label>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <footer>
                            Due Date :
                            <asp:Label ID="Duedate" runat="server"></asp:Label>
                        </footer>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
        </section>
    </div>
</asp:Content>
