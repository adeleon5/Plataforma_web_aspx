Public Class Ayuda
    Inherits base

    Private Sub Ayuda_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        GridBind(GVREP, "EXEC PRG_AYUDA 1,''", "", {"CODIGO", "VIDEO"})
    End Sub
    Private Sub BTNRUN_Click(sender As Object, e As EventArgs) Handles BTNRUN.Click
        GridBind(GVREP, "EXEC PRG_AYUDA 1,'" & TXTBUS.Text & "'", "", {"CODIGO", "VIDEO"})
        LIT01.Text = ""
    End Sub

    Private Sub GVREP_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVREP.SelectedIndexChanged
        If GVREP.SelectedRow.Cells(2).Text.Length > 0 Then
            LIT01.Text = "<video controls src=""" & GVREP.SelectedRow.Cells(2).Text & """ type = ""video/mp4""> SU NAVEGADOR NO SOPORTA VIDEOS </video>" & GVREP.SelectedRow.Cells(2).Text
        End If
    End Sub
End Class
