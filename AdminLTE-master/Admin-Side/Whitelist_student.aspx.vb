
Partial Class Admin_Side_Whitelist_student
    Inherits System.Web.UI.Page

    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim d As New DAOClass
        d.delete({"@stu_Mail"}, {e.CommandArgument}, "Delete from student_master where stu_mail = @stu_mail")
        Students_whitelist.DataBind()
        GridView1.DataBind()
    End Sub

    Private Sub addBtn_Click(sender As Object, e As EventArgs) Handles addBtn.Click
        Dim d As New DAOClass
        d.add({"@stu_mail"}, {sMail.Text}, "Insert into student_master(stu_mail) values(@stu_mail);")
        sMail.Text = ""
        Students_whitelist.DataBind()
        GridView1.DataBind()
    End Sub
End Class
