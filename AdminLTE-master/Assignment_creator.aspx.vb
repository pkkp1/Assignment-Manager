Imports System.Web.Services
Imports System.Data.SqlClient
Partial Class Admin_Side_Assignment_master
    Inherits System.Web.UI.Page

    <WebMethod()>
    Public Shared Sub createassign(ByVal profnme As String, ByVal title As String, ByVal duedate As String, ByVal descrip As String, ByVal filenme As String)
        Dim query As String = "Insert into assignment_master values(@cID,@name,@desc,@up_date,@due_date,@prof,@file)"
        Dim p(7), v(7) As String
        Dim nameparts() As String = filenme.Split(".")
        duedate = CType(duedate, Date).ToString("yyyy-MM-dd")
        p = {"@cID", "@name", "@desc", "@up_date", "@due_date", "@prof", "@file"}
        v = {HttpContext.Current.Session("cID"), title, descrip.Replace(vbCrLf, "<br>"), Today.ToString("yyyy-MM-dd"), duedate, profnme, filenme}
        Dim d As New DAOClass
        d.add(p, v, query)

        Dim con As SqlConnection = d.getConnection()
        Dim assignid As String = d.getdata1("Select Max(assign_id) from assignment_master").Tables(0).Rows(0).Item(0).ToString
        Dim ds As Data.DataSet = d.getdata({"@cID"}, {HttpContext.Current.Session("cID")}, "Select id from course_enrolled where cID = @cID")
        Dim inscmd As New SqlCommand("Insert into assignment_submit values(@stuid,@assignid,NULL,NULL)", con)
        inscmd.Parameters.AddWithValue("@assignid", assignid)
        inscmd.Parameters.AddWithValue("@stuid", "")
        For i = 0 To ds.Tables(0).Rows.Count - 1
            con.Open()
            inscmd.Parameters("@stuid").Value = ds.Tables(0).Rows(i).Item(0)
            inscmd.ExecuteNonQuery()
            con.Close()
        Next
    End Sub

    <WebMethod()>
    Public Shared Function getProfs() As String
        Dim d As New DAOClass
        Dim ad As New SqlDataAdapter("select uName from course_enrolled where uRole='Teacher' and cID = @cID", d.getConnection())
        Dim ds As New Data.DataSet
        ad.SelectCommand.Parameters.AddWithValue("@cID", HttpContext.Current.Session("cID"))
        ad.Fill(ds, "profNames")
        Return ds.GetXml()
    End Function

End Class
