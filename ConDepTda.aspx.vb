Public Class ConDepTda
    Inherits base

    Private Sub ConDepTda_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        'T0.Rows(1).Visible = False
        'T0.Rows(2).Visible = False
        'T0.Rows(3).Visible = False
        DdBind(TXTBCO, "EXEC PRG_CONCILIACION 1", "CODIGO", "DESCRIPCION")
        DdBind(TXTMODBAN, "EXEC PRG_CONCILIACION 1", "CODIGO", "DESCRIPCION")
        DdBind(TXTTDA, "EXEC PRG_CONCILIACION 2", "CODIGO", "DESCRIPCION")
        DdBind(TXTTIENDACORTE, "EXEC PRG_CONCILIACION 2", "CODIGO", "DESCRIPCION")
        GridBind(GVREP, "SELECT 'Seleccione el reporte y los parámetros, y presione ""Ejecutar""' MENSAJE", "", {""})
        GridBind(GVREP1, "SELECT 'Seleccione el reporte y los parámetros, y presione ""Ejecutar""' MENSAJE", "", {""})
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
            If IsNumeric(GVREP.Rows(nI).Cells(5).Text) Then
                nA = nA + CType(GVREP.Rows(nI).Cells(5).Text, Double)
                If GVREP.Rows(nI).Cells(6).Text = "1" Then
                    nB = nB + CType(GVREP.Rows(nI).Cells(5).Text, Double)
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

    Private Sub CalculaTotalesVISA()
        '20140507WM BARRE LA GRIDA Y MUESTRA EL TOTAL GENERAL, TOTAL CONCILIADO Y DIFERENCIA EN EL LITERAL LTOTS

        Dim nA As Double
        Dim nB As Double
        Dim nI As Integer
        nA = 0
        nB = 0
        For nI = 0 To GVREP.Rows.Count - 1
            If IsNumeric(GVREP.Rows(nI).Cells(3).Text) Then
                nA = nA + CType(GVREP.Rows(nI).Cells(3).Text, Double)
                If GVREP.Rows(nI).Cells(4).Text = "1" Then
                    nB = nB + CType(GVREP.Rows(nI).Cells(3).Text, Double)
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
        LBLERR3.Text = ""
        If TXTBCO.SelectedItem.Value = "00111" Then
            GridBind(GVREP, "EXEC PRG_CONCILIACION 9,'" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTTDA.SelectedItem.Value & "','" & TXTBCO.SelectedItem.Value & "'", "", {""})
            If GVREP.Rows(0).Cells.Count >= 5 Then
                CalculaTotalesVISA()
            End If
        Else
            LBLERR3.Text = ""
            GridBind(GVREP, "EXEC PRG_CONCILIACION 4,'" & TXTBCO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTBCO.SelectedItem.Text & "'", "", {"CODIGO"})
            If GVREP.Rows(0).Cells.Count >= 6 Then
                CalculaTotales()
            End If
        End If

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
        If TXTBCO.SelectedItem.Value = "00111" Then
            If HFPER.Value = "Concilia" Then
                AbrirRecordsetData("EXEC PRG_CONCILIACION 10,'" & GVREP.SelectedRow.Cells(0).Text & "','" & GVREP.SelectedRow.Cells(2).Text & "'")
                If nA(0) = 0 Then
                    LBLERR3.Text = nA(1)
                    Exit Sub
                Else
                    GridBind(GVREP, "EXEC PRG_CONCILIACION 9,'" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTTDA.SelectedItem.Value & "','" & TXTBCO.SelectedItem.Value & "'", "", {""})
                End If
                CalculaTotalesVISA()
            ElseIf HFPER.Value = "Modifica" Then
                Exit Sub
            End If
        Else
            If HFPER.Value = "Concilia" Then
                AbrirRecordsetData("EXEC PRG_CONCILIACION 5,'" & GVREP.SelectedRow.Cells(0).Text & "','" & GVREP.SelectedRow.Cells(4).Text & "','" & GVREP.SelectedRow.Cells(5).Text & "','" & Session("UCO") & "'")
                If nA(0) = 0 Then
                    LBLERR2.Text = nA(1)
                    Exit Sub
                Else
                    GridBind(GVREP, "EXEC PRG_CONCILIACION 4,'" & TXTBCO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDEL.Text & "','" & TXTAL.Text & "'", "", {"CODIGO"})

                End If
                'If GVREP.SelectedRow.Cells(5).Text = "1" Then
                '    GVREP.SelectedRow.Cells(5).Text = ""
                'Else
                '    GVREP.SelectedRow.Cells(5).Text = "1"
                'End If
                CalculaTotales()
            ElseIf HFPER.Value = "Modifica" Then
                'Mostrar pantalla de Modificación
                'P0.Visible = False
                'P1.Visible = True
                'LMOD.Text = "<h1>Modificación de Documento Banco</h1><br />BANCO:" & TXTBCO.SelectedItem.Text & "<br />" _
                '    & "FECHA: " & GVREP.SelectedRow.Cells(1).Text & "<br />"
                'TXTMODBAN.SelectedIndex = TXTBCO.SelectedIndex
                'TXTMODBOL.Text = GVREP.SelectedRow.Cells(4).Text
                'TXTMODMON.Text = GVREP.SelectedRow.Cells(5).Text
                'TXTMODRAZ.Text = ""
                Exit Sub
            End If
            GVREP.SelectedIndex = -1
        End If
    End Sub

    Private Sub BTNCANC_Click(sender As Object, e As EventArgs) Handles BTNCANC.Click
        P1.Visible = False
        P0.Visible = True
        CalculaTotales()
    End Sub

    Private Sub BTNCHNG_Click(sender As Object, e As EventArgs) Handles BTNCHNG.Click
        'SE PIDIÓ MODIFICAR EL DOCUMENTO
        LBLERR01.Text = ""
        AbrirRecordsetData("EXEC PRG_CONCILIACION 6,'" & GVREP.SelectedRow.Cells(0).Text & "','" & TXTMODBAN.SelectedItem.Value & "','" & TXTMODBOL.Text & "','" & TXTMODMON.Text & "','" & Format(Session("UCO"), "00000") & TXTMODRAZ.Text & "'")
        If nA(0) = 0 Then
            LBLERR01.Text = nA(1)
            Exit Sub
        End If
        P1.Visible = False
        P0.Visible = True
        GridBind(GVREP, "EXEC PRG_CONCILIACION 4,'" & TXTBCO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDEL.Text & "','" & TXTAL.Text & "'", "", {"CODIGO"})
        CalculaTotales()
    End Sub

    Protected Sub BTNCERRAR_Click(sender As Object, e As EventArgs) Handles BTNCERRAR.Click
        If TXTBCO.SelectedItem.Value = "00111" Then
            AbrirRecordsetData("EXEC PRG_CONCILIACION 8,'" & Session("UCO") & "','" & TXTBCO.SelectedItem.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "'")
            If nA(0) = 0 Then
                LBLERR3.Text = nA(1)
                Exit Sub
            End If
        Else
            LBLERR3.Text = ""
            AbrirRecordsetData("EXEC PRG_CONCILIACION 7,'" & TXTDEL.Text & "','" & TXTAL.Text & "','" & Session("UCO") & "','" & TXTBCO.SelectedItem.Text & "'")
            If nA(0) = 0 Then
                LBLERR3.Text = nA(1)
                Exit Sub
            Else
                AbrirRecordsetData("EXEC PRG_CONCILIACION 8,'" & Session("UCO") & "','" & TXTBCO.SelectedItem.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "'")
                If nA(0) = 0 Then
                    LBLERR3.Text = nA(1)
                    Exit Sub
                End If
            End If
        End If
    End Sub

    Protected Sub TXTBCO_SelectedIndexChanged(sender As Object, e As EventArgs) Handles TXTBCO.SelectedIndexChanged
        LBLERR3.Text = ""
    End Sub

    Protected Sub BTNCONSCORTE_Click(sender As Object, e As EventArgs) Handles BTNCONSCORTE.Click
        P0.Visible = False
        P1.Visible = False
        P2.Visible = True
        GVREP1.Visible = True
    End Sub

    Protected Sub BTNREG_Click(sender As Object, e As EventArgs) Handles BTNREG.Click
        P0.Visible = True
        P1.Visible = False
        P2.Visible = False
        GVREP1.Visible = False
    End Sub

    Protected Sub BTNRUN1_Click(sender As Object, e As EventArgs) Handles BTNRUN1.Click
        GridBind(GVREP1, "EXEC PRG_CONCILIACION 17,'" & TXTDEL1.Text & "','" & TXTAL1.Text & "','" & TXTTIENDACORTE.SelectedItem.Value & "'", "", {""})
    End Sub
  
End Class