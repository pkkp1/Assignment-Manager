<%@ WebHandler Language="VB" Class="SubmitAssignment" %>

Imports System
Imports System.Web

Public Class SubmitAssignment : Implements IHttpHandler

    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        Try
            'Check if Request is to Upload the File.
            If context.Request.Files.Count > 0 Then
                'Fetch the Uploaded File.
                Dim files As HttpFileCollection = context.Request.Files
                Dim postedFile As HttpPostedFile = files(0)
                'Set the Folder Path.
                Dim path = postedFile.FileName.Split("?")(0)
                Dim filename = postedFile.FileName.Split("?")(1)
                Dim folderPath As String = context.Server.MapPath(path & filename)
                'Save the File in Folder.
                postedFile.SaveAs(folderPath)
                context.Response.Write(filename)
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class