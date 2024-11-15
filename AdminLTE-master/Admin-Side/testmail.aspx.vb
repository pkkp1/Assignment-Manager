Imports System.Net.Mail
Partial Class testmail
  Inherits System.Web.UI.Page
  Private Sub testmail_Load(sender As Object, e As EventArgs) Handles Me.Load
    mailto.Focus()
  End Sub
  Private Sub snd_Click(sender As Object, e As EventArgs) Handles snd.Click
    If mailto.Text <> "" Then
      If msub.Text <> "" Then
        If mmsg.Text <> "" Then
          send(mailto.Text, msub.Text, mmsg.Text)
          mailto.Text = ""
          msub.Text = ""
          mmsg.Text = ""
        Else
          js(Me.GetType(), "Enter Email Message")
        End If
      Else
        js(Me.GetType(), "Enter Subject")
      End If
    Else
      js(Me.GetType(), "Enter Email Address")
    End If
  End Sub
  Public Sub js(ByVal t As Type, ByVal s As String)
    Dim script As String = "window.onload = function() { alr('" & s & "'); };"
    ClientScript.RegisterStartupScript(t, "alr", script, True)
    If s = "Enter Email Address" Then
      mailto.Focus()
    ElseIf s = "Enter Subject" Then
      msub.Focus()
    ElseIf s = "Enter Email Message" Then
      mmsg.Focus()
    End If
  End Sub
  Public Sub send(ByVal mAdd As String, ByVal mSub As String, ByVal mMsg As String)
    Dim mail As New MailMessage("apractice552@gmail.com", mAdd)
    mail.Subject = mSub
    mail.Body = mMsg
    Dim smt As New SmtpClient("smtp.gmail.com", 587)
    smt.Credentials = New System.Net.NetworkCredential("apractice552@gmail.com", "_Prem_@772003")
    smt.EnableSsl = True
    smt.Send(mail)
  End Sub
End Class
