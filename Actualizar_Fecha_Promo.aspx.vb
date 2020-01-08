Public Class Actualizar_Fecha_Promo
    Inherits base

    Private Sub Actualizar_Fecha_Promo_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
    End Sub

    Protected Sub BTNRUN_Click(sender As Object, e As EventArgs) Handles BTNRUN.Click
        GridBind(GVREP, "SELECT ID_PROMOCION ID,DESCRIPCION,CAST(FECHAINI AS DATE) INICIA,CAST(FECHAFIN AS DATE) FINALIZA,TIPO,DESCUENTO,CODIGO_ASOCIADO ASOCIADO FROM EASYDATA..INV_ENCPROMO WHERE ID_PROMOCION BETWEEN '" & TXTDEL.Text & "' AND '" & TXTAL.Text & "'", "", {"ACTIVO"})
    End Sub

    Protected Sub GVREP_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVREP.SelectedIndexChanged
        If GVREP.SelectedRow.Cells(0).Text.Length = 0 Then
            Exit Sub
        End If
        P0.Visible = False
        P1.Visible = True
        TXTPROMO.Text = GVREP.SelectedRow.Cells(0).Text
        TXTDESCRIP.Text = GVREP.SelectedRow.Cells(1).Text
        TXTINICIO.Text = Format(CDate(GVREP.SelectedRow.Cells(2).Text), "yyyy/MM/dd hh:mm:ss")
        TXTFINAL.Text = Format(CDate(GVREP.SelectedRow.Cells(3).Text), "yyyy/MM/dd hh:mm:ss")
        TXTTIPO.Text = GVREP.SelectedRow.Cells(4).Text
        TXTDESCUENTO.Text = GVREP.SelectedRow.Cells(5).Text
        TXTASOC.Text = CStr(GVREP.SelectedRow.Cells(6).Text)
        GVREP.SelectedIndex = -1
    End Sub

    Protected Sub BTNBACK_Click(sender As Object, e As EventArgs) Handles BTNBACK.Click
        P0.Visible = True
        P1.Visible = False
    End Sub

    Protected Sub BTNGRD_Click(sender As Object, e As EventArgs) Handles BTNGRD.Click
        LBLERR.Text = ""
        RecordsetData("UPDATE EASYDATA..INV_ENCPROMO SET DESCRIPCION='" & TXTDESCRIP.Text & "',FECHAINI ='" & TXTINICIO.Text & "',FECHAFIN='" & TXTFINAL.Text & "',TIPO='" & TXTTIPO.Text & "',DESCUENTO='" & TXTDESCUENTO.Text & "',CODIGO_ASOCIADO='" & TXTASOC.Text & "' WHERE ID_PROMOCION='" & TXTPROMO.Text & "'")
        GridBind(GVREP, "SELECT ID_PROMOCION ID,DESCRIPCION,CAST(FECHAINI AS DATE) INICIA,CAST(FECHAFIN AS DATE) FINALIZA,TIPO,DESCUENTO,CODIGO_ASOCIADO ASOCIADO FROM EASYDATA..INV_ENCPROMO WHERE ID_PROMOCION BETWEEN '" & TXTDEL.Text & "' AND '" & TXTAL.Text & "'", "", {"ACTIVO"})
        P0.Visible = True
        P1.Visible = False
    End Sub

    Protected Sub BTNENC_Click(sender As Object, e As EventArgs) Handles BTNENC.Click
        RecordsetData("DELETE EASYDATA..INV_ENCPROMO WHERE ID_PROMOCION BETWEEN '" & TXTDEL.Text & "' AND '" & TXTAL.Text & "'")
        GridBind(GVREP, "SELECT 'YA NO HAY DATOS PARA MOSTRAR, SE HAN BORRADO ENCABEZADOS SEGUN RANGO DE PROMOS' MENSAJE", "", {"ACTIVO"})
    End Sub

    Protected Sub BTNDET_Click(sender As Object, e As EventArgs) Handles BTNDET.Click
        RecordsetData("DELETE EASYDATA..INV_DETPROMO WHERE ID_PROMOCION BETWEEN '" & TXTDEL.Text & "' AND '" & TXTAL.Text & "'")
        GridBind(GVREP, "SELECT 'SE HAN BORRADO EL DETALLE SEGUN EL RANGO DE PROMOS' MENSAJE", "", {"ACTIVO"})
    End Sub
End Class