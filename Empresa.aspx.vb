Public Class Empresa
    Inherits base

    Private Sub Empresa_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        DdBind(DDLCORPORACION, "EXEC PRG_ADMINISTRACION_GENERAL 3", "CODIGO", "DESCRIPCION")
    End Sub

    Public Sub mensaje(ByRef mensaje As String)
        Dim script As String = "alert('" + mensaje + "');"
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, True)
    End Sub

    Private Sub BTNGUARDAREMPRESA_Click(sender As Object, e As EventArgs) Handles BTNGUARDAREMPRESA.Click
        If TXTNOMBREEMP.Text.Length = 0 Then
            mensaje("El campo nombre no puede estar vacío")
        Else
            AbrirRecordsetData("EXEC PRG_ADMINISTRACION_GENERAL 2,'" & TXTNOMBREEMP.Text & "','" & TXTRAZONSOCIALEMP.Text & "','" & TXTNITEMP.Text & "','" & TXTDIRECCIONEMP.Text & "','" & TXTTELEFONOEMP.Text & "','" & TXTREPRESENTANTEEMP.Text & "','" & TXTPAGINAWEBEMP.Text & "','" & TXTCORREOEMP.Text & "','" & DDLCORPORACION.SelectedItem.Value.ToString & "'")
            If nA(0) = 0 Then
                mensaje(nA(1).ToString)
                Exit Sub
            End If
            GVEMPRESAS.DataBind()
        End If
    End Sub

    Private Sub BTNCANCELAREMPRESA_Click(sender As Object, e As EventArgs) Handles BTNCANCELAREMPRESA.Click
        Response.Redirect("Inicio.aspx")
    End Sub
End Class