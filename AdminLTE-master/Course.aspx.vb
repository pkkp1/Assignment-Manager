Imports System.Data.SqlClient
Imports System.Web.Services
Imports System.Drawing.ColorTranslator
Partial Class Course
    Inherits System.Web.UI.Page

    Private Sub Course_Load(sender As Object, e As EventArgs) Handles Me.Load
        attndte.Attributes("max") = Now.ToString("yyyy-MM-dd")
        If Not Page.IsPostBack Then
            Dim d As New DAOClass
            Dim ds As Data.DataSet = d.getdata({"@link"}, {Request.QueryString("link")}, "Select id,cname from course_master where clink = @link")
            Dim courseID As Integer = ds.Tables(0).Rows(0).Item(0)
            Session.Add("cID", courseID)
            Session.Add("cname", ds.Tables(0).Rows(0).Item(1))
            ds = d.getdata({"@mail", "@courseID"}, {Session("user_mail"), courseID}, "Select uRole from course_enrolled where uMail = @mail and cID = @courseID")
            Session.Add("UserRole", ds.Tables(0).Rows(0).Item(0))
            teach_name.Text = Session("user_name")
        End If
        Course_Name.Text = Session("cname")
        Page.Title = Session("cname")
        Try
            attntbl.HeaderRow.TableSection = TableRowSection.TableHeader
        Catch ex As Exception

        End Try
        If Session("UserRole") <> "Teacher" Then
            ScriptManager.RegisterClientScriptBlock(
                CType(sender, Control),
                Me.GetType(),
                "removeTeacherOnly",
                "removeTeacherOnly();",
                True
            )
        Else

            ScriptManager.RegisterClientScriptBlock(
                CType(sender, Control),
                Me.GetType(),
                "removeStudentOnly",
                "removeStudentOnly();",
                True
            )
        End If
    End Sub

    Private Sub stud_lst_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles stud_lst.ItemCommand
        If Session("UserRole") = "Teacher" Then
            Dim id As String = e.CommandArgument()
            If e.CommandName = "Remove_User" Then
                StudentDataSource.DeleteParameters("enrollid").DefaultValue = id
                StudentDataSource.Delete()
            End If
            StudentDataSource.DataBind()
            stud_lst.DataBind()
        End If
    End Sub

    <WebMethod()>
    Public Shared Function getRole() As String
        Dim role As String = HttpContext.Current.Session("UserRole")
        Return role
    End Function

    Public Sub toDataTable(sender As Object)
        ScriptManager.RegisterClientScriptBlock(
            CType(sender, Control),
            Me.GetType(),
            "toDataTable",
            "toDataTable();",
            True
        )
    End Sub

    Protected Sub Atten_Toggle_Click(sender As Object, e As EventArgs)
        Dim row As GridViewRow = CType(
        CType(sender, Control).Parent.Parent,
        GridViewRow)
        Dim lbl As Label = row.FindControl("statuslbl")
        Dim btn As Button = CType(sender, Button)
        Dim enrollid As String = btn.Attributes("data-enrollid").ToString()
        Dim dte As Date = attndte.Text
        Dim d As New DAOClass
        Dim p(5), v(5) As String
        Dim register As Data.DataSet = Session("AttendanceRegister")
        For Each datarow As Data.DataRow In register.Tables(0).Rows
            If datarow("enrolled_id") = enrollid And datarow("a_date") = dte.ToString("yyyy-MM-dd") Then
                datarow("a_status") = IIf(btn.Text = "Present", 0, 1)
            End If
        Next
        Session("AttendanceRegister") = register
        If btn.Text = "Present" Then
            'If Present
            btn.Text = "Absent"
            lbl.Text = "Absent"
            btn.CssClass = btn.CssClass.Replace("btn-success", "btn-danger")
        Else
            'If Absent
            btn.Text = "Present"
            lbl.Text = "Present"
            btn.CssClass = btn.CssClass.Replace("btn-danger", "btn-success")
        End If
        toDataTable(sender)
    End Sub

    Private Sub lockBtn_Click(sender As Object, e As EventArgs) Handles lockBtn.Click
        toDataTable(sender)
        If attndte.Text <> "" Then
            If attenperiod.Text <> "" AndAlso IsNumeric(attenperiod.Text) Then
                Dim d As New DAOClass
                Dim ds As New Data.DataSet
                Dim dte As Date = attndte.Text
                ds = d.getdata({"@date", "@period", "@cID"}, {dte.ToString("yyyy-MM-dd"), attenperiod.Text, Session("cID")}, "Select * from course_attendance where a_date = @date and a_period = @period and cID = @cID")
                If ds.Tables(0).Rows.Count = 0 Then
                    lockBtn.CssClass = "btn btn-success disabled"
                    commitbtn.CssClass = commitbtn.CssClass.Replace("disabled", "")
                    attntbl.Enabled = True
                    commitbtn.Enabled = True
                    attndte.Enabled = False

                    Dim register As New Data.DataSet
                    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("data_studentConnectionString").ConnectionString)
                    Dim da As New SqlDataAdapter("Select enrolled_id,enroll_no,cID,a_prof,a_date,a_period,a_status from course_attendance", con)
                    Dim builder As SqlCommandBuilder = New SqlCommandBuilder(da)
                    da.InsertCommand = builder.GetInsertCommand()
                    da.Fill(register)
                    register.Tables(0).Rows.Clear()

                    For Each tblrow As GridViewRow In attntbl.Rows
                        Dim row As Data.DataRow = register.Tables(0).NewRow
                        Dim btn As Button = CType(tblrow.FindControl("Atten_Toggle"), Button)
                        Dim enrollid As String = btn.Attributes("data-enrollid").ToString()
                        Dim enrollno As String = tblrow.Cells(0).Text
                        row("enrolled_id") = enrollid
                        row("enroll_no") = enrollno
                        row("cID") = Session("cID")
                        row("a_prof") = teach_name.Text
                        row("a_date") = dte.ToString("yyyy-MM-dd")
                        row("a_period") = attenperiod.Text
                        row("a_status") = 1
                        register.Tables(0).Rows.Add(row)
                    Next
                    Session.Add("regAdapter", da)
                    Session.Add("AttendanceRegister", register)
                End If
            End If
        End If
    End Sub

    Private Sub commitbtn_Click(sender As Object, e As EventArgs) Handles commitbtn.Click
        Dim ad As SqlDataAdapter = Session("regAdapter")
        Dim ds As Data.DataSet = Session("AttendanceRegister")
        ad.Update(ds)
        Session.Remove("AttendanceRegister")
        Session.Remove("regAdapter")
        lockBtn.CssClass = lockBtn.CssClass.Replace("disabled", "")
        attntbl.Enabled = False
        commitbtn.Enabled = False
        attndte.Enabled = True
        For Each row As GridViewRow In attntbl.Rows
            Dim btn = CType(row.FindControl("Atten_Toggle"), Button)
            Dim lbl = CType(row.FindControl("statuslbl"), Label)
            btn.Text = "Present"
            btn.CssClass = "atntbtn btn btn-success"
            lbl.Text = "Present"
        Next
        toDataTable(sender)
        StudentDataSource.DataBind()
        stud_lst.DataBind()
    End Sub

    Private Sub assignrepeat_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles assignrepeat.ItemCommand
        Dim d As New DAOClass
        Dim ds As New Data.DataSet
        If e.CommandName = "DelAssign" Then
            ds = d.getdata({"@aID"}, {e.CommandArgument}, "Select assign_file from assignment_master where assign_id = @aID")
            Dim path As String = "~/files/assignments/" & ds.Tables(0).Rows(0).Item(0)
            If IO.File.Exists(Server.MapPath(path)) Then
                IO.File.Delete(Server.MapPath(path))
            End If
            d.delete({"@aID"}, {e.CommandArgument}, "Delete from assignment_master where assign_id = @aID")
            assignrepeat.DataBind()
            AssignmentsList.DataBind()

        ElseIf e.CommandName = "Uploadassign" Then
            Session.Add("assignID", e.CommandArgument)
            ds = d.getdata({"@mail"}, {Session("user_mail")}, "Select id from course_enrolled where uMail = @mail")
            Session.Add("stuID", ds.Tables(0).Rows(0).Item(0).ToString)
            Response.Redirect("~/Assign_Submit.aspx")

        ElseIf e.CommandName = "viewsubmissions" Then
            Session.Add("selectedID", e.CommandArgument)
            Response.Redirect("~/Assignment_Submissions.aspx")
        End If
    End Sub

    Private Sub assignrepeat_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles assignrepeat.ItemDataBound
        Dim d As New DAOClass
        Dim ds As New Data.DataSet
        Dim assignID As Integer = CType(e.Item.FindControl("assignID"), HiddenField).Value

        'To disable view button if teacher did not attach an assignment
        Dim btn As LinkButton = CType(e.Item.FindControl("viewassign"), LinkButton)
        If btn.CommandArgument = "" Then
            btn.CssClass = "btn btn-default disabled"
            btn.Text = "No Attachment"
            btn.Enabled = False
        End If

        'To indicate the submission status to the student
        '           (submitted, due, missing, submitted late)
        Dim statuslbl As Label = CType(e.Item.FindControl("submit_status_lbl"), Label)
        ds = d.getdata({"@aID", "@mail"}, {assignID, Session("user_mail")}, "Select sub.sub_dte,assign.assign_due_date from assignment_submit sub,assignment_master assign where assign.assign_id = @aID and assign.assign_id = sub.assign_id and sub.stu_id in (Select id from course_enrolled where uMail = @mail and sub.sub_dte is not NULL)")
        Try
            If ds.Tables(0).Rows.Count = 0 Then
                ds = d.getdata({"@aID"}, {assignID}, "Select assign_due_date from assignment_master where assign_id = @aID")
                Dim duedate As Date = ds.Tables(0).Rows(0).Item(0)
                If duedate < Today Then
                    'If assignment is not submitted past due date
                    statuslbl.Text = "Assignment Missing"
                    'FromHtml is a color translator method which is imported
                    statuslbl.ForeColor = FromHtml("#dc3545")
                Else
                    'If assignment is not submitted before due date
                    statuslbl.Text = "Assignment Due"
                    statuslbl.ForeColor = FromHtml("#6c757d")
                End If
            Else
                Dim submitdate As Date = ds.Tables(0).Rows(0).Item(0)
                Dim duedate As Date = ds.Tables(0).Rows(0).Item(1)
                If submitdate <= duedate Then
                    'If assignment is submitted on time
                    statuslbl.Text = "Submitted on time"
                    statuslbl.ForeColor = FromHtml("#28a745")
                Else
                    statuslbl.Text = "Submitted Late"
                    statuslbl.ForeColor = FromHtml("#6c757d")
                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try


        'To display the number of students who have submitted the assignment
        Dim sublbl As Label = CType(e.Item.FindControl("submissionslbl"), Label)
        ds = d.getdata({"@aID"}, {assignID}, "select count(stu_id) from assignment_submit where assign_id = @aID and sub_file is not NULL")
        Dim count As Integer = ds.Tables(0).Rows(0).Item(0)
        If count = 1 Then
            sublbl.Text = "1 student has submitted the assignment"
        Else
            sublbl.Text = count & " students have submitted the assignment"
        End If
    End Sub

    Protected Sub ViewSubmission_Click(sender As Object, e As EventArgs)
        Dim btn As Button = CType(sender, Button)
        Dim filename = btn.CommandArgument.ToString()
        Response.Redirect("~/files/Submitted_assignments/" & filename)
    End Sub

    Private Sub stud_lst_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles stud_lst.ItemDataBound
        Dim enrollid As String = CType(e.Item.FindControl("removeStudent"), Button).CommandArgument.ToString
        Dim attenlabel As Label = e.Item.FindControl("attenlabel")
        Dim d As New DAOClass
        Dim ds As New Data.DataSet
        ds = d.getdata({"@cID", "@eID"}, {Session("cID"), enrollid}, "Select count(a_status),sum(a_status) from course_attendance where cID = @cID and enrolled_id = @eID")
        If ds.Tables(0).Rows(0).Item(0) = "0" Then
            attenlabel.Text = "0/0"
        Else
            attenlabel.Text = ds.Tables(0).Rows(0).Item(1) & "/" & ds.Tables(0).Rows(0).Item(0)
        End If
    End Sub

End Class
