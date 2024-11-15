
Partial Class Assignment_Submissions
    Inherits System.Web.UI.Page

    Private Sub all_Submission_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles all_Submission.RowCommand
        If e.CommandName = "Submitted_File" Then
            Response.Redirect("~/files/Submitted_assignments/" & e.CommandArgument)
        End If

    End Sub

    Private Sub all_Submission_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles all_Submission.RowCreated
        Dim gridview = CType(sender, GridView)
        If gridview.Rows.Count <> 0 Then
            Try
                Dim currentrow = gridview.Rows.Count - 1
                Dim lbl As Label = CType(gridview.Rows(currentrow).FindControl("statuslbl"), Label)
                Dim duedate As Date = CType(lbl.Attributes.Item("data-due-date").ToString(), Date)
                If gridview.Rows(currentrow).Cells(1).Text = "&nbsp;" Then
                    If Today.Date > duedate Then
                        lbl.Text = "Assignment Missing"
                    Else
                        lbl.Text = "Assignment due"
                    End If
                Else
                    Dim submitdate As Date = CType(gridview.Rows(currentrow).Cells(1).Text, Date)
                    If duedate >= submitdate Then
                        lbl.Text = "Submitted on Time"
                    Else
                        lbl.Text = "Submitted Late"
                    End If
                End If
            Catch ex As Exception

            End Try
        End If
    End Sub
End Class
