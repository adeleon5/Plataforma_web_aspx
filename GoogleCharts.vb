Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.Web.UI

Module GoogleCharts
    Public nDGoogle As DataSet
    Public nAGoogle(50)

    Public Function TableGoogleCharts(ByRef SQL As String) As String
        Dim Respuesta As String = "data.addColumn('string','"

        Try

            'New google.visualization.DataTable();
            'Data.addColumn('string', 'Name');
            'Data.addColumn('number', 'Salary');
            'Data.addColumn('boolean', 'Full Time Employee');
            'Data.addRows([
            '  ['Mike',  {v: 10000, f: '$10,000'}, true],
            '  ['Jim',   {v:8000,   f: '$8,000'},  false],
            '  ['Alice', {v: 12500, f: '$12,500'}, true],
            '  ['Bob',   {v: 7000,  f: '$7,000'},  true]
            ']);

            Dim nC = New SqlConnection(ConfigurationManager.ConnectionStrings("EASYIDB").ConnectionString)
            Dim nI As Integer
            nDGoogle = Nothing
            nDGoogle = New DataSet
            Dim Da As New SqlDataAdapter(SQL, nC)
            Da.Fill(nDGoogle, "nA")
            For nI = 0 To nDGoogle.Tables("nA").Columns.Count - 1
                If nI <> 0 Then
                    Respuesta = Respuesta + "data.addColumn('string','" + nDGoogle.Tables("nA").Columns(nI).ColumnName.ToString() + "');"
                Else
                    Respuesta = Respuesta + nDGoogle.Tables("nA").Columns(nI).ColumnName.ToString() + "');"
                End If
            Next

            nC = Nothing
            Da = Nothing
            nDGoogle = Nothing
        Catch ex As Exception
            Notifica(ex.Message.ToString(), "Inicio.aspx")
        End Try

        Return Respuesta
    End Function

    Public Function TableGoogleChartsRows(ByRef SQL As String) As String
        Dim Filas As String = ""
        Try

            'New google.visualization.DataTable();
            'Data.addColumn('string', 'Name');
            'Data.addColumn('number', 'Salary');
            'Data.addColumn('boolean', 'Full Time Employee');
            'Data.addRows([
            '  ['Mike',  {v: 10000, f: '$10,000'}, true],
            '  ['Jim',   {v:8000,   f: '$8,000'},  false],
            '  ['Alice', {v: 12500, f: '$12,500'}, true],
            '  ['Bob',   {v: 7000,  f: '$7,000'},  true]
            ']);

            Dim nC = New SqlConnection(ConfigurationManager.ConnectionStrings("EASYIDB").ConnectionString)
            Dim nR As Integer
            Dim nH As Integer
            nDGoogle = Nothing
            nDGoogle = New DataSet
            Dim Da As New SqlDataAdapter(SQL, nC)
            Da.Fill(nDGoogle, "nA")
            For nR = 0 To nDGoogle.Tables("nA").Rows.Count - 1
                For nH = 0 To nDGoogle.Tables("nA").Columns.Count - 1
                    If nH = 0 Then
                        Console.Write("0")
                        Filas = "['" + nDGoogle.Tables("nA").Rows(nR).Item(nH).ToString + "'"
                    ElseIf nH = 12 Then
                        Console.Write("12")
                        Filas = ",'" + Filas + nDGoogle.Tables("nA").Rows(nR).Item(nH).ToString + "']"
                    Else
                        Console.Write(nH.ToString)
                        Filas = ",'" + Filas + nDGoogle.Tables("nA").Rows(nR).Item(nH).ToString + "'"
                    End If
                Next
            Next
            Filas = Filas

            nC = Nothing
            Da = Nothing
            nDGoogle = Nothing
        Catch ex As Exception
            Notifica(ex.Message.ToString(), "Inicio.aspx")
        End Try

        Return Filas
    End Function

End Module