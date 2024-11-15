Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.Security.Cryptography
Public Class DAOClass
    Private con As SqlConnection

    Public Sub New()
        con = New SqlConnection("Data Source=103.212.121.67;Initial Catalog=data_student;Persist Security Info=True;User ID=data_student;Password=Student@4050")
    End Sub

    Public Function getConnection() As SqlConnection
        Return con
    End Function

    'To create a salt value to use during hashing
    Public Function CreateSalt() As Byte()
        'Get random string
        Dim saltstr As String = ""
        Dim r As New Random
        Dim flag As Boolean = True
        For l = 0 To 5
            Dim n As Integer = r.NextDouble() * 10
            If n Mod 2 = 0 Then
                Dim n_pass As Integer = r.Next(0, 100)
                saltstr &= n_pass
            Else
                If flag = True Then
                    Dim i As Char = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * r.NextDouble() + 65)))
                    saltstr &= i.ToString.ToLower()
                    flag = False
                Else
                    Dim i As Char = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * r.NextDouble() + 65)))
                    saltstr &= i.ToString.ToUpper()
                    flag = True
                End If
            End If
        Next
        Dim salt() As Byte = Encoding.ASCII.GetBytes(saltstr)
        Return salt
    End Function

    'To get a hashed value to store in the database
    Public Function GetHash(text As String, salt As Byte()) As String
        'Converting text to Byte array
        Dim textBytes() As Byte = Encoding.ASCII.GetBytes(text)
        'Combining salt and text
        Dim textAndSalt(textBytes.Length + salt.Length) As Byte
        Dim i As Integer
        For i = 0 To textBytes.Length - 1
            textAndSalt(i) = textBytes(i)
        Next
        For j = 0 To salt.Length - 1
            i += 1
            textAndSalt(i) = salt(j)
        Next
        'Now with both the salt and text in one array, let us put them through
        'The SHA256 hash algorithm

        Dim sha As New SHA256Managed
        Dim hashvalue() As Byte = sha.ComputeHash(textAndSalt)
        Return Convert.ToBase64String(hashvalue)
    End Function

    Public Function get_con() As Boolean
        Dim f As Boolean = False
        Try
            con.Open()
            f = True
            con.Close()
        Catch ex As Exception
        End Try
        Return f
    End Function
    Public Function getdata(ByVal param_name() As String, ByVal param_value() As String, ByVal qry As String) As Data.DataSet
        Dim ds As New Data.DataSet
        Dim da As New SqlDataAdapter()
        da.SelectCommand = New SqlCommand(qry, con)
        Dim i As Integer
        For i = 0 To param_name.Length - 1
            da.SelectCommand.Parameters.AddWithValue(param_name(i), param_value(i))
        Next
        con.Open()
        da.SelectCommand.ExecuteReader()
        con.Close()
        da.Fill(ds)
        Return ds
    End Function

    Public Function getdata1(ByVal qry As String) As Data.DataSet
        Dim ds As New Data.DataSet
        Dim da As New SqlDataAdapter()
        da.SelectCommand = New SqlCommand(qry, con)
        con.Open()
        da.SelectCommand.ExecuteReader()
        con.Close()
        da.Fill(ds)
        Return ds
    End Function

    Public Sub delete(ByVal param_name() As String, ByVal param_value() As String, ByVal qry As String)
        Dim da As New SqlDataAdapter()
        da.DeleteCommand = New SqlCommand(qry, con)
        Dim i As Integer
        For i = 0 To param_name.Length - 1
            da.DeleteCommand.Parameters.AddWithValue(param_name(i), param_value(i))
        Next
        con.Open()
        da.DeleteCommand.ExecuteReader()
        con.Close()
    End Sub

    Public Sub add1(ByVal qry As String)
        Dim da As New SqlDataAdapter()
        da.SelectCommand = New SqlCommand(qry, con)
        con.Open()
        da.SelectCommand.ExecuteNonQuery()
        con.Close()
    End Sub
    Public Sub add(ByVal param_name() As String, ByVal param_value() As String, ByVal qry As String)
        Dim da As New SqlDataAdapter()
        da.InsertCommand = New SqlCommand(qry, con)
        Dim i As Integer
        For i = 0 To param_name.Length - 1
            da.InsertCommand.Parameters.AddWithValue(param_name(i), param_value(i))
        Next
        con.Open()
        da.InsertCommand.ExecuteNonQuery()
        con.Close()
    End Sub
    Public Sub update(ByVal param_name() As String, ByVal param_value() As String, ByVal qry As String)
        Dim da As New SqlDataAdapter()
        da.UpdateCommand = New SqlCommand(qry, con)
        Dim i As Integer
        For i = 0 To param_name.Length - 1
            da.UpdateCommand.Parameters.AddWithValue(param_name(i), param_value(i))
        Next
        con.Open()
        da.UpdateCommand.ExecuteNonQuery()
        con.Close()
    End Sub
    Public Function gen_pwd() As String
        Dim pwd As String = ""
        Dim r As New Random
        Dim flag As Boolean = True
        For l = 0 To 5
            Dim n As Integer = r.NextDouble() * 10
            If n Mod 2 = 0 Then
                Dim n_pass As Integer = r.Next(0, 100)
                pwd &= n_pass
            Else
                If flag = True Then
                    Dim i As Char = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * r.NextDouble() + 65)))
                    pwd &= i.ToString.ToLower()
                    flag = False
                Else
                    Dim i As Char = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * r.NextDouble() + 65)))
                    pwd &= i.ToString.ToUpper()
                    flag = True
                End If
            End If
        Next
        Return pwd
    End Function
    Public Function gen_link() As String
        Dim pwd As String = ""
        Dim r As New Random
        Dim flag As Boolean = True
        For l = 0 To 5
            Dim n As Integer = r.NextDouble() * 10
            Dim n_pass As Integer = r.Next(0, 100)
            pwd &= n_pass
        Next
        Return pwd
    End Function
    Public Sub send(ByVal mAdd As String, ByVal mSub As String, ByVal mMsg As String)
        Dim mail As New MailMessage("apractice552@gmail.com", mAdd)
        mail.Subject = mSub
        mail.Body = mMsg
        Dim smt As New SmtpClient("smtp.gmail.com", 587)
        smt.Credentials = New System.Net.NetworkCredential("apractice552@gmail.com", "jccu zjfv owvd scpn")
        smt.EnableSsl = True
        smt.Send(mail)
    End Sub
End Class