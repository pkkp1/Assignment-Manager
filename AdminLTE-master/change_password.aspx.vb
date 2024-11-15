Imports System.Drawing.Color
Partial Class change_password
    Inherits System.Web.UI.Page
    Private Sub chng_Click(sender As Object, e As EventArgs) Handles chng.Click
        If stu_pass.Text <> "" Then
            stu_pass.BorderColor = FromArgb(202, 212, 218)
            cp.Text = ""
            If npwd.Text <> "" Then
                npwd.BorderColor = FromArgb(202, 212, 218)
                np.Text = ""
                If ncpwd.Text <> "" Then
                    ncpwd.BorderColor = FromArgb(202, 212, 218)
                    cnp.Text = ""
                    Dim d As New DAOClass
                    Dim ds As New Data.DataSet
                    Dim p(0) As String
                    p(0) = "@stu_pass"
                    Dim v(0) As String
                    v(0) = stu_pass.Text
                    ds = d.getdata(p, v, "select * from student_master where stu_pass=@stu_pass")
                    If ds.Tables(0).Rows.Count > 0 Then
                        If npwd.Text.Equals(ncpwd.Text) Then
                            Dim pwd(1) As String
                            pwd(0) = "@stu_pass"
                            pwd(1) = "@stu_mail"
                            Dim pwd1(1) As String
                            pwd1(0) = npwd.Text
                            pwd1(1) = Session("user_mail")
                            d.add(pwd, pwd1, "update student_master set stu_pass=@stu_pass where stu_mail=@stu_mail")
                        Else
                            ncpwd.BorderColor = Red
                            ncpwd.Focus()
                            cnp.Text = "Both Passwords do not match"
                        End If
                    Else
                        cp.Text = "Invalid Password"
                        stu_pass.Focus()
                    End If
                Else
                    ncpwd.BorderColor = Red
                    ncpwd.Focus()
                    cnp.Text = "Enter New Password"
                End If
            Else
                npwd.BorderColor = Red
                npwd.Focus()
                np.Text = "Enter New Password"
            End If
        Else
            stu_pass.BorderColor = Red
            stu_pass.Focus()
            cp.Text = "Enter Current Password."
        End If
    End Sub
End Class