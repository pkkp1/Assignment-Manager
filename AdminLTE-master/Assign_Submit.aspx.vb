Imports System.Web.Services
Partial Class AssignUpload
    Inherits System.Web.UI.Page

    <WebMethod()>
    Public Shared Sub submitassign(ByVal filenme As String)
        If assignSubmited() = "" Then
            Dim assignid = HttpContext.Current.Session("assignID")
            Dim student = HttpContext.Current.Session("stuID")
            Dim d As New DAOClass
            Dim p(4), v(4) As String
            p = {"@file", "@date", "@sID", "@assignID"}
            v = {filenme, Now.ToString("yyyy-MM-dd"), student, assignid}
            d.update(p, v, "Update assignment_submit set sub_file = @file, sub_dte = @date where stu_id = @sID and assign_id = @assignID")
        End If
    End Sub

    <WebMethod()>
    Public Shared Sub unsubmitassign()
        If assignSubmited() <> "" Then
            Dim assignid = HttpContext.Current.Session("assignID")
            Dim student = HttpContext.Current.Session("stuID")
            Dim d As New DAOClass
            Dim p(2), v(2) As String
            p = {"@sID", "@assignID"}
            v = {student, assignid}
            Dim ds As Data.DataSet = d.getdata(p, v, "Select sub_file from assignment_submit where stu_id = @sID and assign_id = @assignID")
            Dim filename As String = ds.Tables(0).Rows(0).Item(0).ToString
            Dim path As String = HttpContext.Current.Server.MapPath("~/files/submitted_assignments/" & filename)
            If IO.File.Exists(path) Then
                IO.File.Delete(path)
            End If
            d.update(p, v, "Update assignment_submit set sub_dte = NULL, sub_file = NULL where stu_id = @sID and assign_id = @assignID")
            assignSubmited()
        End If
    End Sub

    <WebMethod()>
    Public Shared Function assignSubmited() As String
        Dim present As String = ""
        Dim assignid = HttpContext.Current.Session("assignID")
        Dim student = HttpContext.Current.Session("stuID")
        Dim d As New DAOClass
        Dim ds As New Data.DataSet
        ds = d.getdata({"@aID", "@stuID"}, {assignid, student}, "Select * from assignment_submit where assign_id = @aID and stu_id=@stuID and sub_file is not NULL")
        If ds.Tables(0).Rows.Count <> 0 Then
            present = "submitted"
        End If
        Return present
    End Function

    Private Sub AssignUpload_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim id = Session("assignID")
            Dim d As New DAOClass
            Dim ds As New Data.DataSet
            ds = d.getdata1("Select * from assignment_master where assign_id = " & id)
            Dim row As Data.DataRow = ds.Tables(0).Rows(0)
            assign_name.Text = row.Item(2)
            desc.Text = row.Item(3)
            uploaddte.Text = CType(row.Item(4), Date).ToString("dd/MM/yyyy")
            Duedate.Text = CType(row.Item(5), Date).ToString("dd/MM/yyyy")
            profnme.Text = row.Item(6)
            If row.Item(7).ToString = "" Then
                ViewFile.CssClass = "btn btn-default disabled"
                ViewFile.Text = "No Attachment"
                ViewFile.Enabled = False
            Else
                ViewFile.Attributes.Add("href", "../files/assignments/" & row.Item(7).ToString)
                ViewFile.OnClientClick = "target='_blank';"
            End If
        End If
    End Sub

End Class
