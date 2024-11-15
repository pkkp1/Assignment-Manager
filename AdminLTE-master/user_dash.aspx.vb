Partial Class user_dash
    Inherits System.Web.UI.Page

    Private Sub user_dash_Load(sender As Object, e As EventArgs) Handles Me.Load
        Session.Add("Today_date", Today.ToString("yyyy-MM-dd"))
        Session.Add("Seven_date", Today.AddDays(7).ToString("yyyy-MM-dd"))
    End Sub

    Private Sub courseslst_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles courseslst_student.ItemDataBound
        Dim countlabel As Label = e.Item.FindControl("assigncount")
        Dim attenlabel As Label = e.Item.FindControl("Attendancelbl")
        Dim courseID As String = CType(e.Item.FindControl("stud_csID"), Label).Text
        Dim assignrepeat As Repeater = e.Item.FindControl("duelst")
        countlabel.Text = assignrepeat.Items.Count & " assignment" & IIf(assignrepeat.Items.Count = 1, "", "s") & " due this week"
        If attenlabel.Text = "" Then
            Dim d As New DAOClass
            Dim ds As New Data.DataSet
            ds = d.getdata({"@mail", "@cID"}, {Session("user_mail"), courseID}, "Select count(a_status),sum(a_status) from course_attendance where enrolled_id in (Select id from course_enrolled where uMail = @mail) and cID = @cID")
            If ds.Tables(0).Rows(0).Item(0) = "0" Then
                attenlabel.Text = "Attendance: 0 out of 0"
            Else
                attenlabel.Text = "Attendance: " & ds.Tables(0).Rows(0).Item(1) & " out of " & ds.Tables(0).Rows(0).Item(0)
            End If
        End If
    End Sub

    Protected Sub viewsubmissions_Click(sender As Object, e As EventArgs)
        Dim assignID As Integer = CType(sender, LinkButton).Attributes("data-assignID")
        Session.Add("selectedID", assignID)
        Response.Redirect("~/Assignment_Submissions.aspx")
    End Sub

    Protected Sub submissionslbl_Load(sender As Object, e As EventArgs)
        Dim ds As New Data.DataSet
        Dim d As New DAOClass
        Dim sublbl As Label = CType(sender, Label)
        Dim assignID As Integer = sublbl.Attributes("data-assignID")
        ds = d.getdata({"@aID"}, {assignID}, "select count(stu_id) from assignment_submit where assign_id = @aID and sub_file is not NULL")
        Dim count As Integer = ds.Tables(0).Rows(0).Item(0)
        If count = 1 Then
            sublbl.Text = "1 student has submitted the assignment"
        Else
            sublbl.Text = count & " students have submitted the assignment"
        End If
    End Sub
End Class