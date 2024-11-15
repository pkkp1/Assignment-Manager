Imports System.Data.SqlClient
Partial Class forgot_pass
    Inherits System.Web.UI.Page

    Private Sub for_pass_btn_Click(sender As Object, e As EventArgs) Handles for_pass_btn.Click
        Dim d As New DAOClass
        Dim ds As New Data.DataSet
        ds = d.getdata({"@mail"}, {fmail.Text}, "Select * from student_master where stu_mail = @mail")
        If ds.Tables(0).Rows.Count > 0 Then
            Dim msg As String = "Hello Student :), Your new password is "
            Dim pass As String = d.gen_pwd()
            Dim p(5), v(5) As String
            'Get salt value
            Dim salt() As Byte = d.CreateSalt()
            'Convert salt byte array to string in order to save in database
            Dim saltstring As String = Encoding.ASCII.GetString(salt)
            'Get hashed value with salt
            Dim hashed As String = d.GetHash(pass, salt)
            p = {"@stu_salt", "@stu_hash", "@stu_mail"}
            v = {saltstring, hashed, fmail.Text}
            msg &= pass
            d.add(p, v, "Update student_master set stu_salt = @stu_salt,stu_hash = @stu_hash where stu_mail = @stu_mail")
            Session("reg") = True
            d.send(fmail.Text, "Account Verification", msg)
        End If
    End Sub

End Class
