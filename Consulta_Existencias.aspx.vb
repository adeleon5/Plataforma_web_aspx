Public Class Consulta_Existencias
    Inherits base

    Private Sub Consulta_Existencias_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        DdBind(TXTPRD, "EXEC PRG_CATALOGO_CONSULTAS 1", "PERIODO", "PERIODO")
        DdBind(TXTBOD, "EXEC PRG_CATALOGO_CONSULTAS 2", "INV_BOD_ID", "NOMBRE")
        GridBind(GVREP, "SELECT 'HAGA SU CONSULTA!!'MENSAJE", "", {""})
        TXTEST.Text = ""
    End Sub

    Protected Sub BTNCONSUL_Click(sender As Object, e As EventArgs) Handles BTNCONSUL.Click
        GridBind(GVREP, "EXEC PRG_CATALOGO_CONSULTAS 100,'" & TXTPRD.Text & "','" & TXTBOD.Text & "','" & TXTEST.Text & "'", "", {"CODIGO"})
    End Sub

    Protected Sub TXTEST_TextChanged(sender As Object, e As EventArgs) Handles TXTEST.TextChanged
        BTNCONSUL_Click(BTNCONSUL, e)
    End Sub

    Protected Sub BTNACT_Click(sender As Object, e As EventArgs) Handles BTNACT.Click
        GridBind(GVREP, "EXEC PRG_CATALOGO_CONSULTAS 100,'" & TXTPRD.Text & "','" & TXTBOD.Text & "','" & TXTEST.Text & "'", "", {"CODIGO"})
    End Sub
End Class