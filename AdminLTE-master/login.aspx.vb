Imports System.Drawing.Color
Partial Class Admin_Side_student_login
    Inherits System.Web.UI.Page
    Private Sub lgn_btn_Click(sender As Object, e As EventArgs) Handles lgn_btn.Click
        Try
            If user_mail.Text <> "" Then
                user_mail.BorderColor = FromArgb(202, 212, 218)
                If user_pass.Text <> "" Then
                    user_pass.BorderColor = FromArgb(202, 212, 218)
                    Dim d As New DAOClass
                    Dim ds As New Data.DataSet
                    Dim p(2), v(2) As String
                    p = {"@mailID", "@pass"}
                    v = {user_mail.Text, user_pass.Text}
                    ds = d.getdata(p, v, "select * from student_master where stu_mail=@mailID")
                    If ds.Tables(0).Rows.Count > 0 Then

                        'If user is a student
                        Dim saltstring As String = ds.Tables(0).Rows(0).Item("stu_salt")
                        Dim storedhash As String = ds.Tables(0).Rows(0).Item("stu_hash")
                        Dim salt() As Byte = Encoding.ASCII.GetBytes(saltstring)
                        Dim hashed As String = d.GetHash(user_pass.Text, salt)
                        If StrComp(hashed, storedhash) = 0 Then
                            'Login successful
                            Label1.Text = ""
                            Session.Add("user_mail", user_mail.Text)
                            Session.Add("user_name", ds.Tables(0).Rows(0).Item("stu_name"))
                            'Session never used so no need for it
                            'Session.Add("user_pass", user_pass.Text)
                            If Request.QueryString("link") <> "" Then
                                Dim link As String = Request.QueryString("link")
                                ds = d.getdata1("Select id from course_master where clink='" & link & "'")
                                Dim id As String = ds.Tables(0).Rows(0).Item(0)
                                ReDim p(4), v(4)
                                p = {"@course", "@mailID", "@name", "@role"}
                                v = {id, Session("user_mail"), Session("user_name"), "Student"}
                                Dim qry As String = "insert into course_enrolled values(@course,@mailID,@name,@role)"
                                d.add(p, v, qry)
                                Response.Redirect("Course.aspx?link=" & link)
                            Else
                                Response.Redirect("user_dash.aspx")
                            End If
                        Else
                            'Login failed
                            Label1.Text = "Invalid Username or Password"
                            user_mail.Focus()
                        End If
                    Else
                        ds = d.getdata(p, v, "select * from teacher_master where teach_mail=@mailID")
                        If ds.Tables(0).Rows.Count > 0 Then

                            'If user is a Teacher
                            Dim saltstring As String = ds.Tables(0).Rows(0).Item("teach_salt")
                            Dim storedhash As String = ds.Tables(0).Rows(0).Item("teach_hash")
                            Dim salt() As Byte = Encoding.ASCII.GetBytes(saltstring)
                            Dim hashed As String = d.GetHash(user_pass.Text, salt)

                            If StrComp(hashed, storedhash) = 0 Then
                                Session.Add("user_mail", user_mail.Text)
                                Session.Add("user_name", ds.Tables(0).Rows(0).Item("teach_name"))
                                Response.Redirect("user_dash.aspx")
                            Else
                                Label1.Text = "Invalid Username or Password"
                                user_mail.Focus()
                            End If
                        Else

                            'If user does not exist

                            Label1.Text = "Invalid Username or Password"
                            user_mail.Focus()
                        End If
                    End If
                Else
                    user_pass.BorderColor = Red
                    user_pass.Focus()
                    Label1.Text = "Enter Password"
                End If
            Else
                user_mail.BorderColor = Red
                user_mail.Focus()
                Label1.Text = "Enter E-Mail"
            End If
        Catch ex As Exception
            Label1.Text &= ex.Message
        End Try
    End Sub
    Private Sub Admin_Side_login_Load(sender As Object, e As EventArgs) Handles Me.Load
        user_mail.Focus()
        If Session("reg") Then
            lbl.Text = "Note : An email has been sent to your registered Email ID. Check Spam folder  if not found in inbox."
        Else
            lbl.Text = ""
        End If
    End Sub
End Class
