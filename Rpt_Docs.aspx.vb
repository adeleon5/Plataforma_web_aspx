Public Class Rpt_Docs
    Inherits base


    Private Sub Rpt_Docs_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        T0.Rows(1).Visible = False
        T0.Rows(2).Visible = False
        T0.Rows(3).Visible = False
        T0.Rows(4).Visible = False
        T0.Rows(5).Visible = False
        T0.Rows(6).Visible = False
        DdBind(TXTREP, "EXEC PRG_REP_CONTA 1", "CODIGO", "REPORTE")
        DdBind(TXTTDA, "EXEC PRG_REP_CONTA 2", "CODIGO", "TIENDA")
        DdBind(TXTTDOC, "EXEC PRG_REP_CONTA 3", "CODIGO", "DESCRIPCION")
        DdBind(TXTPRD, "EXEC PRG_REP_CONTA 4", "PERIODO", "PERIODO")
        GridBind(GVREP, "SELECT 0 CODIGO,'Seleccione el reporte y los parámetros, y presione ""Ejecutar""'", "", {"CODIGO"})
        TXTREP.SelectedIndex = 0
        TXTREP_SelectedIndexChanged(sender, e)
    End Sub
    Private Sub BTNRUN_Click(sender As Object, e As EventArgs) Handles BTNRUN.Click
        GridBind(GVREP, "EXEC PRG_REP_CONTA " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & Session("UCO") & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTTDOC.Text & "','" & TXTNUMDOC.Text & "','" & TXTPRD.Text & "'", "", {"CODIGO"})
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

    Private Sub TXTREP_SelectedIndexChanged(sender As Object, e As EventArgs) Handles TXTREP.SelectedIndexChanged
        If TXTREP.SelectedIndex = -1 Then
            Exit Sub
        End If
        T0.Rows(1).Visible = False
        T0.Rows(2).Visible = False
        T0.Rows(3).Visible = False
        T0.Rows(4).Visible = False
        T0.Rows(5).Visible = False
        T0.Rows(6).Visible = False
        Dim nRep As String
        Dim nRow As String()
        nRep = TXTREP.SelectedItem.Value.Substring(0, 3)
        nRow = TXTREP.SelectedItem.Value.Substring(4, Len(TXTREP.SelectedItem.Value) - 4).Split(",")
        For nI = 0 To nRow.Length - 1
            T0.Rows(nRow(nI)).Visible = True
        Next
    End Sub

    Private Sub BTNBCK01_Click(sender As Object, e As EventArgs) Handles BTNBCK01.Click
        P1.Visible = False
        P0.Visible = True
        GVREP.SelectedIndex = -1
    End Sub

    Private Sub GVREP_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVREP.SelectedIndexChanged
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 108 Then
            GridBind(GVDET, "EXEC PRG_REP_CONTA 201,'" & GVREP.SelectedRow.Cells(0).Text & "'", "", {""})
            LDET.Text = "<p style=""text-align:center;font-size:large; font-weigh:bold;"">Tienda:" & TXTTDA.SelectedItem.Text & "<br />" _
                & "TIPO DOCUMENTO: " & TXTTDOC.SelectedItem.Text & "</br>NUMERO DOCUMENTO: " & GVREP.SelectedRow.Cells(3).Text & "<br />" _
                & "FECHA: " & GVREP.SelectedRow.Cells(2).Text & "<br /> ESTADO: " & GVREP.SelectedRow.Cells(5).Text & "</p>"
            P0.Visible = False
            P1.Visible = True
        End If
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 109 Then
            If Val(GVREP.SelectedRow.Cells(1).Text) > 0 Then
                GridBind(GVDET1, "EXEC PRG_REP_CONTA 110,'" & TXTPRD.SelectedItem.Value & "','" & GVREP.SelectedRow.Cells(0).Text & "'", "", {""})
                LDET.Text = "<p style=""text-align:center;font-size:large; font-weigh:bold;"">Tienda:" & GVREP.SelectedRow.Cells(0).Text & "<br />" _
                    & "TIPO DOCUMENTO: FACTURAS (ELECTRONICAS Y MANUALES) <br />"
                P0.Visible = False
                P2.Visible = True
            End If
            If Val(GVREP.SelectedRow.Cells(2).Text) > 0 Then
                GridBind(GVDET1, "EXEC PRG_REP_CONTA 111,'" & TXTPRD.SelectedItem.Value & "','" & GVREP.SelectedRow.Cells(0).Text & "'", "", {""})
                LDET.Text = "<p style=""text-align:center;font-size:large; font-weigh:bold;"">Tienda:" & GVREP.SelectedRow.Cells(0).Text & "<br />" _
                    & "TIPO DOCUMENTO: FACTURAS (ELECTRONICAS Y MANUALES) <br />"
                P0.Visible = False
                P2.Visible = True
            End If
        End If
    End Sub

    Private Sub BTNEXP2_Click(sender As Object, e As ImageClickEventArgs) Handles BTNEXP2.Click
        If GVDET.Rows.Count > 0 Then
            ExportToExcel("DET" & Format("yyyyMMdd", Date.Now()) & "_" & Format("mmss", Date.Now()) & ".xls", GVDET)
        End If
    End Sub

    Protected Sub BTNBACK_Click(sender As Object, e As EventArgs) Handles BTNBACK.Click
        P2.Visible = False
        P0.Visible = True
        GVREP.SelectedIndex = -1
    End Sub
End Class