Partial Class Admin_Side_student_register
    Inherits System.Web.UI.Page
    Private Sub reg_Click(sender As Object, e As EventArgs) Handles reg.Click
        Dim d As New DAOClass
        Dim ds As New Data.DataSet
        ds = d.getdata({"@stu_mail"}, {stu_mail.Text}, "Select * from student_master where stu_mail = @stu_mail")
        If ds.Tables(0).Rows.Count > 0 Then
            Dim msg As String = "Hello Student :), Your password is "
            Dim pass As String = d.gen_pwd()
            Dim p(5), v(5) As String
            'Get salt value
            Dim salt() As Byte = d.CreateSalt()
            'Convert salt byte array to string in order to save in database
            Dim saltstring As String = Encoding.ASCII.GetString(salt)
            'Get hashed value with salt
            Dim hashed As String = d.GetHash(pass, salt)
            p = {"@stu_mail", "@stu_name", "@stu_enroll", "@stu_salt", "@stu_hash"}
            v = {stu_mail.Text, stu_name.Text, stu_enroll.Text, saltstring, hashed}
            msg &= pass
            d.add(p, v, "Update student_master set stu_name = @stu_name, stu_enroll = @stu_enroll ,stu_salt = @stu_salt,stu_hash = @stu_hash where stu_mail = @stu_mail")
            Session("reg") = True
            d.send(stu_mail.Text, "Account Verification", msg)
            Response.Redirect("login.aspx")
        Else
            msgLbl.Text = "Your E-mail has not been registered.<br/> Please ask your teacher to add it."
        End If
    End Sub
    Private Sub student_registration_Load(sender As Object, e As EventArgs) Handles Me.Load
        stu_name.Focus()
    End Sub
End Class
