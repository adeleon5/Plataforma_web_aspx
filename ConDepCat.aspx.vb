Public Class ConDepCat
    Inherits base


    Private Sub ConDepCat_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        'T0.Rows(1).Visible = False
        'T0.Rows(2).Visible = False
        'T0.Rows(3).Visible = False
        DdBind(TXTBCO, "EXEC PRG_CONCILIACION 11", "CODIGO", "DESCRIPCION")
        DdBind(TXTMODBAN, "EXEC PRG_CONCILIACION 11", "CODIGO", "DESCRIPCION")
        DdBind(TXTTDA, "EXEC PRG_CONCILIACION 12", "CODIGO", "DESCRIPCION")
        GridBind(GVREP, "SELECT 'Seleccione el reporte y los parámetros, y presione ""Ejecutar""' MENSAJE", "", {""})
        AbrirRecordsetData("EXEC SEGURIDAD 4001,'" & Session("UCO") & "','Concilia_Modifica'")
        If nA(0) = 0 Then
            HFPER.Value = ""
        Else
            HFPER.Value = nA(1)
        End If
        TXTBCO.SelectedIndex = 0
    End Sub

    Private Sub CalculaTotales()
        '20140507WM BARRE LA GRIDA Y MUESTRA EL TOTAL GENERAL, TOTAL CONCILIADO Y DIFERENCIA EN EL LITERAL LTOTS

        Dim nA As Double
        Dim nB As Double
        Dim nI As Integer
        nA = 0
        nB = 0
        For nI = 0 To GVREP.Rows.Count - 1
            If IsNumeric(GVREP.Rows(nI).Cells(4).Text) Then
                nA = nA + CType(GVREP.Rows(nI).Cells(4).Text, Double)
                If GVREP.Rows(nI).Cells(5).Text = "1" Then
                    nB = nB + CType(GVREP.Rows(nI).Cells(4).Text, Double)
                End If
            End If
        Next
        If nA > 0 Then
            LDEPS.Text = "<table style=""width:50%; border:1px solid blue;""><caption>Resumen</caption><tr><td>Total Monto</td><td style=""text-align:right;"">" & Format(nA, "#,###,###,##0.00") & "</td></tr> " _
                & "<tr><td>Conciliado</td><td style=""text-align:right;"">" & Format(nB, "#,###,###,##0.00") & "</td></tr>" _
                & "<tr><td>Diferencia</td><td style=""text-align:right;"">" & Format(nA - nB, "#,###,###,##0.00") & "</td></tr></table>"
        Else
            LDEPS.Text = ""
        End If
    End Sub

    Private Sub BTNRUN_Click(sender As Object, e As EventArgs) Handles BTNRUN.Click
        GridBind(GVREP, "EXEC PRG_CONCILIACION 14,'" & TXTBCO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDEL.Text & "','" & TXTAL.Text & "'", "", {"CODIGO"})
        CalculaTotales()
    End Sub

    Protected Sub BTNEXPORT_Click(sender As Object, e As ImageClickEventArgs) Handles BTNEXPORT.Click
        If GVREP.Rows.Count > 0 Then
            ExportToExcel("Q" & Format("yyyyMMdd", Date.Now()) & "_" & Format("mmss", Date.Now()) & ".xls", GVREP)
        End If
    End Sub

    Private Sub ExportToExcel(ByVal strFileName As String, ByVal dg As GridView)
        Response.Clear()
        Response.AddHeader("content-disposition", "attachment;filename=" & strFileName)
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Dim oStringWriter As New System.IO.StringWriter
        Dim oHtmlTextWriter As New System.Web.UI.HtmlTextWriter(oStringWriter)
        dg.RenderControl(oHtmlTextWriter)
        Response.Write(oStringWriter.ToString())
        Response.End()
    End Sub

    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        'MyBase.VerifyRenderingInServerForm(control)
    End Sub

    Private Sub GVREP_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVREP.SelectedIndexChanged
        If GVREP.SelectedRow.Cells(0).Text.Length = 0 Then
            Exit Sub
        End If
        'WM20140519 SI EL USUARIO ES CONCILIADOR O CORRECTOR
        If HFPER.Value = "Concilia" Then
            AbrirRecordsetData("EXEC PRG_CONCILIACION 15,'" & Session("UCO") & "','" & GVREP.SelectedRow.Cells(0).Text & "'")
            If GVREP.SelectedRow.Cells(5).Text = "1" Then
                GVREP.SelectedRow.Cells(5).Text = ""
            Else
                GVREP.SelectedRow.Cells(5).Text = "1"
            End If
            CalculaTotales()
        ElseIf HFPER.Value = "Modifica" Then
            'Mostrar pantalla de Modificación
            P0.Visible = False
            P1.Visible = True
            LMOD.Text = "<h1>Modificación de Documento Banco</h1><br />BANCO:" & TXTBCO.SelectedItem.Text & "<br />" _
                & "FECHA: " & GVREP.SelectedRow.Cells(1).Text & "<br />"
            TXTMODBAN.SelectedIndex = TXTBCO.SelectedIndex
            TXTMODBOL.Text = GVREP.SelectedRow.Cells(3).Text
            TXTMODMON.Text = GVREP.SelectedRow.Cells(4).Text
            TXTMODRAZ.Text = ""
            Exit Sub
        End If

        'AbrirRecordsetData("EXEC PRG_CONCILIACION 15,'" & Session("UCO") & "','" & GVREP.SelectedRow.Cells(0).Text & "'")
        'If GVREP.SelectedRow.Cells(5).Text = "1" Then
        ' GVREP.SelectedRow.Cells(5).Text = ""
        'Mostrar pantalla de Modificación
        'P0.Visible = False
        'P1.Visible = True
        'LMOD.Text = "<h1>Modificación de Documento Banco</h1><br />BANCO:" & TXTBCO.SelectedItem.Text & "<br />" _
        '    & "FECHA: " & GVREP.SelectedRow.Cells(1).Text & "<br />"
        'TXTMODBAN.SelectedIndex = TXTBCO.SelectedIndex
        'TXTMODBOL.Text = GVREP.SelectedRow.Cells(3).Text
        'TXTMODMON.Text = GVREP.SelectedRow.Cells(4).Text
        'TXTMODRAZ.Text = ""
        'Exit Sub
        'Else
        'GVREP.SelectedRow.Cells(5).Text = "1"
        'End If
        'CalculaTotales()
        GVREP.SelectedIndex = -1
    End Sub

    Private Sub BTNCANC_Click(sender As Object, e As EventArgs) Handles BTNCANC.Click
        P1.Visible = False
        P0.Visible = True
        CalculaTotales()
    End Sub

    Private Sub BTNCHNG_Click(sender As Object, e As EventArgs) Handles BTNCHNG.Click
        'SE PIDIÓ MODIFICAR EL DOCUMENTO
        LBLERR01.Text = ""
        AbrirRecordsetData("EXEC PRG_CONCILIACION 16,'" & GVREP.SelectedRow.Cells(0).Text & "','" & TXTMODBAN.SelectedItem.Value & "','" & TXTMODBOL.Text & "','" & TXTMODMON.Text & "','" & Format(Session("UCO"), "00000") & TXTMODRAZ.Text & "'")
        If nA(0) = 0 Then
            LBLERR01.Text = nA(1)
            Exit Sub
        End If
        P1.Visible = False
        P0.Visible = True
        GridBind(GVREP, "EXEC PRG_CONCILIACION 14,'" & TXTBCO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDEL.Text & "','" & TXTAL.Text & "'", "", {"CODIGO"})
        CalculaTotales()
    End Sub
End Class