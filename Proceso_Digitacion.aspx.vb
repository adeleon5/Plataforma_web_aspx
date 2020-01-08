Public Class Proceso_Digitacion
    Inherits base


    Private Sub Proceso_Digitacion_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        T0.Rows(1).Visible = False
        T0.Rows(2).Visible = False
        T0.Rows(3).Visible = False
        T0.Rows(4).Visible = False
        T0.Rows(5).Visible = False
        T0.Rows(6).Visible = False
        DdBind(TXTREP, "EXEC PRG_PROCESO_DIGITACION 1", "CODIGO", "REPORTE")
        DdBind(TXTTDA, "EXEC PRG_PROCESO_DIGITACION 2", "TIENDA", "NOMBRE")
        DdBind(TXTTIPO, "EXEC PRG_PROCESO_DIGITACION 3", "CODIGO", "NOMBRE")
        DdBind(TXTBNCPOS, "EXEC PRG_PROCESO_DIGITACION 3", "CODIGO", "NOMBRE")
        DdBind(TXTFPAGOS, "EXEC PRG_PROCESO_DIGITACION 4", "CODIGO", "DESCRIPCION")
        DdBind(TXTMODBAN, "EXEC PRG_PROCESO_DIGITACION 9", "CODIGO", "DESCRIPCION")
        DdBind(TXTTRANSACCION, "EXEC PRG_PROCESO_DIGITACION 14", "CODIGO", "DESCRIPCION")
        GridBind(GVREP, "SELECT 'Seleccione el reporte y los parámetros, y presione ""Ejecutar""' MENSAJE", "", {""})
        TXTREP.SelectedIndex = 0
        TXTREP_SelectedIndexChanged(sender, e)

    End Sub

    Private Sub BTNRUN_Click(sender As Object, e As EventArgs) Handles BTNRUN.Click
        GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTTIPO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDOC.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTTRANSACCION.SelectedItem.Value & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 101 Then
            P0.Visible = True
            P1.Visible = False
            P1B.Visible = False
            P1B.Visible = False
            P2.Visible = False
            P3.Visible = False
            P4.Visible = False
            P5.Visible = False
            P6.Visible = False
        End If
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 102 Then
            P0.Visible = True
            P1.Visible = False
            P1B.Visible = False
            P1B.Visible = False
            P2.Visible = False
            P3.Visible = False
            P4.Visible = False
            P5.Visible = False
            P6.Visible = False
        End If
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 103 Then
            P0.Visible = True
            P1.Visible = False
            P1B.Visible = False
            P1B.Visible = False
            P2.Visible = False
            P3.Visible = False
            P4.Visible = False
            P5.Visible = False
            P6.Visible = False
        End If
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 105 Then
            P0.Visible = True
            P1.Visible = False
            P1B.Visible = False
            P1B.Visible = False
            P2.Visible = False
            P3.Visible = False
            P4.Visible = False
            P5.Visible = False
            P6.Visible = False
        End If
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 106 Then
            P0.Visible = True
            P1.Visible = False
            P1B.Visible = False
            P1B.Visible = False
            P2.Visible = False
            P3.Visible = False
            P4.Visible = False
            P5.Visible = False
            P6.Visible = False
        End If
    End Sub

    Private Sub ExportToExcel(ByVal strFileName As String, ByVal dg As GridView)
        Response.Clear()
        Response.AddHeader("content-disposition", "attachment;filename=" & strFileName)
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Dim oStringWriter As New System.IO.StringWriter
        Dim oHtmlTextWriter As New System.Web.UI.HtmlTextWriter(oStringWriter)
        dg.RenderControl(oHtmlTextWriter)
        Response.Write(oStringWriter.ToString())
        Response.End()
    End Sub

    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        'MyBase.VerifyRenderingInServerForm(control)
    End Sub

    Private Sub TXTREP_SelectedIndexChanged(sender As Object, e As EventArgs) Handles TXTREP.SelectedIndexChanged
        If TXTREP.SelectedIndex = -1 Then
            Exit Sub
        End If
        T0.Rows(1).Visible = False
        T0.Rows(2).Visible = False
        T0.Rows(3).Visible = False
        T0.Rows(4).Visible = False
        T0.Rows(5).Visible = False
        T0.Rows(6).Visible = False
        Dim nRep As String
        Dim nRow As String()
        nRep = TXTREP.SelectedItem.Value.Substring(0, 3)
        nRow = TXTREP.SelectedItem.Value.Substring(4, Len(TXTREP.SelectedItem.Value) - 4).Split(",")
        For nI = 0 To nRow.Length - 1
            T0.Rows(nRow(nI)).Visible = True
        Next
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 104 Then
            P0.Visible = False
            P1.Visible = False
            P1B.Visible = False
            P1B.Visible = False
            P2.Visible = False
            P3.Visible = False
            P4.Visible = False
            P5.Visible = False
            P6.Visible = False
            BTNRUN.Visible = False
        End If
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 101 Then
            P0.Visible = False
            P1.Visible = False
            P1B.Visible = False
            P1B.Visible = False
            P2.Visible = False
            P3.Visible = False
            P4.Visible = False
            P5.Visible = False
            P6.Visible = False
            BTNINSTRUCCION.Visible = False
            BTNRUN.Visible = True
        End If
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 102 Then
            P0.Visible = False
            P1.Visible = False
            P1B.Visible = False
            P1B.Visible = False
            P2.Visible = False
            P3.Visible = False
            P4.Visible = False
            P5.Visible = False
            P6.Visible = False
            BTNINSTRUCCION.Visible = False
            BTNRUN.Visible = True
        End If
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 103 Then
            P0.Visible = False
            P1.Visible = False
            P1B.Visible = False
            P1B.Visible = False
            P2.Visible = False
            P3.Visible = False
            P4.Visible = False
            P5.Visible = False
            P6.Visible = False
            BTNINSTRUCCION.Visible = False
            BTNRUN.Visible = True
        End If
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 105 Then
            P0.Visible = False
            P1.Visible = False
            P1B.Visible = False
            P1B.Visible = False
            P2.Visible = False
            P3.Visible = False
            P4.Visible = False
            P5.Visible = False
            P6.Visible = False
            BTNINSTRUCCION.Visible = False
            BTNRUN.Visible = True
        End If
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 106 Then
            P0.Visible = False
            P1.Visible = False
            P1B.Visible = False
            P1B.Visible = False
            P2.Visible = False
            P3.Visible = False
            P4.Visible = False
            P5.Visible = False
            P6.Visible = False
            BTNINSTRUCCION.Visible = False
            BTNRUN.Visible = True
        End If
    End Sub

    Private Sub GVREP_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVREP.SelectedIndexChanged
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 101 Then
            If GVREP.SelectedRow.RowIndex < 7 Then
                Exit Sub
            End If
            P1B.Visible = True
            GridBind(GVFP, "EXEC PRG_PROCESO_DIGITACION 6,'" & GVREP.Rows(7).Cells(1).Text & "'", "", {"INV_ENT_ID", "FAC_PG_ID"})
            BTNADD.Visible = True
        End If
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 102 Then
            P2.Visible = True
            LMOD.Text = GVREP.SelectedRow.Cells(0).Text
            LBLBOLETAORIGINAL.Text = GVREP.SelectedRow.Cells(4).Text
            LBLFECHACORTE.Text = GVREP.SelectedRow.Cells(8).Text
            LBLFECHAINGRESO.Text = GVREP.SelectedRow.Cells(10).Text
            TXTMODBOL.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(4).Text)
            TXTMODMON.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(7).Text)
            TXTFECHADEPOSITO.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(8).Text)
            TXTOBSERDEPOSITO.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(9).Text)
            TXTMODRAZ.Text = ""
        End If
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 103 Then
            P3.Visible = True
            LTLMODCORTES.Text = GVREP.SelectedRow.Cells(0).Text
            GLB_TTR_ID.Text = GVREP.SelectedRow.Cells(2).Text
            FECHA.Text = GVREP.SelectedRow.Cells(9).Text
            FECHA_CORTE.Text = GVREP.SelectedRow.Cells(7).Text
            NODOCUMENTO.Text = GVREP.SelectedRow.Cells(4).Text

            TXTBLTPOS.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(4).Text)
            TXTMNTPOS.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(6).Text)
            TXTFCPOS.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(7).Text)
            TXTOBSERPOS.Text = HttpUtility.HtmlDecode(GVREP.SelectedRow.Cells(8).Text)
            TXTMODRAZ.Text = ""
        End If
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 105 Then
            If GVREP.SelectedRow.RowIndex < 7 Then
                Exit Sub
            End If
            P5.Visible = True
            TXTVNDORIGINAL.Text = GVREP.SelectedRow.Cells(1).Text
            TXTVNDNUEVO.Text = ""
            TXTVNDNOMBRE.Text = ""
        End If
        If TXTREP.SelectedItem.Value.Substring(0, 3) = 106 Then
            If GVREP.SelectedRow.RowIndex < 8 Then
                Exit Sub
            End If
            P6.Visible = True
            TXTHORAFAC.Text = "00:00"
            TXTFACMANUAL.Text = GVREP.Rows(1).Cells(1).Text
            TXTFACFECHA.Text = GVREP.Rows(2).Cells(1).Text
            TXTFECHAFAC.Text = GVREP.Rows(3).Cells(1).Text
            TXTFACMONTO.Text = GVREP.Rows(7).Cells(1).Text
            TXTFACOBSER.Text = ""
        End If
    End Sub

    Private Sub BTNCA1_Click(sender As Object, e As EventArgs) Handles BTNCA1.Click
        P1.Visible = False
        P0.Enabled = True
        GridBind(GVFP, "EXEC PRG_PROCESO_DIGITACION 6,'" & GVREP.Rows(7).Cells(1).Text & "'", "", {"INV_ENT_ID", "FAC_PG_ID"})
        TXTDOCTOPAGO.Text = ""
        TXTAUTORIZACION.Text = ""
        TXTMONTO.Text = "0.00"
        TXTJUS.Text = ""
    End Sub

    Protected Sub BTNGO1_Click(sender As Object, e As EventArgs) Handles BTNGO1.Click
        Dim ORIGINAL As String
        Select Case GVREP.Rows.Count
            Case 8
                ORIGINAL = "TIENDA:" & " " & GVREP.Rows(0).Cells(1).Text & " " & "FACTURA:" & " " & GVREP.Rows(1).Cells(1).Text & " " & "DE" & " " & "FECHA:" & " " & GVREP.Rows(2).Cells(1).Text & " " & "CODIGO ENTRADA:" & " " & GVREP.Rows(7).Cells(1).Text & " " & "NO TIENE FORMA DE PAGO ES POSIBLE QUE SE HAYA ELIMINADO, POR ESE MOTIVO" & " " & "SE LE REALIZO UN INSERT" & " " & "POR EL USUAIRO" & " " & Session("UCO") & ""
                AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 7,'" & LBLCODPAGO.Text & "','" & TXTFPAGOS.SelectedItem.Value & "','" & TXTDOCTOPAGO.Text & "','" & TXTAUTORIZACION.Text & "','" & TXTMONTO.Text & "','" & TXTJUS.Text & "','" & GVREP.Rows(0).Cells(1).Text & "','" & ORIGINAL & "','" & GVREP.Rows(1).Cells(1).Text & "'")
                If nA(0) = 0 Then
                    LTL01.Text = nA(1)
                    Exit Sub
                Else
                    LTL01.Text = nA(1)
                    GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTTIPO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDOC.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTTRANSACCION.SelectedItem.Value & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
                    GridBind(GVFP, "EXEC PRG_PROCESO_DIGITACION 6,'" & GVREP.Rows(7).Cells(1).Text & "'", "", {"INV_ENT_ID", "FAC_PG_ID"})
                    TXTDOCTOPAGO.Text = ""
                    TXTAUTORIZACION.Text = ""
                    TXTMONTO.Text = "0.00"
                    TXTJUS.Text = ""
                    P1.Visible = False
                End If
            Case 9
                ORIGINAL = "TIENDA:" & " " & GVREP.Rows(0).Cells(1).Text & " " & "FACTURA:" & " " & GVREP.Rows(1).Cells(1).Text & " " & "DE" & " " & "FECHA:" & " " & GVREP.Rows(2).Cells(1).Text & " " & "CODIGO ENTRADA:" & " " & GVREP.Rows(7).Cells(1).Text & " " & GVREP.Rows(8).Cells(0).Text & " " & GVREP.Rows(8).Cells(1).Text & " " & "SE LE REALIZO UN INSERT" & " " & "POR EL USUAIRO" & " " & Session("UCO") & ""
                AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 7,'" & LBLCODPAGO.Text & "','" & TXTFPAGOS.SelectedItem.Value & "','" & TXTDOCTOPAGO.Text & "','" & TXTAUTORIZACION.Text & "','" & TXTMONTO.Text & "','" & TXTJUS.Text & "','" & GVREP.Rows(0).Cells(1).Text & "','" & ORIGINAL & "','" & GVREP.Rows(1).Cells(1).Text & "'")
                If nA(0) = 0 Then
                    LTL01.Text = nA(1)
                    Exit Sub
                Else
                    LTL01.Text = nA(1)
                    GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTTIPO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDOC.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTTRANSACCION.SelectedItem.Value & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
                    GridBind(GVFP, "EXEC PRG_PROCESO_DIGITACION 6,'" & GVREP.Rows(7).Cells(1).Text & "'", "", {"INV_ENT_ID", "FAC_PG_ID"})
                    TXTDOCTOPAGO.Text = ""
                    TXTAUTORIZACION.Text = ""
                    TXTMONTO.Text = "0.00"
                    TXTJUS.Text = ""
                    P1.Visible = False
                End If
            Case 10
                ORIGINAL = "TIENDA:" & " " & GVREP.Rows(0).Cells(1).Text & " " & "FACTURA:" & " " & GVREP.Rows(1).Cells(1).Text & " " & "DE" & " " & "FECHA:" & " " & GVREP.Rows(2).Cells(1).Text & " " & "CODIGO ENTRADA:" & " " & GVREP.Rows(7).Cells(1).Text & " " & GVREP.Rows(8).Cells(0).Text & " " & GVREP.Rows(8).Cells(1).Text & " " & GVREP.Rows(9).Cells(0).Text & " " & GVREP.Rows(9).Cells(1).Text & " " & "SE LE REALIZO UN INSERT" & " " & "POR EL USUAIRO" & " " & Session("UCO") & ""
                AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 7,'" & LBLCODPAGO.Text & "','" & TXTFPAGOS.SelectedItem.Value & "','" & TXTDOCTOPAGO.Text & "','" & TXTAUTORIZACION.Text & "','" & TXTMONTO.Text & "','" & TXTJUS.Text & "','" & GVREP.Rows(0).Cells(1).Text & "','" & ORIGINAL & "','" & GVREP.Rows(1).Cells(1).Text & "'")
                If nA(0) = 0 Then
                    LTL01.Text = nA(1)
                    Exit Sub
                Else
                    LTL01.Text = nA(1)
                    GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTTIPO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDOC.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTTRANSACCION.SelectedItem.Value & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
                    GridBind(GVFP, "EXEC PRG_PROCESO_DIGITACION 6,'" & GVREP.Rows(7).Cells(1).Text & "'", "", {"INV_ENT_ID", "FAC_PG_ID"})
                    TXTDOCTOPAGO.Text = ""
                    TXTAUTORIZACION.Text = ""
                    TXTMONTO.Text = "0.00"
                    TXTJUS.Text = ""
                    P1.Visible = False
                End If
            Case 11
                ORIGINAL = "TIENDA:" & " " & GVREP.Rows(0).Cells(1).Text & " " & "FACTURA:" & " " & GVREP.Rows(1).Cells(1).Text & " " & "DE" & " " & "FECHA:" & " " & GVREP.Rows(2).Cells(1).Text & " " & "CODIGO ENTRADA:" & " " & GVREP.Rows(7).Cells(1).Text & " " & GVREP.Rows(8).Cells(0).Text & " " & GVREP.Rows(8).Cells(1).Text & " " & GVREP.Rows(9).Cells(0).Text & " " & GVREP.Rows(9).Cells(1).Text & " " & GVREP.Rows(10).Cells(0).Text & " " & GVREP.Rows(10).Cells(1).Text & " " & "SE LE REALIZO UN INSERT" & " " & "POR EL USUAIRO" & " " & Session("UCO") & ""
                AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 7,'" & LBLCODPAGO.Text & "','" & TXTFPAGOS.SelectedItem.Value & "','" & TXTDOCTOPAGO.Text & "','" & TXTAUTORIZACION.Text & "','" & TXTMONTO.Text & "','" & TXTJUS.Text & "','" & GVREP.Rows(0).Cells(1).Text & "','" & ORIGINAL & "','" & GVREP.Rows(1).Cells(1).Text & "'")
                If nA(0) = 0 Then
                    LTL01.Text = nA(1)
                    Exit Sub
                Else
                    LTL01.Text = nA(1)
                    GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTTIPO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDOC.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTTRANSACCION.SelectedItem.Value & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
                    GridBind(GVFP, "EXEC PRG_PROCESO_DIGITACION 6,'" & GVREP.Rows(7).Cells(1).Text & "'", "", {"INV_ENT_ID", "FAC_PG_ID"})
                    TXTDOCTOPAGO.Text = ""
                    TXTAUTORIZACION.Text = ""
                    TXTMONTO.Text = "0.00"
                    TXTJUS.Text = ""
                    P1.Visible = False
                End If
            Case 12
                ORIGINAL = "TIENDA:" & " " & GVREP.Rows(0).Cells(1).Text & " " & "FACTURA:" & " " & GVREP.Rows(1).Cells(1).Text & " " & "DE" & " " & "FECHA:" & " " & GVREP.Rows(2).Cells(1).Text & " " & "CODIGO ENTRADA:" & " " & GVREP.Rows(7).Cells(1).Text & " " & GVREP.Rows(8).Cells(0).Text & " " & GVREP.Rows(8).Cells(1).Text & " " & GVREP.Rows(9).Cells(0).Text & " " & GVREP.Rows(9).Cells(1).Text & " " & GVREP.Rows(10).Cells(0).Text & " " & GVREP.Rows(10).Cells(1).Text & " " & GVREP.Rows(11).Cells(0).Text & " " & GVREP.Rows(11).Cells(1).Text & " " & "SE LE REALIZO UN INSERT" & " " & "POR EL USUAIRO" & " " & Session("UCO") & ""
                AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 7,'" & LBLCODPAGO.Text & "','" & TXTFPAGOS.SelectedItem.Value & "','" & TXTDOCTOPAGO.Text & "','" & TXTAUTORIZACION.Text & "','" & TXTMONTO.Text & "','" & TXTJUS.Text & "','" & GVREP.Rows(0).Cells(1).Text & "','" & ORIGINAL & "','" & GVREP.Rows(1).Cells(1).Text & "'")
                If nA(0) = 0 Then
                    LTL01.Text = nA(1)
                    Exit Sub
                Else
                    LTL01.Text = nA(1)
                    GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTTIPO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDOC.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTTRANSACCION.SelectedItem.Value & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
                    GridBind(GVFP, "EXEC PRG_PROCESO_DIGITACION 6,'" & GVREP.Rows(7).Cells(1).Text & "'", "", {"INV_ENT_ID", "FAC_PG_ID"})
                    TXTDOCTOPAGO.Text = ""
                    TXTAUTORIZACION.Text = ""
                    TXTMONTO.Text = "0.00"
                    TXTJUS.Text = ""
                    P1.Visible = False
                End If
        End Select
    End Sub

    Protected Sub BTNELIMINAR_Click(sender As Object, e As EventArgs) Handles BTNELIMINAR.Click
        Dim ORIGINAL As String
        Select Case GVREP.Rows.Count
            Case 9
                ORIGINAL = "TIENDA:" & " " & GVREP.Rows(0).Cells(1).Text & " " & "FACTURA O NOTA DE CREDITO:" & " " & GVREP.Rows(1).Cells(1).Text & " " & "DE" & " " & "FECHA:" & " " & GVREP.Rows(2).Cells(1).Text & " " & "CODIGO ENTRADA:" & " " & GVREP.Rows(7).Cells(1).Text & " " & GVREP.Rows(8).Cells(0).Text & " " & GVREP.Rows(8).Cells(1).Text & " " & "SE LE REALIZO UN DELETE A LA FORMA DE PAGO" & " " & LBLCODTIPO1.Text & "POR EL USUAIRO" & " " & Session("UCO") & ""
                AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 5,'" & LBLCODPAGO1.Text & "','" & LBLCODTIPO1.Text & "','" & TXTJUS0.Text & "','" & GVREP.Rows(0).Cells(1).Text & "','" & ORIGINAL & "','" & GVREP.Rows(1).Cells(1).Text & "'")
                If nA(0) = 0 Then
                    LTL01.Text = nA(1)
                    Exit Sub
                Else
                    LTL01.Text = nA(1)
                    GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTTIPO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDOC.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTTRANSACCION.SelectedItem.Value & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
                    GridBind(GVFP, "EXEC PRG_PROCESO_DIGITACION 6,'" & GVREP.Rows(7).Cells(1).Text & "'", "", {"INV_ENT_ID", "FAC_PG_ID"})
                    P1A.Visible = False
                    TXTDESCRIPT.Text = ""
                    TXTMONTOPAGO.Text = "0.00"
                    TXTAUTORI.Text = ""
                    TXTDOCTO.Text = ""
                    TXTJUS0.Text = ""
                End If
            Case 10
                ORIGINAL = "TIENDA:" & " " & GVREP.Rows(0).Cells(1).Text & " " & "FACTURA O NOTA DE CREDITO:" & " " & GVREP.Rows(1).Cells(1).Text & " " & "DE" & " " & "FECHA:" & " " & GVREP.Rows(2).Cells(1).Text & " " & "CODIGO ENTRADA:" & " " & GVREP.Rows(7).Cells(1).Text & " " & GVREP.Rows(8).Cells(0).Text & " " & GVREP.Rows(8).Cells(1).Text & " " & GVREP.Rows(9).Cells(0).Text & " " & GVREP.Rows(9).Cells(1).Text & " " & "SE LE REALIZO UN DELETE A LA FORMA DE PAGO" & " " & LBLCODTIPO1.Text & "POR EL USUAIRO" & " " & Session("UCO") & ""
                AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 5,'" & LBLCODPAGO1.Text & "','" & LBLCODTIPO1.Text & "','" & TXTJUS0.Text & "','" & GVREP.Rows(0).Cells(1).Text & "','" & ORIGINAL & "','" & GVREP.Rows(1).Cells(1).Text & "'")
                If nA(0) = 0 Then
                    LTL01.Text = nA(1)
                    Exit Sub
                Else
                    LTL01.Text = nA(1)
                    GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTTIPO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDOC.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTTRANSACCION.SelectedItem.Value & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
                    GridBind(GVFP, "EXEC PRG_PROCESO_DIGITACION 6,'" & GVREP.Rows(7).Cells(1).Text & "'", "", {"INV_ENT_ID", "FAC_PG_ID"})
                    P1A.Visible = False
                    TXTDESCRIPT.Text = ""
                    TXTMONTOPAGO.Text = "0.00"
                    TXTAUTORI.Text = ""
                    TXTDOCTO.Text = ""
                    TXTJUS0.Text = ""
                End If
            Case 11
                ORIGINAL = "TIENDA:" & " " & GVREP.Rows(0).Cells(1).Text & " " & "FACTURA O NOTA DE CREDITO:" & " " & GVREP.Rows(1).Cells(1).Text & " " & "DE" & " " & "FECHA:" & " " & GVREP.Rows(2).Cells(1).Text & " " & "CODIGO ENTRADA:" & " " & GVREP.Rows(7).Cells(1).Text & " " & GVREP.Rows(8).Cells(0).Text & " " & GVREP.Rows(8).Cells(1).Text & " " & GVREP.Rows(9).Cells(0).Text & " " & GVREP.Rows(9).Cells(1).Text & " " & GVREP.Rows(10).Cells(0).Text & " " & GVREP.Rows(10).Cells(1).Text & " " & "SE LE REALIZO UN DELETE A LA FORMA DE PAGO" & " " & LBLCODTIPO1.Text & "POR EL USUAIRO" & " " & Session("UCO") & ""
                AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 5,'" & LBLCODPAGO1.Text & "','" & LBLCODTIPO1.Text & "','" & TXTJUS0.Text & "','" & GVREP.Rows(0).Cells(1).Text & "','" & ORIGINAL & "','" & GVREP.Rows(1).Cells(1).Text & "'")
                If nA(0) = 0 Then
                    LTL01.Text = nA(1)
                    Exit Sub
                Else
                    LTL01.Text = nA(1)
                    GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTTIPO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDOC.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTTRANSACCION.SelectedItem.Value & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
                    GridBind(GVFP, "EXEC PRG_PROCESO_DIGITACION 6,'" & GVREP.Rows(7).Cells(1).Text & "'", "", {"INV_ENT_ID", "FAC_PG_ID"})
                    P1A.Visible = False
                    TXTDESCRIPT.Text = ""
                    TXTMONTOPAGO.Text = "0.00"
                    TXTAUTORI.Text = ""
                    TXTDOCTO.Text = ""
                    TXTJUS0.Text = ""
                End If
            Case 12
                ORIGINAL = "TIENDA:" & " " & GVREP.Rows(0).Cells(1).Text & " " & "FACTURA O NOTA DE CREDITO:" & " " & GVREP.Rows(1).Cells(1).Text & " " & "DE" & " " & "FECHA:" & " " & GVREP.Rows(2).Cells(1).Text & " " & "CODIGO ENTRADA:" & " " & GVREP.Rows(7).Cells(1).Text & " " & GVREP.Rows(8).Cells(0).Text & " " & GVREP.Rows(8).Cells(1).Text & " " & GVREP.Rows(9).Cells(0).Text & " " & GVREP.Rows(9).Cells(1).Text & " " & GVREP.Rows(10).Cells(0).Text & " " & GVREP.Rows(10).Cells(1).Text & " " & GVREP.Rows(11).Cells(0).Text & " " & GVREP.Rows(11).Cells(1).Text & " " & "SE LE REALIZO UN DELETE A LA FORMA DE PAGO" & " " & LBLCODTIPO1.Text & "POR EL USUAIRO" & " " & Session("UCO") & ""
                AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 5,'" & LBLCODPAGO1.Text & "','" & LBLCODTIPO1.Text & "','" & TXTJUS0.Text & "','" & GVREP.Rows(0).Cells(1).Text & "','" & ORIGINAL & "','" & GVREP.Rows(1).Cells(1).Text & "'")
                If nA(0) = 0 Then
                    LTL01.Text = nA(1)
                    Exit Sub
                Else
                    LTL01.Text = nA(1)
                    GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTTIPO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDOC.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "','" & TXTTRANSACCION.SelectedItem.Value & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
                    GridBind(GVFP, "EXEC PRG_PROCESO_DIGITACION 6,'" & GVREP.Rows(7).Cells(1).Text & "'", "", {"INV_ENT_ID", "FAC_PG_ID"})
                    P1A.Visible = False
                    TXTDESCRIPT.Text = ""
                    TXTMONTOPAGO.Text = "0.00"
                    TXTAUTORI.Text = ""
                    TXTDOCTO.Text = ""
                    TXTJUS0.Text = ""
                End If
        End Select
       
    End Sub

    Protected Sub GVFP_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVFP.SelectedIndexChanged
        P1A.Visible = True
        LBLCODPAGO1.Text = GVFP.SelectedRow.Cells(0).Text
        LBLCODTIPO1.Text = GVFP.SelectedRow.Cells(1).Text
        TXTDESCRIPT.Text = HttpUtility.HtmlDecode(GVFP.SelectedRow.Cells(2).Text)
        TXTDOCTO.Text = HttpUtility.HtmlDecode(GVFP.SelectedRow.Cells(3).Text)
        TXTAUTORI.Text = HttpUtility.HtmlDecode(GVFP.SelectedRow.Cells(4).Text)
        TXTMONTOPAGO.Text = HttpUtility.HtmlDecode(GVFP.SelectedRow.Cells(5).Text)
    End Sub

    Protected Sub BTNCANCEL_Click(sender As Object, e As EventArgs) Handles BTNCANCEL.Click
        P1A.Visible = False
        TXTDESCRIPT.Text = ""
        TXTMONTOPAGO.Text = "0.00"
        TXTAUTORI.Text = ""
        TXTDOCTO.Text = ""
        TXTJUS0.Text = ""
    End Sub

    Protected Sub BTNADD_Click(sender As Object, e As EventArgs) Handles BTNADD.Click
        P1.Visible = True
        P1A.Visible = False
        TXTMONTO.Text = "0.00"
        TXTDOCTOPAGO.Text = ""
        TXTAUTORIZACION.Text = ""
        LBLCODPAGO.Text = GVREP.Rows(7).Cells(1).Text
        TXTDOCTOPAGO.Focus()
    End Sub

    Protected Sub TMR90_Tick(sender As Object, e As EventArgs) Handles TMR90.Tick
        LTL01.Text = ""
        LBLERR01.Text = ""
        LTLGENERA.Text = ""
    End Sub

    Protected Sub BTNINSTRUCCION_Click(sender As Object, e As EventArgs) Handles BTNINSTRUCCION.Click
        AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 8,'" & TXTTDA.SelectedItem.Value & "'")
        Dim val As Boolean
        val = IsDBNull(nA(0))
        If val = True Then
            LTLGENERA.Text = "Se ha Generado la Instrucción"
        Else
            LTLGENERA.Text = "No hay datos para Generar"
        End If
        'If nA(0) = 0 Then
        '    LTLGENERA.Text = nA(1)
        'End If
    End Sub

    Protected Sub BTNCHNG_Click(sender As Object, e As EventArgs) Handles BTNCHNG.Click
        Dim F1, F2, F3 As Date
        Dim DOCTO_ORIGINAL As String
        DOCTO_ORIGINAL = "TIENDA:" & " " & GVREP.SelectedRow.Cells(1).Text & " " & "TIPO DE TRANSACCION:" & " " & GVREP.SelectedRow.Cells(2).Text & " " & "BOLETA NO:" & " " & GVREP.SelectedRow.Cells(4).Text & " " & "ID DE BANCO:" & " " & GVREP.SelectedRow.Cells(5).Text & " " & "MONTO Q." & " " & GVREP.SelectedRow.Cells(7).Text & " " & "FECHA DE CORTE:" & GVREP.SelectedRow.Cells(8).Text & " " & "FECHA DE INGRESO:" & " " & GVREP.SelectedRow.Cells(10).Text & " FUE ACTUALIZADO POR EL USUARIO:" & " " & Session("UCO") & ""
        F1 = LBLFECHACORTE.Text
        F2 = LBLFECHAINGRESO.Text
        F3 = TXTFECHADEPOSITO.Text
        AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 10,'" & LMOD.Text & "','" & TXTMODBOL.Text & "','" & TXTMODBAN.SelectedItem.Value & "','" & TXTMODMON.Text & "','" & TXTMODRAZ.Text & "','" & LBLBOLETAORIGINAL.Text & "','" & Format(F1, "yyyyMMdd") & "','" & Format(F2, "yyyyMMdd") & "','" & TXTTDA.SelectedItem.Value & "','" & DOCTO_ORIGINAL & "','" & Format(F3, "yyyyMMdd") & "','" & TXTOBSERDEPOSITO.Text & "'")
        If nA(0) = 0 Then
            LTL01.Text = nA(1)
            Exit Sub
        Else
            LTL01.Text = nA(1)
            GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTTIPO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTMODBOL.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
            P2.Visible = False
            TXTMODBOL.Text = ""
            TXTMODMON.Text = ""
            TXTMODRAZ.Text = ""
            TXTOBSERDEPOSITO.Text = ""
            TXTFECHADEPOSITO.Text = ""
        End If
    End Sub

    Protected Sub BTNCANC_Click(sender As Object, e As EventArgs) Handles BTNCANC.Click
        P2.Visible = False
        TXTMODBOL.Text = ""
        TXTMODMON.Text = ""
        TXTMODRAZ.Text = ""
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        Dim F1, F2, F3 As Date
        Dim DOCTO_ORIGINAL_POS As String
        DOCTO_ORIGINAL_POS = "TIENDA:" & " " & GVREP.SelectedRow.Cells(1).Text & " " & "TIPO DE TRANSACCION:" & " " & GVREP.SelectedRow.Cells(2).Text & " " & "DOCUMENTO NO:" & " " & GVREP.SelectedRow.Cells(4).Text & " " & "ID DE BANCO:" & " " & GVREP.SelectedRow.Cells(5).Text & " " & "MONTO Q." & " " & GVREP.SelectedRow.Cells(6).Text & " " & "FECHA DE CORTE:" & GVREP.SelectedRow.Cells(7).Text & " " & "FECHA DE INGRESO:" & " " & GVREP.SelectedRow.Cells(9).Text & " FUE ACTUALIZADO POR EL USUARIO:" & " " & Session("UCO") & ""
        F1 = FECHA.Text
        F2 = FECHA_CORTE.Text
        F3 = TXTFCPOS.Text
        AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 11,'" & TXTBNCPOS.SelectedItem.Value & "','" & TXTBLTPOS.Text & "','" & TXTMNTPOS.Text & "','" & Format(F3, "yyyMMdd") & "','" & TXTOBSERPOS.Text & "','" & LTLMODCORTES.Text & "','" & TXTRZNPOS.Text & "','" & GLB_TTR_ID.Text & "','" & NODOCUMENTO.Text & "','" & Format(F2, "yyyyMMdd") & "','" & Format(F1, "yyyyMMdd") & "','" & TXTTDA.SelectedItem.Value & "','" & DOCTO_ORIGINAL_POS & "'")
        If nA(0) = 0 Then
            LTL01.Text = nA(1)
            Exit Sub
        Else
            LTL01.Text = nA(1)
            GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTBNCPOS.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTBLTPOS.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
            P3.Visible = False
            TXTMNTPOS.Text = ""
            TXTBLTPOS.Text = ""
            TXTFCPOS.Text = ""
            TXTOBSERPOS.Text = ""
            TXTRZNPOS.Text = ""
        End If
    End Sub

    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        P3.Visible = False
        TXTMNTPOS.Text = ""
        TXTBLTPOS.Text = ""
        TXTFCPOS.Text = ""
        TXTOBSERPOS.Text = ""
        TXTRZNPOS.Text = ""
    End Sub

    Protected Sub BTNCANCELVND_Click(sender As Object, e As EventArgs) Handles BTNCANCELVND.Click
        P5.Visible = False
        TXTVNDNUEVO.Text = ""
        TXTVNDNOMBRE.Text = ""
        TXTVNDORIGINAL.Text = ""
        TXTOBSERVND.Text = ""
    End Sub

    Protected Sub BTNBUSCAR_Click(sender As Object, e As EventArgs) Handles BTNBUSCAR.Click
        AbrirRecordsetData("SELECT NOMBRE FROM EASYDATA..INV_VENDEDORES WHERE INV_VND_ID='" & TXTVNDNUEVO.Text & "'")
        If nA(0) = "" Then
            LTL01.Text = "Vendedor no Existe, Verifique el Codigo"
            Exit Sub
        Else
            TXTVNDNOMBRE.Text = nA(0)
        End If
    End Sub

    Protected Sub BTNMODVND_Click(sender As Object, e As EventArgs) Handles BTNMODVND.Click
        Dim ORIGINAL_VENDEDOR As String
        ORIGINAL_VENDEDOR = "TIENDA:" & " " & GVREP.Rows(0).Cells(1).Text & " " & "FACTURA:" & " " & GVREP.Rows(1).Cells(1).Text & " " & "DE" & " " & "FECHA:" & " " & GVREP.Rows(2).Cells(1).Text & " " & "CODIGO DE VENDEDOR:" & " " & GVREP.Rows(7).Cells(1).Text & " " & "SE LE REALIZO UNA ACTUALIZACION AL VENDEDOR" & " " & "POR EL USUAIRO" & " " & Session("UCO") & ""
        AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 12,'" & TXTVNDNUEVO.Text & "','" & GVREP.Rows(1).Cells(1).Text & "','" & TXTOBSERVND.Text & "','" & GVREP.Rows(0).Cells(1).Text & "','" & ORIGINAL_VENDEDOR & "'")
        If nA(0) = 0 Then
            LTL01.Text = nA(1)
            Exit Sub
        Else
            LTL01.Text = nA(1)
            GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTTIPO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDOC.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
            P5.Visible = False
            TXTVNDNUEVO.Text = ""
            TXTVNDNOMBRE.Text = ""
            TXTVNDORIGINAL.Text = ""
            TXTOBSERVND.Text = ""
        End If
    End Sub

    Protected Sub BTNFACCANCEL_Click(sender As Object, e As EventArgs) Handles BTNFACCANCEL.Click
        P6.Visible = False
        TXTFACMANUAL.Text = ""
        TXTFACFECHA.Text = ""
        TXTFECHAFAC.Text = ""
        TXTFACMONTO.Text = ""
        TXTFACOBSER.Text = ""
        TXTHORAFAC.Text = "00:00"
    End Sub

    Protected Sub BTNFACMOD_Click(sender As Object, e As EventArgs) Handles BTNFACMOD.Click
        Dim F1, F2 As Date
        Dim DOCTO_FACMANUAL As String
        DOCTO_FACMANUAL = "TIENDA:" & " " & GVREP.Rows(0).Cells(1).Text & " " & "TIPO DE TRANSACCION: 2" & " " & GVREP.Rows(1).Cells(0).Text & " " & "DOCUMENTO NO:" & " " & GVREP.Rows(1).Cells(1).Text & " " & "MONTO Q." & " " & GVREP.Rows(7).Cells(1).Text & " " & "FECHA:" & GVREP.Rows(2).Cells(1).Text & " " & "FECHA DE FACTURA:" & " " & GVREP.Rows(3).Cells(1).Text & " FUE ACTUALIZADA POR EL USUARIO:" & " " & Session("UCO") & ""
        F1 = TXTFACFECHA.Text
        F2 = TXTFECHAFAC.Text
        AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 13,'" & TXTFACMONTO.Text & "','" & Format(F1, "yyyyMMdd") & "','" & Format(F2, "yyyyMMdd") & " " & TXTHORAFAC.Text & "','" & TXTFACMANUAL.Text & "','" & TXTFACOBSER.Text & "','" & GVREP.Rows(0).Cells(1).Text & "','" & DOCTO_FACMANUAL & "'")
        If nA(0) = 0 Then
            LTL01.Text = nA(1)
            Exit Sub
        Else
            LTL01.Text = nA(1)
            GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTTIPO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTDOC.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
            P6.Visible = False
            TXTFACMANUAL.Text = ""
            TXTFACFECHA.Text = ""
            TXTFECHAFAC.Text = ""
            TXTFACMONTO.Text = ""
            TXTFACOBSER.Text = ""
            TXTHORAFAC.Text = "00:00"
        End If
    End Sub

    Protected Sub BTNELIMINARDEPO_Click(sender As Object, e As EventArgs) Handles BTNELIMINARDEPO.Click
        Dim F1, F2 As Date
        Dim DOCTO_ORIGINAL_DEPO As String
        DOCTO_ORIGINAL_DEPO = "TIENDA:" & " " & GVREP.SelectedRow.Cells(1).Text & " " & "TIPO DE TRANSACCION:" & " " & GVREP.SelectedRow.Cells(2).Text & " " & "BOLETA NO:" & " " & GVREP.SelectedRow.Cells(4).Text & " " & "ID DE BANCO:" & " " & GVREP.SelectedRow.Cells(5).Text & " " & "MONTO Q." & " " & GVREP.SelectedRow.Cells(7).Text & " " & "FECHA DE CORTE:" & GVREP.SelectedRow.Cells(8).Text & " " & "FECHA DE INGRESO:" & " " & GVREP.SelectedRow.Cells(10).Text & " FUE ELIMINADO POR EL USUARIO:" & " " & Session("UCO") & ""
        F1 = LBLFECHACORTE.Text
        F2 = LBLFECHAINGRESO.Text
        AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 15,'" & LMOD.Text & "','" & TXTMODRAZ.Text & "','" & LBLBOLETAORIGINAL.Text & "','" & Format(F1, "yyyyMMdd") & "','" & Format(F2, "yyyyMMdd") & "','" & TXTTDA.SelectedItem.Value & "','" & DOCTO_ORIGINAL_DEPO & "'")
        If nA(0) = 0 Then
            LTL01.Text = nA(1)
            Exit Sub
        Else
            LTL01.Text = nA(1)
            GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTTIPO.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTMODBOL.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
            P2.Visible = False
            TXTMODBOL.Text = ""
            TXTMODMON.Text = ""
            TXTMODRAZ.Text = ""
            TXTOBSERDEPOSITO.Text = ""
            TXTFECHADEPOSITO.Text = ""
        End If
    End Sub

    Protected Sub LinkButton5_Click(sender As Object, e As EventArgs) Handles LinkButton5.Click
        Dim F1, F2, F3 As Date
        Dim DOCTO_ORIGINAL_POS1 As String
        DOCTO_ORIGINAL_POS1 = "TIENDA:" & " " & GVREP.SelectedRow.Cells(1).Text & " " & "TIPO DE TRANSACCION:" & " " & GVREP.SelectedRow.Cells(2).Text & " " & "DOCUMENTO NO:" & " " & GVREP.SelectedRow.Cells(4).Text & " " & "ID DE BANCO:" & " " & GVREP.SelectedRow.Cells(5).Text & " " & "MONTO Q." & " " & GVREP.SelectedRow.Cells(6).Text & " " & "FECHA DE CORTE:" & GVREP.SelectedRow.Cells(7).Text & " " & "FECHA DE INGRESO:" & " " & GVREP.SelectedRow.Cells(9).Text & " FUE ELIMINADO POR EL USUARIO:" & " " & Session("UCO") & ""
        F1 = FECHA.Text
        F2 = FECHA_CORTE.Text
        F3 = TXTFCPOS.Text
        AbrirRecordsetData("EXEC PRG_PROCESO_DIGITACION 16,'" & TXTBNCPOS.SelectedItem.Value & "','" & TXTBLTPOS.Text & "','" & TXTMNTPOS.Text & "','" & Format(F3, "yyyMMdd") & "','" & TXTOBSERPOS.Text & "','" & LTLMODCORTES.Text & "','" & TXTRZNPOS.Text & "','" & GLB_TTR_ID.Text & "','" & NODOCUMENTO.Text & "','" & Format(F2, "yyyyMMdd") & "','" & Format(F1, "yyyyMMdd") & "','" & TXTTDA.SelectedItem.Value & "','" & DOCTO_ORIGINAL_POS1 & "'")
        If nA(0) = 0 Then
            LTL01.Text = nA(1)
            Exit Sub
        Else
            LTL01.Text = nA(1)
            GridBind(GVREP, "EXEC PRG_PROCESO_DIGITACION " & TXTREP.SelectedItem.Value.Substring(0, 3) & ",'" & TXTBNCPOS.SelectedItem.Value & "','" & TXTTDA.SelectedItem.Value & "','" & TXTBLTPOS.Text & "','" & TXTDEL.Text & "','" & TXTAL.Text & "'", "", {"CODIGO", "MOV_ID", "GLB_TTR_ID", "BAN_CUE_ID", "GLB_EMP_ID", "INV_EST_ID", "GLB_PRD_ID", "CAJERO"})
            P3.Visible = False
            TXTMNTPOS.Text = ""
            TXTBLTPOS.Text = ""
            TXTFCPOS.Text = ""
            TXTOBSERPOS.Text = ""
            TXTRZNPOS.Text = ""
        End If
    End Sub
End Class