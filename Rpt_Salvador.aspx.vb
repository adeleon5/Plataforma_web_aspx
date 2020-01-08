Public Class Rpt_Salvador
    Inherits base

    Private Sub Rpt_Salvador_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        T0.Rows(1).Visible = False
        T0.Rows(2).Visible = False
        T0.Rows(3).Visible = False
        T0.Rows(4).Visible = False
        T0.Rows(5).Visible = False
        T0.Rows(6).Visible = False
        T0.Rows(7).Visible = False
        DdBind(TXTREP, "EXEC PRG_RPT_SALVADOR 1", "CODIGO", "REPORTE")
        DdBind(TXTVDR, "EXEC PRG_RPT_SALVADOR 2", "INV_VND_ID", "NOMBRE")
        DdBind(TXTBOD, "EXEC PRG_RPT_SALVADOR 3", "INV_BOD_ID", "NOMBRE")
        DdBind(TXTPRD, "EXEC PRG_RPT_SALVADOR 4", "PERIODO", "PERIODO")
        DdBind(TXTGNR, "EXEC PRG_RPT_SALVADOR 5", "ID_GENERO", "NOMBRE")
        DdBind(TXTPVR, "EXEC PRG_RPT_SALVADOR 6", "GLB_PRO_ID", "NOMBRE")
        GridBind(GVREP, "SELECT 'Seleccione el reporte y presione ""Ejecutar""'", "", {""})
        TXTREP.SelectedIndex = 0
        TXTREP_SelectedIndexChanged(sender, e)
    End Sub

    Private Sub BTNRUN_Click(sender As Object, e As EventArgs) Handles BTNRUN.Click
        GridBind(GVREP, "EXEC PRG_RPT_SALVADOR " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTVDR.SelectedItem.Value & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTBOD.Text & "','" & TXTPRD.Text & "','" & TXTGNR.Text & "','" & TXTPVR.Text & "'", "", {"Nombres", "Apellidos", "Fecha_Factura"})
    End Sub
    Protected Sub BTNEXPORT_Click(sender As Object, e As ImageClickEventArgs) Handles BTNEXPORT.Click
        If GVREP.Rows.Count > 0 Then
            ExportToExcel(Replace(Replace(TXTREP.SelectedItem.Text, " ", "_", 1), "/", "_", 1) & ".xls", GVREP)
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
        T0.Rows(7).Visible = False
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
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 111 Then
            GridBind(GVDET, "EXEC PRG_RPT_SALVADOR 112,'" & GVREP.SelectedRow.Cells(2).Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "'", "", {""})
            P0.Visible = False
            P1.Visible = True
        End If

    End Sub


    Protected Sub BTNBCK2_Click(sender As Object, e As EventArgs) Handles BTNBCK2.Click
        P1.Visible = False
        P0.Visible = True
        GVREP.SelectedIndex = -1
    End Sub
End Class