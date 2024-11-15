Imports System.Data.SqlClient
Partial Class Admin_Side_course_master
    Inherits System.Web.UI.Page

    Private Sub Admin_Side_course_master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim d As New DAOClass
            Dim c As New SqlConnection("Data Source=103.212.121.67;Initial Catalog=Data_student;Persist Security Info=True;User ID=data_student;Password=Student@4050")
            Dim ds As New Data.DataSet
            Dim da As New SqlDataAdapter("select id,cname from course_master", c)
            c.Open()
            da.SelectCommand.ExecuteReader()
            c.Close()
            da.Fill(ds)
            links.DataSource = ds.Tables(0)
            links.DataValueField = "id"
            links.DataTextField = "cname"
            links.DataBind()
            Dim item As New ListItem
            item.Text = "Select an Item"
            item.Value = 0
            links.Items.Add(item)
            links.SelectedIndex = links.Items.Count - 1
            Courses_grid.HeaderRow.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Protected Sub course_link_Click(sender As Object, e As EventArgs) Handles course_link.Click
        Dim c As New SqlConnection("Data Source=103.212.121.67;Initial Catalog=Data_student;Persist Security Info=True;User ID=data_student;Password=Student@4050")
        Dim cmd As New SqlCommand("select clink from course_master where id=" & links.SelectedValue, c)
        Dim ds As SqlDataReader
        c.Open()
        ds = cmd.ExecuteReader()
        While ds.Read
            txt_link.Text = "http://localhost:57924/login.aspx?link=" & ds.Item(0)
        End While
        c.Close()
    End Sub

    Protected Sub add_teacher_Click(sender As Object, e As EventArgs)
        Dim d As New DAOClass
        Dim p(2), v(2) As String
        Dim rowID As Integer = CType(CType(sender, Control).Parent.Parent, GridViewRow).RowIndex
        Dim mailID As String = all_teachers.Rows(rowID).Cells(0).Text
        Dim name As String = all_teachers.Rows(rowID).Cells(1).Text
        Dim ds As New Data.DataSet
        p = {"@cID", "@mail"}
        v = {links.SelectedValue, mailID}
        ds = d.getdata(p, v, "Select * from course_enrolled where cID=@cID and uMail=@mail")
        If ds.Tables(0).Rows.Count = 0 Then
            ReDim p(3), v(3)
            p = {"@cID", "@mail", "@name"}
            v = {links.SelectedValue, mailID, name}
            d.add(p, v, "Insert into course_enrolled values(@cID,@mail,@name,'Teacher');")
            Teachers_in_course_datasource.DataBind()
            Teachers_in_course.DataBind()
            all_teachers_source.DataBind()
            all_teachers.DataBind()
        End If
    End Sub

    Private Sub addbtn_Click(sender As Object, e As EventArgs) Handles addbtn.Click
        If cname.Text <> "" Then
            If cdesc.Text <> "" Then
                If ccode.Text <> "" Then
                    If csem.SelectedValue <> "0" Then
                        Dim d As New DAOClass
                        Dim v(5), p(5) As String
                        p = {"@name", "@code", "@desc", "@sem", "@link"}
                        v = {cname.Text, ccode.Text, cdesc.Text, csem.SelectedValue, d.gen_link()}
                        d.add(p, v, "Insert into course_master values(@name,@code,@desc,@sem,@link)")
                        Course_datasource.DataBind()
                        Courses_grid.DataBind()
                        cname.Text = ""
                        cdesc.Text = ""
                        ccode.Text = ""
                        csem.SelectedIndex = 0
                    End If
                End If
            End If
        End If
    End Sub

    Private Sub Courses_grid_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles Courses_grid.RowCommand
        If e.CommandName = "delcourse" Then
            Course_datasource.DeleteParameters("id").DefaultValue = e.CommandArgument.ToString
            Course_datasource.Delete()
            Course_datasource.DataBind()
            Dim d As New DAOClass
            d.delete({"@course"}, {e.CommandArgument}, "Delete from course_enrolled where cID = @course")
        End If
    End Sub
End Class