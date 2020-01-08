Public Class Tickets_Estadistica
    Inherits base


    Private Sub Tickets_Estadistica_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        T0.Rows(1).Visible = False
        T0.Rows(2).Visible = False
        T0.Rows(3).Visible = False
        T0.Rows(4).Visible = False
        DdBind(TXTREP, "EXEC PRG_TICKET 31", "CODIGO", "REPORTE")
        DdBind(TXTDEP, "EXEC PRG_TICKET 32", "DEPARTAMENTO", "DEPARTAMENTO")
        GridBind(GVREP, "SELECT 'Seleccione el reporte y los parámetros, y presione ""Ejecutar"" MENSAJE'", "", {""})
        TXTREP.SelectedIndex = 0
        TXTREP_SelectedIndexChanged(sender, e)
    End Sub

    Private Sub BTNRUN_Click(sender As Object, e As EventArgs) Handles BTNRUN.Click
        GridBind(GVREP, "EXEC PRG_TICKET " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & Session("UCO") & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTDEP.SelectedItem.Text & "','" & TXTEST.SelectedItem.Value & "'", "", {""})
    End Sub
    Protected Sub BTNEXPORT_Click(sender As Object, e As ImageClickEventArgs) Handles BTNEXPORT.Click
        If GVREP.Rows.Count > 0 Then
            ExportToExcel("T" & Format("yyyyMMdd", Date.Now()) & "_" & Format("mmss", Date.Now()) & ".xls", GVREP)
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
        Dim nRep As String
        Dim nRow As String()
        nRep = TXTREP.SelectedItem.Value.Substring(0, 3)
        nRow = TXTREP.SelectedItem.Value.Substring(4, Len(TXTREP.SelectedItem.Value) - 4).Split(",")
        For nI = 0 To nRow.Length - 1
            T0.Rows(nRow(nI)).Visible = True
        Next
    End Sub
End Class