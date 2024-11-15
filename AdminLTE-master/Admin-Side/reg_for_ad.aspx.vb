Partial Class student_registration
  Inherits System.Web.UI.Page

    Private Sub reg_Click(sender As Object, e As EventArgs) Handles reg.Click
        Dim d As New DAOClass
        Dim p(4) As String
        p = {"@name", "@mail", "@salt", "@hash"}
        Dim v(4) As String


        Dim salt() As Byte = d.CreateSalt()
        'Convert salt byte array to string in order to save in database
        Dim saltstring As String = Encoding.ASCII.GetString(salt)
        'Get hashed value with salt
        Dim hashed As String = d.GetHash(fpwd.Text, salt)

        v = {fname.Text, fmail.Text, saltstring, hashed}
        d.add(p, v, "insert into admins_master (ad_name,ad_mail,ad_salt,ad_hash) values (@name,@mail,@salt,@hash)")
        Response.Redirect("login.aspx")

    End Sub

    Private Sub student_registration_Load(sender As Object, e As EventArgs) Handles Me.Load
    fname.Focus()
  End Sub
End Class
