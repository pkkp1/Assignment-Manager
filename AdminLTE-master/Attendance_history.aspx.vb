Imports System.Data.SqlClient
Imports System.Web.Services
Partial Class Attendance_history
    Inherits System.Web.UI.Page

    Public Sub toDataTable(sender As Object)
        ScriptManager.RegisterClientScriptBlock(
            CType(sender, Control),
            Me.GetType(),
            "toDataTable",
            "toDataTable();",
            True
        )
    End Sub

    Private Sub Attendance_history_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim d As New DAOClass
            Dim ds As New Data.DataSet
            ds = d.getdata({"@cID"}, {Session("cID")}, "Select distinct a_date from course_attendance where cID = @cID")
            dateList.DataSource = ds.Tables(0)
            dateList.DataTextFormatString = "{0:dd/MM/yyyy}"
            dateList.DataValueField = "a_date"
            dateList.DataTextField = "a_date"
            dateList.DataBind()
            ds = d.getdata({"@cID", "@date"}, {Session("cID"), CType(dateList.SelectedValue, Date).ToString("yyyy-MM-dd")}, "Select distinct a_period from course_attendance where cID = @cID and a_date = @date")
            periodList.DataSource = ds.Tables(0)
            periodList.DataValueField = "a_period"
            periodList.DataTextField = "a_period"
            periodList.DataBind()
        End If
    End Sub

    Private Sub viewBtn_Click(sender As Object, e As EventArgs) Handles viewBtn.Click
        Dim d As New DAOClass
        Dim ds As New Data.DataSet
        ds = d.getdata({"@date", "@period", "@cID"}, {CType(dateList.SelectedValue, Date).ToString("yyyy-MM-dd"), periodList.SelectedValue, Session("cID")}, "Select distinct st.stu_enroll Enroll, st.stu_name Name, attn.a_status, attn.a_period from student_master st, course_attendance attn where attn.a_date = @date and attn.a_period = @period and attn.cID = @cID and attn.enroll_no = st.stu_enroll")
        attntbl.DataSource = ds.Tables(0)
        attntbl.DataBind()
        toDataTable(sender)
    End Sub
End Class
