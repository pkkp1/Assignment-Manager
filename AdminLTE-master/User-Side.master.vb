Imports System.Web.Services
Partial Class User_Master
    Inherits System.Web.UI.MasterPage

    <WebMethod()>
    Public Shared Function isTeacher() As String
        Dim role As String = HttpContext.Current.Session("UserRole")
        Return role
    End Function

    Private Sub User_Master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("user_name") <> "" Then
            fname.Text = Session("user_name")
        Else
            Response.Redirect("login.aspx")
        End If
    End Sub

    Private Sub logout_Click(sender As Object, e As EventArgs) Handles logout.Click
        Session.RemoveAll()
        Response.Redirect("login.aspx")
    End Sub
End Class

