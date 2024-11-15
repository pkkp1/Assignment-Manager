Imports System.Data.SqlClient
Imports System.Web.Services
Partial Class Attendance
    Inherits System.Web.UI.Page

    <WebMethod()>
    Public Shared Function GetStudents() As String
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("data_studentConnectionString").ConnectionString)
        Dim ad As New SqlDataAdapter("Select s.stu_enroll Enroll,c.uName Name from course_enrolled c,student_master s where c.cID in (Select id from course_master where uRole = 'student' and clink = '" & HttpContext.Current.Request.QueryString("link") & "') and s.stu_mail = c.uMail Order By s.stu_enroll", conn)
        Dim ds As New Data.DataSet
        ad.Fill(ds, "course_enrolled")
        Return ds.GetXml()
    End Function
End Class
