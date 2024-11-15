
Partial Class Admin_Side_Teacher_Master
    Inherits System.Web.UI.Page

    Private Sub add_Teacher_Click(sender As Object, e As EventArgs) Handles add_new_teacher.Click
        Dim d As New DAOClass
        Dim msg As String = "Hello Teacher :), Your password is "
        Dim p(4), v(4) As String
        p = {"@mailID", "@name", "@pass"}
        v = {teach_mail.Text, teach_name.Text, d.gen_pwd()}
        d.add(p, v, "insert into teacher_master values(@mailID,@name,@pass)")
        Session("reg") = True
        d.send(teach_mail.Text, "Account Verification", msg)
        all_teachers_source.DataBind()
        all_teachers.DataBind()
    End Sub

End Class
