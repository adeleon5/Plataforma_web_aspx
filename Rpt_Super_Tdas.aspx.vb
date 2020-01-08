Public Class Rpt_Super_Tdas
    Inherits base

    Private Sub Rpt_Super_Tdas_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        AbrirRecordsetData("EXEC PRG_RPT_SUPERTDS 5,'" & Session("UCO") & "'")
        If nA(0) = 0 Then
            Notifica(nA(1), "Menu.aspx")
            Exit Sub
        End If
        T0.Rows(1).Visible = False
        T0.Rows(2).Visible = False
        T0.Rows(3).Visible = False
        T0.Rows(4).Visible = False
        T0.Rows(5).Visible = False
        DdBind(TXTREP, "EXEC PRG_RPT_SUPERTDS 1", "CODIGO", "REPORTE")
        DdBind(TXTSPVS, "EXEC PRG_RPT_SUPERTDS 2," & Session("UCO") & "", "CODIGO", "NOMBRE")
        DdBind(TXTPRD, "EXEC PRG_RPT_SUPERTDS 3", "PERIODO", "PERIODO")
        DdBind(TXTBOD, "EXEC PRG_RPT_SUPERTDS 4," & Session("UCO") & "", "INV_BOD_ID", "NOMBRE")
        GridBind(GVREP, "SELECT 'Seleccione el reporte y sus parametros luego presione ""Ejecutar""'", "", {""})
        TXTREP.SelectedIndex = 0
        TXTREP_SelectedIndexChanged(sender, e)
    End Sub

    Protected Sub BTNRUN_Click(sender As Object, e As EventArgs) Handles BTNRUN.Click
        GridBind(GVREP, "EXEC PRG_RPT_SUPERTDS " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTSPVS.SelectedItem.Value & "','" & TXTPRD.Text & "','" & TXTBOD.Text & "','" & Session("UCO") & "'", "", {"CODIGO", "COD"})
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
        Dim nRep As String
        Dim nRow As String()
        nRep = TXTREP.SelectedItem.Value.Substring(0, 3)
        nRow = TXTREP.SelectedItem.Value.Substring(4, Len(TXTREP.SelectedItem.Value) - 4).Split(",")
        For nI = 0 To nRow.Length - 1
            T0.Rows(nRow(nI)).Visible = True
        Next
    End Sub

    Private Sub GVREP_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles GVREP.RowCreated

    End Sub

    Protected Sub GVREP_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVREP.SelectedIndexChanged
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 103 Then
            'If GVREP.SelectedRow.Cells(0).Text.Length = 0 Then
            '    Exit Sub
            'End If
            P0.Visible = False
            P1.Visible = True
            TXTTND.Text = GVREP.SelectedRow.Cells(0).Text
            TXTCOD.Text = GVREP.SelectedRow.Cells(1).Text
            TXTVND.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(2).Text)
            TXTFCH.Text = GVREP.SelectedRow.Cells(3).Text
            TXTRETRASO.Text = GVREP.SelectedRow.Cells(6).Text
            TXTJUS.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(7).Text)
            GVREP.SelectedIndex = -1
        Else
            Exit Sub
        End If
    End Sub

    Protected Sub BTNGRD_Click(sender As Object, e As EventArgs) Handles BTNGRD.Click
        LBLERR.Text = ""
        AbrirRecordsetData("EXEC PRG_RPT_SUPERTDS 105,'" & TXTCOD.Text & "','" & TXTFCH.Text & "','" & TXTRETRASO.Text & "','" & TXTJUS.Text & "','" & Session("UCO") & "'")
        If nA(0) = 0 Then
            LBLERR.Text = nA(1)
        Else
            LBLERR.Text = ""
            GridBind(GVREP, "EXEC PRG_RPT_SUPERTDS " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTSPVS.SelectedItem.Value & "','" & TXTPRD.Text & "','" & TXTBOD.Text & "','" & Session("UCO") & "'", "", {"CODIGO"})
            P0.Visible = True
            P1.Visible = False
        End If
    End Sub

    Protected Sub BTNBACK_Click(sender As Object, e As EventArgs) Handles BTNBACK.Click
        P0.Visible = True
        P1.Visible = False
    End Sub

End Class