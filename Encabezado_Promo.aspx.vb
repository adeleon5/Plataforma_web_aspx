Public Class Encabezado_Promo
    Inherits base

    Private Sub Encabezado_Promo_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        TXTEMPRESA.Text = "400"
    End Sub
   
    Protected Sub BTNRUN_Click(sender As Object, e As EventArgs) Handles BTNRUN.Click
        Dim ASOC As String
        ASOC = ""
        GridBind(GVREP, "EXEC PRG_REP_PLANTA 116,'" & TXTEMPRESA.Text & "','" & TXTPROMOINI.Text & "','" & TXTPROMOFIN.Text & "','" & TXTDESCRIP.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTTIPO.Text & "','" & TXTDESC.Text & "','" & ASOC & "'", "", {""})
    End Sub

End Class