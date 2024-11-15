Imports System.Data.SqlClient
Partial Class Admin_Side_material_master
    Inherits System.Web.UI.Page

    Private Sub m_add_Click(sender As Object, e As EventArgs) Handles m_add.Click
        If mname.Text <> "" Then
            If mdesc.Text <> "" Then
                If msem.SelectedItem.Text <> "Select Semester" Then
                    If mfile.HasFile Then
                        Dim fname As String = mname.Text.Replace(" ", "_") & "_"
                        Dim extension As String = "." & mfile.PostedFile.FileName.Split(".")(1)
                        Dim file_name As String = fname & extension
                        SqlDataSource1.InsertParameters("mname").DefaultValue = mname.Text
                        SqlDataSource1.InsertParameters("cID").DefaultValue = CType(mCourses.SelectedValue, Int32)
                        SqlDataSource1.InsertParameters("mdesc").DefaultValue = mdesc.Text
                        SqlDataSource1.InsertParameters("msem").DefaultValue = msem.SelectedItem.Text
                        SqlDataSource1.InsertParameters("mfile").DefaultValue = file_name
                        mfile.PostedFile.SaveAs(Server.MapPath("~\files\materials\" & file_name))
                        SqlDataSource1.Insert()
                        SqlDataSource1.DataBind()
                        clear_m()
                    Else
                        js(Me.GetType(), "Select Semester")
                    End If
                Else
                    js(Me.GetType(), "Enter Semester")
                End If
            Else
                js(Me.GetType(), "Enter Description")
            End If
        Else
            js(Me.GetType(), "Enter Name")
        End If
    End Sub
    Public Sub clear_m()
        mname.Text = ""
        mdesc.Text = ""
        msem.ClearSelection()
    End Sub
    Public Sub js(ByVal t As Type, ByVal s As String)
        Dim script As String = "window.onload = function() { alr('" & s & "'); };"
        ClientScript.RegisterStartupScript(t, "alr", script, True)
        If s = "Enter Name" Then
            mname.Focus()
        ElseIf s = "Enter Description" Then
            mdesc.Focus()
        ElseIf s = "Enter Semester" Then
            msem.Focus()
        ElseIf s = "Enter File" Then
            mfile.Focus()
        End If
    End Sub
    Private Sub Admin_Side_material_master_Load(sender As Object, e As EventArgs) Handles Me.Load
        mname.Focus()
        If Not Page.IsPostBack Then
            Dim d As New DAOClass
            Dim c As New SqlConnection("Data Source=103.212.121.67;Initial Catalog=Data_student;Persist Security Info=True;User ID=data_student;Password=Student@4050")
            Dim ds As New Data.DataSet
            Dim da As New SqlDataAdapter("select id,cname from course_master", c)
            c.Open()
            da.SelectCommand.ExecuteReader()
            c.Close()
            da.Fill(ds)
            mCourses.DataSource = ds.Tables(0)
            mCourses.DataValueField = "id"
            mCourses.DataTextField = "cname"
            mCourses.DataBind()
        End If
    End Sub
End Class
