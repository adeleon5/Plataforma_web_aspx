Imports System.IO

Public Class Carga_Venta
    Inherits base

    Private Sub Carga_Venta_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        ' Initialize the random-number generator.
        Randomize()
        ' Generate random value between 1 and 6.
        TXTNODOCTOCARGA.Text = GenerarCadena(10)
        TXTNODOCTOCARGA.Enabled = False
        TXTFECHACARGA.Text = Date.Now.ToString("dd-MM-yyyy")
        TXTFECHACARGA.Enabled = False
        DdBind(DDLEMPRESACARGA, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO]  100", "ID", "EMPRESA")
    End Sub

    Private Function GenerarCadena(ByVal numeroCaracteres As Integer) As String

        ' Dimensionamos un array para almacenar tanto las
        ' letras mayúsculas como minúsculas (52 letras).
        Dim letras(51) As String
        ' Rellenamos el array.
        Dim n As Integer
        For item As Int32 = 65 To 90
            letras(n) = Chr(item)
            letras(n + 1) = letras(n).ToLower
            n += 2
        Next
        Dim cadenaAleatoria As String = String.Empty
        ' Iniciamos el generador de números aleatorios
        Dim rnd As New Random(DateTime.Now.Millisecond)
        For n = 0 To numeroCaracteres
            Dim numero As Integer = rnd.Next(0, 51)
            cadenaAleatoria &= letras(numero)
        Next
        Return cadenaAleatoria
    End Function

    Protected Sub ImportCSV()
        'Upload and save the file
        Dim csvPath As String = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload1.PostedFile.FileName)
        FileUpload1.SaveAs(csvPath)

        'Create a DataTable.
        Dim dt As New DataTable()
        dt.Columns.AddRange(New DataColumn(10) {New DataColumn("TIENDA", GetType(String)), New DataColumn("FECHA DE EMISIÓN", GetType(String)), New DataColumn("FECHA DE CERTIFICACIÓN", GetType(String)), New DataColumn("TIPO DE DOCUMENTO", GetType(String)), New DataColumn("ESTADO DE DOCUMENTO", GetType(String)), New DataColumn("TOTAL", GetType(String)), New DataColumn("IDENTIFICADOR", GetType(String)), New DataColumn("SERIE", GetType(String)), New DataColumn("NÚMERO", GetType(String)), New DataColumn("AUTORIZACIÓN", GetType(String)), New DataColumn("NUMERO DE ACCESO", GetType(String))})
        'Read the contents of CSV file.
        Dim csvData As String = File.ReadAllText(csvPath)

        'Execute a loop over the rows.
        For Each row As String In csvData.Split(ControlChars.Lf)
            If Not String.IsNullOrEmpty(row) Then
                dt.Rows.Add() 'Crea una fila vacia en el DT
                Dim i As Integer = 0

                'Execute a loop over the columns.
                For Each cell As String In row.Split(";"c)
                    dt.Rows(dt.Rows.Count - 1)(i) = cell
                    i += 1
                Next
            End If
        Next

        mensaje(dt.Rows.Count)
        'Bind the DataTable.
        'GVCERTIFICADOR.DataSource = dt
        'GVCERTIFICADOR.DataBind()
    End Sub

    Private Sub btnImport_Click(sender As Object, e As EventArgs) Handles btnImport.Click
        ImportCSV()
        'AbrirRecordsetData("EXEC PRG_GESTION_VENTAS 1,'" & TXTNODOCTOCARGA.Text & "','" & DDLEMPRESACARGA.SelectedValue.ToString & "','" & TXTCOMENTARIOCARGA.Text & "',''")
        'If nA(0) = 1 Then
        '    mensaje(nA(2).ToString)
        '    ImportCSV()
        'Else
        '    mensaje(nA(1).ToString)
        'End If
    End Sub

    Public Sub mensaje(ByRef mensaje As String)
        Dim script As String = "alert('" + mensaje + "');"
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, True)
    End Sub
End Class