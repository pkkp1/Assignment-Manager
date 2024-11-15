Partial Class MasterPage
  Inherits System.Web.UI.MasterPage

  Private Sub MasterPage_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Session("fname") <> "" Then
            fname.Text = Session("fname")
        Else
      Response.Redirect("login.aspx")
    End If
  End Sub
    Protected Sub logout_btn_Click(sender As Object, e As EventArgs)
        Session.Abandon()
        Response.Redirect("~/login.aspx")
    End Sub
End Class
