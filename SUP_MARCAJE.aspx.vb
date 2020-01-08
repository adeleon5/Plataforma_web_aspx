Public Class SUP_MARCAJE
    Inherits base


    Private Sub SUP_MARCAJE_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        AbrirRecordsetData("EXEC PRG_MARCAJESUP 3,'" & Session("UCO") & "'")
        If nA(0) = 0 Then
            Notifica(nA(1), "Menu.aspx")
            Exit Sub
        End If
        DdBind(TXTTDA, "PRG_MARCAJESUP 1,'" & Session("UCO") & "'", "CODIGO", "DESCRIPCION")
        DdBind(TXTVND, "PRG_MARCAJESUP 2,'" & Session("UCO") & "'", "CODIGO", "NOMBRE")
        TXTCOD.Text = ""
        LBLERR.Text = ""
    End Sub

    Private Sub BTNENVIAR_Click(sender As Object, e As EventArgs) Handles BTNENVIAR.Click
        LBLERR.Text = ""
        AbrirRecordsetData("PRG_MARCAJESUP 10,'" & Session("UCO") & "','" & TXTTDA.SelectedValue.ToString & "','" _
                           & IIf(TXTCOD.Text.Length > 0, TXTCOD.Text, TXTVND.SelectedValue) & "','" & TXTJUS.Text & "'")
        If nA(0) = 0 Then
            LBLERR.Text = nA(1)
            Exit Sub
        End If
        Notifica("Marcaje realizado exitosamente", "SUP_MARCAJE.aspx")
    End Sub
End Class