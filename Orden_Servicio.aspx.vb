Public Class REP_PLANTA
    Inherits base
    Private Sub REP_PLANTA_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        GridBind(GVREP, "EXEC PRG_SAP_SERVICIOS 1, '" & Session.Item("CODEMPSAP") & "'", "", {"Horometro", "DP", "DT", "SE", "NS", "Tllegada", "Tsalida", "Sinicio", "Sfinal"})
    End Sub

    Private Sub BTNGO_Click(sender As Object, e As EventArgs) Handles BTNGO.Click
        'GridBind(GVREP, "EXEC PRG_REP_PLANTA " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTPRD.Text & "', '" & TXTFDEL.Text & "','" & TXTFAL.Text & "','" & TXTTIPO.Text & "'", "", {""})
        GridBind(GVREP, "EXEC PRG_SAP_SERVICIOS 3, '" & Session.Item("CODEMPSAP") & "', '" & TXTFDEL.Text & "', '" & TXTFAL.Text & "'", "", {"Horometro", "DP", "DT", "SE", "NS", "Tllegada", "Tsalida", "Sinicio", "Sfinal"})
    End Sub

    Protected Sub BTNEXPORT_Click(sender As Object, e As ImageClickEventArgs) Handles BTNEXPORT.Click
        If GVREP.Rows.Count > 0 Then
            ExportToExcel(Replace(Replace("Lista_de_hojas_servicio", " ", "_", 1), "/", "_", 1) & ".xls", GVREP)
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
        If CInt(GVREP.SelectedRow.Cells(0).Text) <= 0 Then
            P1.Visible = False
            GVREP.SelectedIndex = -1
            Limpiar_formulario_tecnico()
        Else
            P0.Visible = "False"
            P1.Visible = "True"
            HS01.Value = GVREP.SelectedRow.Cells(0).Text
            L01.Text = "Correlativo SAP: " + GVREP.SelectedRow.Cells(0).Text + "<br/> Cliente: " + GVREP.SelectedRow.Cells(3).Text + "<br/> Servicio: " + GVREP.SelectedRow.Cells(2).Text + "<br/> Modelo de equipo: " + GVREP.SelectedRow.Cells(4).Text + "<br/> Serie: " + GVREP.SelectedRow.Cells(5).Text + "<br/>"
            TXTHORO.Text = GVREP.SelectedRow.Cells(7).Text
            TXTDP.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(8).Text)
            TXTDT.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(9).Text)
            TXTSE.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(10).Text)
            TXTNS.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(11).Text)
            TXTTSALIDA.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(12).Text)
            TXTTLLEGADA.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(13).Text)
            TXTSINICIO.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(14).Text)
            TXTSFINAL.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(15).Text)
        End If
    End Sub

    Private Sub BTNCANHS_Click(sender As Object, e As EventArgs) Handles BTNCANHS.Click
        GridBind(GVREP, "EXEC PRG_SAP_SERVICIOS 1, '" & Session.Item("CODEMPSAP") & "'", "", {"Horometro", "DP", "DT", "SE", "NS", "Tllegada", "Tsalida", "Sinicio", "Sfinal"})
        GVREP.SelectedIndex = -1
        HS01.Value = "0"
        P0.Visible = True
        P1.Visible = False
        Limpiar_formulario_tecnico()
    End Sub

    Private Sub BTNADDHS_Click(sender As Object, e As EventArgs) Handles BTNADDHS.Click
        If TXTHORO.Text.Length = 0 Then
            Exit Sub
        Else
            AbrirRecordsetData("EXEC PRG_SAP_SERVICIOS 2,'" & Session.Item("UCO") & "','" & HS01.Value.ToString() & "','" & TXTHORO.Text & "','" & TXTDP.Text & "','" & TXTDT.Text & "','" & TXTSE.Text & "','" & TXTNS.Text & "','" & Replace(TXTTSALIDA.Text, ":", "") & "','" & Replace(TXTTLLEGADA.Text, ":", "") & "','" & Replace(TXTSINICIO.Text, ":", "") & "','" & Replace(TXTSFINAL.Text, ":", "") & "'")
        End If
        GridBind(GVREP, "EXEC PRG_SAP_SERVICIOS 1, '" & Session.Item("CODEMPSAP") & "'", "", {"Horometro", "DP", "DT", "SE", "NS", "Tllegada", "Tsalida", "Sinicio", "Sfinal"})
        HS01.Value = "0"
        P1.Visible = False
        Limpiar_formulario_tecnico()
        GVREP.SelectedIndex = -1
        P0.Visible = True
    End Sub

    Private Sub Limpiar_formulario_tecnico()
        TXTHORO.Text = ""
        TXTDP.Text = ""
        TXTDT.Text = ""
        TXTSE.Text = ""
        TXTNS.Text = ""
        TXTTSALIDA.Text = ""
        TXTTLLEGADA.Text = ""
        TXTSINICIO.Text = ""
        TXTSFINAL.Text = ""
    End Sub

    Protected Sub BTNFIRMA_Click(sender As Object, e As EventArgs) Handles BTNFIRMA.Click
        Response.Redirect("Firma_Orden_Servicio.aspx?Valor=" + HS01.Value)
    End Sub

    Private Sub GVREP_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVREP.PageIndexChanging
        GVREP.PageIndex = e.NewPageIndex
        GridBind(GVREP, "EXEC PRG_SAP_SERVICIOS 1, '" & Session.Item("CODEMPSAP") & "'", "", {"Horometro", "DP", "DT", "SE", "NS", "Tllegada", "Tsalida", "Sinicio", "Sfinal"})
    End Sub

End Class