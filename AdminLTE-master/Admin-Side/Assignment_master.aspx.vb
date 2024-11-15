Imports System.Data.SqlClient
Partial Class Admin_Side_Assignment_master
    Inherits System.Web.UI.Page

    Private Sub m_add_Click(sender As Object, e As EventArgs) Handles ass_upload.Click
        If ass_titl.Text <> "" Then
            If ass_desc.Text <> "" Then
                If ass_file.HasFile Then
                    Dim fname As String = ass_titl.Text.Replace(" ", "_")
                    Dim extension As String = "." & ass_file.PostedFile.FileName.Split(".")(1)
                    Dim file_name As String = fname & extension
                    Dim duedate As Date = assign_duedte.Text
                    AssignmentsSource.InsertParameters("assign_name").DefaultValue = ass_titl.Text
                    AssignmentsSource.InsertParameters("cID").DefaultValue = CType(assCourses.SelectedValue, Int32)
                    AssignmentsSource.InsertParameters("assign_desc").DefaultValue = ass_desc.Text.Replace(vbCrLf, "<br>")
                    AssignmentsSource.InsertParameters("assign_due_date").DefaultValue = duedate.ToString("yyyy-MM-dd")
                    AssignmentsSource.InsertParameters("assign_up_date").DefaultValue = Today.ToString("yyyy-MM-dd")
                    AssignmentsSource.InsertParameters("assign_file").DefaultValue = file_name
                    ass_file.PostedFile.SaveAs(Server.MapPath("~\files\materials\" & file_name))
                    AssignmentsSource.Insert()
                    AssignmentsSource.DataBind()
                    clear_m()
                Else
                    js(Me.GetType(), "Select Semester")
                End If
            Else
                js(Me.GetType(), "Enter Description")
            End If
        Else
            js(Me.GetType(), "Enter Name")
        End If
    End Sub

    Public Sub clear_m()
        ass_titl.Text = ""
        ass_desc.Text = ""
    End Sub
    Public Sub js(ByVal t As Type, ByVal s As String)
        Dim script As String = "window.onload = function() { alr('" & s & "'); };"
        ClientScript.RegisterStartupScript(t, "alr", script, True)
        If s = "Enter Name" Then
            ass_titl.Focus()
        ElseIf s = "Enter Description" Then
            ass_desc.Focus()
        ElseIf s = "Enter File" Then
            ass_file.Focus()
        End If
    End Sub
    Private Sub Admin_Side_material_master_Load(sender As Object, e As EventArgs) Handles Me.Load
        ass_titl.Focus()
        assign_duedte.Attributes("min") = Now.ToString("yyyy-MM-dd")
        If Not Page.IsPostBack Then
            Dim d As New DAOClass
            Dim c As New SqlConnection("Data Source=103.212.121.67;Initial Catalog=Data_student;Persist Security Info=True;User ID=data_student;Password=Student@4050")
            Dim ds As New Data.DataSet
            ds = d.getdata1("select id,cname from course_master")
            assCourses.DataSource = ds.Tables(0)
            assCourses.DataValueField = "id"
            assCourses.DataTextField = "cname"
            assCourses.DataBind()
            Dim ds1 As New Data.DataSet
            ds1 = d.getdata({"@id"}, {assCourses.SelectedValue}, "Select uName from course_enrolled where cID = @id and uRole='Teacher'")
            profnme.DataSource = ds1.Tables(0)
            profnme.DataValueField = "uName"
            profnme.DataBind()
        End If
    End Sub

    Private Sub assCourses_SelectedIndexChanged(sender As Object, e As EventArgs) Handles assCourses.SelectedIndexChanged
        profnme.Items.Clear()
        Dim d As New DAOClass
        Dim ds As New Data.DataSet
        ds = d.getdata({"@id"}, {assCourses.SelectedValue}, "Select uName from course_enrolled where cID = @id and uRole='Teacher'")
        profnme.DataSource = ds.Tables(0)
        profnme.DataValueField = "uName"
        profnme.DataTextField = "uName"
        profnme.DataBind()
    End Sub
End Class
