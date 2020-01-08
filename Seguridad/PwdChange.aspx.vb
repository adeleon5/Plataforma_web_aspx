Public Class PwdChange
    Inherits base


    Private Sub PwdChange_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
    End Sub

    Private Sub BTNSAVE_Click(sender As Object, e As EventArgs) Handles BTNSAVE.Click
        LBLERR.Text = ""
        AbrirRecordsetData("EXEC SEGURIDAD 2,'ADMINISTRADOR','" & TXTOLDPWD.Text & "','" & TXTNEWPWD.Text & "','" & TXTNEWPW2.Text & "','" & Session("EML") & "'")
        If nA(0) = 0 Then
            LBLERR.Text = nA(1)
            Exit Sub
        End If
        Notifica("Contraseña modificada exitosamente", "Login.aspx")
    End Sub

    Protected Sub BTNCANC_Click(sender As Object, e As EventArgs) Handles BTNCANC.Click
        Response.Redirect("Menu.aspx")
    End Sub
End Class