Public Class Corporacion
    Inherits base

    Private Sub Corporacion_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
    End Sub

    Public Sub mensaje(ByRef mensaje As String)
        Dim script As String = "alert('" + mensaje + "');"
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, True)
    End Sub

    Private Sub BTNGUARDARCORPORACION_Click(sender As Object, e As EventArgs) Handles BTNGUARDARCORPORACION.Click
        If TXTNOMBRECORP.Text.Length = 0 Then
            mensaje("El campo nombre no puede estar vacío")
        Else
            AbrirRecordsetData("EXEC PRG_ADMINISTRACION_GENERAL 1,'" & TXTNOMBRECORP.Text & "','" & TXTRAZONSOCIALCORP.Text & "','" & TXTNITCORP.Text & "','" & TXTDIRECCIONCORP.Text & "','" & TXTTELEFONOCORP.Text & "','" & TXTREPRESENTANTECORP.Text & "'")
            If nA(0) = 0 Then
                mensaje(nA(1).ToString)
                Exit Sub
            End If
            GVCORPORACION.DataBind()
        End If
    End Sub

    Private Sub BTNCANCELARCORPORACION_Click(sender As Object, e As EventArgs) Handles BTNCANCELARCORPORACION.Click
        Response.Redirect("Inicio.aspx")
    End Sub
End Class