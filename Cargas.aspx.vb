Public Class Cargas
    Inherits base


    Private Sub Cargas_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        DdBind(TXTPROC, "EXEC PRG_UPLOADS 1", "CODIGO", "PROCESO")
        TXTPROC_SelectedIndexChanged(sender, e)
    End Sub

    Private Sub TXTPROC_SelectedIndexChanged(sender As Object, e As EventArgs) Handles TXTPROC.SelectedIndexChanged
        If TXTPROC.SelectedItem.Value = 110 Then
            LDOWNLOAD.Text = "<a download href=""./Files/Plantillas/PlantillaISR.xls"">Descargar Plantilla " & TXTPROC.SelectedItem.Text & "</a>"
        ElseIf TXTPROC.SelectedItem.Value = 111 Then
            LDOWNLOAD.Text = "<a download href=""./Files/Plantillas/MetasVendedor.xls"">Descargar Plantilla " & TXTPROC.SelectedItem.Text & "</a>"
        ElseIf TXTPROC.SelectedItem.Value = 112 Then
            LDOWNLOAD.Text = "<a download href=""./Files/Plantillas/ClasificacionPlanillas.xls"">Descargar Plantilla " & TXTPROC.SelectedItem.Text & "</a>"
        ElseIf TXTPROC.SelectedItem.Value = 113 Then
            LDOWNLOAD.Text = "<a download href=""./Files/Plantillas/MetasTiendas.xls"">Descargar Plantilla " & TXTPROC.SelectedItem.Text & "</a>"
        ElseIf TXTPROC.SelectedItem.Value = 114 Then
            LDOWNLOAD.Text = "<a download href=""./Files/Plantillas/DETPROMO.xls"">Descargar Plantilla " & TXTPROC.SelectedItem.Text & "</a>"
        End If
    End Sub

    Private Sub BTNUPL_Click(sender As Object, e As EventArgs) Handles BTNUPL.Click
        LBLERR.Text = ""
        Dim nStr1 As String
        If FU0.HasFile Then
            If System.IO.Path.GetExtension(FU0.FileName).ToLower <> ".xls" Then
                LBLERR.Text = "Sólamente se permiten archivos tipo xls"
                Exit Sub
            End If
            Try
                AbrirRecordsetData("EXEC PRG_UPLOADS 2,'" & Session("UCO") & "','" & TXTPROC.SelectedItem.Text & "','" & FU0.FileName & "'")
                If nA(0) = 0 Then
                    LBLERR.Text = nA(1)
                    Exit Sub
                End If
                If TXTPROC.SelectedItem.Text = "DETALLE MASIVO PROMOCIONES" Then
                    nStr1 = Server.MapPath("./Files/Uploads/DetallePromo/") & "DETPROMO" & System.IO.Path.GetExtension(FU0.FileName)
                    FU0.SaveAs(nStr1)
                    GBLocal(GVRES, "EXEC PRG_COMODIN 1,'" & nA(2) & "','" & nStr1 & "'", "", {"CODIGO"})
                Else
                    nStr1 = Server.MapPath("./Files/Uploads/Tmp/Dropbox/") & nA(1) & System.IO.Path.GetExtension(FU0.FileName)
                    FU0.SaveAs(nStr1)
                    GBLocal(GVRES, "EXEC PRG_UPLOADS " & TXTPROC.SelectedItem.Value & ",'" & nA(2) & "','" & nStr1 & "'", "", {"RESULT"})
                End If

            Catch ex As Exception
                LBLERR.Text = ex.Message
                Exit Sub
            End Try

        End If
    End Sub
End Class