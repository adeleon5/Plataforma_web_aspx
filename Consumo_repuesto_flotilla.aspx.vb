Public Class Consumo_respuesto_flotilla
    Inherits base

    Dim table As New DataTable("FillSN")

    Private Sub Consumo_respuesto_flotilla_Load(sender As Object, e As EventArgs) Handles Me.Load
        MaintainScrollPositionOnPostBack = True
        If IsPostBack Then
            Exit Sub
        End If

        TXTNODOCTO.Enabled = False
        DdBind(DDLSERIEDOCTO, "EXEC PRG_SAP_CONSUMO_REPUESTOS_FLOTILLA 1", "CODIGO", "PROCESO")
        DdBind(DDLCLIENTE, "EXEC PRG_SAP_CONSUMO_REPUESTOS_FLOTILLA 3", "CODIGO", "PROCESO")
        DdBind(DDLCD, "EXEC PRG_SAP_CONSUMO_REPUESTOS_FLOTILLA 4", "CODIGO", "PROCESO")
        DdBind(DDLTIPOCONSULTA, "EXEC PRG_SAP_CONSUMO_REPUESTOS_FLOTILLA 5", "CODIGO", "PROCESO")
        GridBind(GVPARTE, "EXEC PRG_SAP_CONSUMO_REPUESTOS_FLOTILLA 9 ", "", {"RESULT", ""})
        AbrirRecordsetData("EXEC PRG_SAP_CONSUMO_REPUESTOS_FLOTILLA 2")
        If nA(0) = 0 Then
            Exit Sub
        Else
            TXTNODOCTO.Text = nA(0)
        End If
    End Sub

    Private Sub BTNHABILITARBUSQUEDA_Click(sender As Object, e As EventArgs) Handles BTNHABILITARBUSQUEDA.Click

        Try
            'Dim message As String = "If Critical, you MUST provide a reason."
            'Dim script As String = "<script type='text/javascript'> alert('" + message + "');</script>"
            'ClientScript.RegisterClientScriptBlock(Me.GetType(), "AlertBox", script)
            P1_1.Visible = True
            P1_2.Visible = False
        Catch ex As Exception
            MostrarMensaje(ex.Message.ToString())
        End Try
    End Sub

    Private Sub BTNBUSCARPARTE_ServerClick(sender As Object, e As EventArgs) Handles BTNBUSCARPARTE.ServerClick
        GridBind(GVPARTE, "EXEC PRG_SAP_CONSUMO_REPUESTOS_FLOTILLA '" & DDLTIPOCONSULTA.SelectedItem.Value.ToString() & "', '" & TXTDATOBUSQUEDA.Text & "'", "", {"id", "indicador"})
    End Sub

    Private Sub MostrarMensaje(ByVal mensaje As String)
        Dim script As String = "<script type='text/javascript'> alert('" + mensaje + "');</script>"
        ClientScript.RegisterClientScriptBlock(Me.GetType(), "AlertBox", script)
    End Sub

    Private Sub GVPARTE_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVPARTE.SelectedIndexChanged
        AbrirRecordsetData("EXEC PRG_SAP_CONSUMO_REPUESTOS_FLOTILLA 11,'" + GVPARTE.SelectedRow.Cells(3).Text + "','" + Session.Item("UCO").ToString() + "'")
        If nA(0) = 0 Then
            MostrarMensaje(nA(1).ToString())
        Else
            AbrirRecordsetData("EXEC PRG_SAP_CONSUMO_REPUESTOS_FLOTILLA 10,'" + TXTNODOCTO.Text + "','0','" + GVPARTE.SelectedRow.Cells(3).Text + "','" + GVPARTE.SelectedRow.Cells(2).Text + "','0','" + GVPARTE.SelectedRow.Cells(4).Text + "','" + GVPARTE.SelectedRow.Cells(1).Text + "','" + Session.Item("UCO").ToString() + "'")
            If nA(0) <> 0 Then
                MostrarMensaje(nA(1).ToString())
                GridBind(GVPARTE, "EXEC PRG_SAP_CONSUMO_REPUESTOS_FLOTILLA 9 ", "", {"RESULT", ""})
                TXTDATOBUSQUEDA.Text = ""
                P1_1.Visible = False
                GVCONSUMOPARTES.DataBind()
                P1_2.Visible = True
            End If
        End If
        
    End Sub

    Private Sub BTNADD_Click(sender As Object, e As EventArgs) Handles BTNADD.Click
        Dim fechacreacion As Date
        fechacreacion = TXTFECHADOCUMENTO.Text
        AbrirRecordsetData("EXEC PRG_SAP_CONSUMO_REPUESTOS_FLOTILLA 12,'" + TXTNODOCTO.Text + "','" + DDLSERIEDOCTO.SelectedItem.Value.ToString() + "','" + DDLCLIENTE.SelectedItem.Value.ToString() + "','" + TXTEQUIPO.Text + "','" + TXTSERIE.Text + "','" + TXTHOROMETROCRF.Text + "','" + Format(fechacreacion, "yyyy/MM/dd") + "','" + TXTTECNICOSN.Text + "','" + DDLCD.SelectedItem.Value.ToString() + "','" + Session.Item("UCO").ToString() + "'")
        If nA(0) <> 0 Then
            MostrarMensaje(nA(1).ToString())
        End If
    End Sub
End Class