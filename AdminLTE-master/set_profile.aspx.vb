Imports System.Data.SqlClient
Imports System.Web.Services

Partial Class set_profile
    Inherits System.Web.UI.Page
    <WebMethod()>
    Public Shared Sub SaveProfile(stu_name As String, stu_addr As String, stu_f_name As String, stu_m_name As String)
        Dim d As New DAOClass
        d.add({"@stu_name", "@stu_addr", "@stu_f_name", "@stu_m_name", "@stu_mail"}, {stu_name, stu_addr, stu_f_name, stu_m_name, HttpContext.Current.Session("user_mail")}, "update student_master set stu_name=@stu_name,stu_addr=@stu_addr,stu_f_name=@stu_f_name,stu_m_name=@stu_m_name where stu_mail = @stu_mail")
    End Sub
    <WebMethod()>
    Public Shared Function load_name() As String
        Dim d As New DAOClass
        Dim name As String
        Dim ds As Data.DataSet = d.getdata({"@stu_mail"}, {HttpContext.Current.Session("user_mail")}, "select stu_name from student_master where stu_mail=@stu_mail")
        name = ds.Tables(0).Rows(0).Item(0)
        Return name
    End Function
    <WebMethod()>
    Public Shared Function load_addr() As String
        Dim d As New DAOClass
        Dim name As String
        Dim ds As Data.DataSet = d.getdata({"@stu_mail"}, {HttpContext.Current.Session("user_mail")}, "select stu_addr from student_master where stu_mail=@stu_mail")
        name = ds.Tables(0).Rows(0).Item(0)
        Return name
    End Function
    <WebMethod()>
    Public Shared Function load_fname() As String
        Dim d As New DAOClass
        Dim name As String
        Dim ds As Data.DataSet = d.getdata({"@stu_mail"}, {HttpContext.Current.Session("user_mail")}, "select stu_f_name from student_master where stu_mail=@stu_mail")
        name = ds.Tables(0).Rows(0).Item(0)
        Return name
    End Function
    <WebMethod()>
    Public Shared Function load_mname() As String
        Dim d As New DAOClass
        Dim name As String
        Dim ds As Data.DataSet = d.getdata({"@stu_mail"}, {HttpContext.Current.Session("user_mail")}, "select stu_m_name from student_master where stu_mail=@stu_mail")
        name = ds.Tables(0).Rows(0).Item(0)
        Return name
    End Function
End Class