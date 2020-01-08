Imports System.IO
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Drawing

Public Class Calendario_Tiendas
    Inherits System.Web.UI.Page

    Private Sub Calendario_Tiendas_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        DdBind(TXTSUPER, "EXEC PRG_RPT_CALENDARIO 1,'" & Session("UCO") & "'", "CODIGO", "NOMBRE")
        DdBind(TXTTIENDAS, "EXEC PRG_RPT_CALENDARIO 6,'" & Session("UCO") & "'", "CODIGO", "NOMBRE")
        DdBind(TXTTIENDA, "EXEC PRG_RPT_CALENDARIO 6,'" & Session("UCO") & "'", "CODIGO", "NOMBRE")
        DdBind(TXTSUPERVISOR, "EXEC PRG_RPT_CALENDARIO 7,'" & Session("UCO") & "'", "CODIGO", "NOMBRE")
        DdBind(TXTSEMANA, "EXEC PRG_RPT_CALENDARIO 2", "SEMANA", "SEMANA")
        DdBind(DPDSMN, "EXEC PRG_RPT_CALENDARIO 14", "SEMANA", "SEMANA")
        'CHKBOX(PanelPrueba, "EXEC PRG_RPT_CALENDARIO 2")
    End Sub

    Protected Sub BTNBACK1_Click(sender As Object, e As EventArgs) Handles BTNBACK1.Click
        P0.Visible = True
        P2.Visible = False
        TXTBUSQUEDA.Text = ""
        LBLERR1.Text = ""
        LBLERR7.Text = ""
        LBLERR8.Text = ""
        LBLERR9.Text = ""
        DdBind(TXTTIENDA, "EXEC PRG_RPT_CALENDARIO 6,'" & Session("UCO") & "'", "CODIGO", "NOMBRE")
        DdBind(DPDSMN, "EXEC PRG_RPT_CALENDARIO 14", "SEMANA", "SEMANA")
        BindData()
        GridBind90(GVREP, "PRG_RPT_CALENDARIO 9,'" & TXTSUPER.SelectedItem.Value & "','" & TXTTIENDAS.SelectedItem.Value & "'", "", {""})
    End Sub

    Protected Sub BTNNEW_Click(sender As Object, e As EventArgs) Handles BTNNEW.Click
        P0.Visible = False
        P2.Visible = True
        TXTBUSQUEDA.Text = ""
        LBLERR1.Text = ""
        DdBind(TXTTIENDA, "EXEC PRG_RPT_CALENDARIO 6,'" & Session("UCO") & "'", "CODIGO", "NOMBRE")
        DdBind(DPDSMN, "EXEC PRG_RPT_CALENDARIO 14", "SEMANA", "SEMANA")
    End Sub

    Protected Sub TXTBUSQUEDA_TextChanged(sender As Object, e As EventArgs) Handles TXTBUSQUEDA.TextChanged
        DdBind(TXTVENDEDOR, "EXEC PRG_RPT_CALENDARIO 3,'" & TXTBUSQUEDA.Text & "'", "CODIGO", "NOMBRE")
    End Sub

    Protected Sub BTNADD_Click(sender As Object, e As EventArgs) Handles BTNADD.Click
        LBLERR1.Text = ""
        LBLERR7.Text = ""
        LBLERR8.Text = ""
        LBLERR9.Text = ""
        AbrirRecordsetData("PRG_RPT_CALENDARIO 8,'" & TXTTIENDA.SelectedItem.Value & "','" & TXTVENDEDOR.SelectedItem.Value & "','" & TXTVENDEDOR.SelectedItem.Text & "','" & TXTSUPERVISOR.SelectedItem.Value & "','" & DPDSMN.SelectedItem.Value & "'")
        If nA(0) = 0 Then
            LBLERR1.Text = nA(1)
            Exit Sub
        End If

    End Sub

    Protected Sub BTNGENERAR_Click(sender As Object, e As EventArgs) Handles BTNGENERAR.Click
        LBLERR7.Text = ""
        LBLERR8.Text = ""
        LBLERR9.Text = ""
        AbrirRecordsetData("PRG_RPT_CALENDARIO 11,'" & Session("UCO") & "','" & TXTSEMANA.SelectedItem.Value & "'")
        If nA(0) = 0 Then
            LBLERR7.Text = nA(1)
            Exit Sub
        End If
        Notifica("Calendario Generado Exitosamente", "Calendario_Tiendas.aspx")
    End Sub

    Protected Sub TXTTIENDAS_SelectedIndexChanged(sender As Object, e As EventArgs) Handles TXTTIENDAS.SelectedIndexChanged
        LBLERR7.Text = ""
        LBLERR8.Text = ""
        LBLERR9.Text = ""
        BindData()
        GridBind90(GVREP, "PRG_RPT_CALENDARIO 9,'" & TXTSUPER.SelectedItem.Value & "','" & TXTTIENDAS.SelectedItem.Value & "'", "", {""})
        LBLCALENDARIO.Text = "CALENDARIO DE HORARIOS SEGUN TIENDA ELEGIDA"
        LBLCALENDARIO1.Text = "(El horario se maneja con numeros enteros y en un formato de 24 horas, pueden utilizar una D cuando se refiera a Descanso, No deben dejar el Campo Vacío)"
    End Sub

    Protected Sub EditCustomer(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        GVREP0.EditIndex = e.NewEditIndex
        BindData()
    End Sub
    Protected Sub CancelEdit(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        GVREP0.EditIndex = -1
        BindData()
    End Sub
    Protected Sub UpdateCustomer(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)
        Dim COD As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                     .FindControl("TXTCOD"), Label).Text
        Dim TDA As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                     .FindControl("TXTTDA1"), TextBox).Text
        Dim SMN As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                    .FindControl("TXTSMN1"), TextBox).Text
        Dim VDR As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                     .FindControl("TXTVDR1"), TextBox).Text
        Dim NOM As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTNOM1"), TextBox).Text
        Dim LE As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTLE1"), TextBox).Text
        Dim LS As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTLS1"), TextBox).Text
        Dim MARE As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTME1"), TextBox).Text
        Dim MARS As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTMS1"), TextBox).Text
        Dim MIE As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTMIE1"), TextBox).Text
        Dim MIS As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTMIS1"), TextBox).Text
        Dim JE As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTJE1"), TextBox).Text
        Dim JS As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTJS1"), TextBox).Text
        Dim VE As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTVE1"), TextBox).Text
        Dim VS As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTVS1"), TextBox).Text
        Dim SE As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTSE1"), TextBox).Text
        Dim SS As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTSS1"), TextBox).Text
        Dim DE As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTDE1"), TextBox).Text
        Dim DS As String = DirectCast(GVREP0.Rows(e.RowIndex) _
                                  .FindControl("TXTDS1"), TextBox).Text

        Dim s As String = ConfigurationManager.ConnectionStrings("EASYIDB").ConnectionString
        Dim nC = New SqlConnection(s)
        nC.Open()
        Dim cmd As New SqlCommand("update CALENDARIO_TDS set TIENDA=@TIENDA,SEMANA=@SMN," +
                                  "VENDEDOR=@VENDEDOR,NOMBRE=@NOMBRE,LUNES_ENTRADA=@LE," +
                                  "LUNES_SALIDA=@LS,MARTES_ENTRADA=@ME,MARTES_SALIDA=@MS," +
                                  "MIERCOLES_ENTRADA=@MIE,MIERCOLES_SALIDA=@MIS,JUEVES_ENTRADA=@JE," +
                                  "JUEVES_SALIDA=@JS,VIERNES_ENTRADA=@VE,VIERNES_SALIDA=@VS," +
                                  "SABADO_ENTRADA=@SE,SABADO_SALIDA=@SS,DOMINGO_ENTRADA=@DE," +
                                  "DOMINGO_SALIDA=@DS where CODIGO=@CODIGO", nC)
        cmd.Parameters.Add("@CODIGO", SqlDbType.Int).Value = COD
        cmd.Parameters.Add("@TIENDA", SqlDbType.Int).Value = TDA
        cmd.Parameters.Add("@SMN", SqlDbType.Int).Value = SMN
        cmd.Parameters.Add("@VENDEDOR", SqlDbType.Int).Value = VDR
        cmd.Parameters.Add("@NOMBRE", SqlDbType.NVarChar).Value = NOM
        cmd.Parameters.Add("@LE", SqlDbType.NVarChar).Value = LE
        cmd.Parameters.Add("@LS", SqlDbType.NVarChar).Value = LS
        cmd.Parameters.Add("@ME", SqlDbType.NVarChar).Value = MARE
        cmd.Parameters.Add("@MS", SqlDbType.NVarChar).Value = MARS
        cmd.Parameters.Add("@MIE", SqlDbType.NVarChar).Value = MIE
        cmd.Parameters.Add("@MIS", SqlDbType.NVarChar).Value = MIS
        cmd.Parameters.Add("@JE", SqlDbType.NVarChar).Value = JE
        cmd.Parameters.Add("@JS", SqlDbType.NVarChar).Value = JS
        cmd.Parameters.Add("@VE", SqlDbType.NVarChar).Value = VE
        cmd.Parameters.Add("@VS", SqlDbType.NVarChar).Value = VS
        cmd.Parameters.Add("@SE", SqlDbType.NVarChar).Value = SE
        cmd.Parameters.Add("@SS", SqlDbType.NVarChar).Value = SS
        cmd.Parameters.Add("@DE", SqlDbType.NVarChar).Value = DE
        cmd.Parameters.Add("@DS", SqlDbType.NVarChar).Value = DS
        GVREP0.EditIndex = -1
        cmd.ExecuteNonQuery()
        nC.Close()
        Aplicar(SMN)
        BindData()
        GridBind90(GVREP, "PRG_RPT_CALENDARIO 9,'" & TXTSUPER.SelectedItem.Value & "','" & TXTTIENDAS.SelectedItem.Value & "'", "", {""})

    End Sub

    Protected Sub DeleteCustomer(ByVal sender As Object, ByVal e As EventArgs)
        Dim lnkRemove As LinkButton = DirectCast(sender, LinkButton)
        Dim s As String = ConfigurationManager.ConnectionStrings("EASYIDB").ConnectionString
        Dim nC = New SqlConnection(s)
        nC.Open()
        Dim cmd As New SqlCommand("DELETE FROM CALENDARIO_TDS where CODIGO=@CODIGO", nC)
        cmd.Parameters.Add("@CODIGO", SqlDbType.VarChar).Value _
            = lnkRemove.CommandArgument
        cmd.ExecuteNonQuery()
        nC.Close()
        BindData()
        GridBind90(GVREP, "PRG_RPT_CALENDARIO 9,'" & TXTSUPER.SelectedItem.Value & "','" & TXTTIENDAS.SelectedItem.Value & "'", "", {""})
    End Sub

    'Protected Sub AddNewCustomer(ByVal sender As Object, ByVal e As EventArgs)
    '    'Dim COD As String = DirectCast(GVREP0.FooterRow _
    '    '                     .FindControl("TXTCOD"), TextBox).Text
    '    Dim TDA As String = DirectCast(GVREP0.FooterRow _
    '                                 .FindControl("TXTTDA1"), TextBox).Text
    '    Dim VDR As String = DirectCast(GVREP0.FooterRow _
    '                                 .FindControl("TXTVDR1"), TextBox).Text
    '    Dim NOM As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTNOM1"), TextBox).Text
    '    Dim LE As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTLE1"), TextBox).Text
    '    Dim LS As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTLS1"), TextBox).Text
    '    Dim LH As String = DirectCast(GVREP0.FooterRow _
    '                          .FindControl("TXTLH1"), TextBox).Text
    '    Dim MARE As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTME1"), TextBox).Text
    '    Dim MARS As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTMS1"), TextBox).Text
    '    Dim MARH As String = DirectCast(GVREP0.FooterRow _
    '                             .FindControl("TXTMH1"), TextBox).Text
    '    Dim MIE As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTMIE1"), TextBox).Text
    '    Dim MIS As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTMIS1"), TextBox).Text
    '    Dim MIH As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTMIH1"), TextBox).Text
    '    Dim JE As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTJE1"), TextBox).Text
    '    Dim JS As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTJS1"), TextBox).Text
    '    Dim JH As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTJH1"), TextBox).Text
    '    Dim VE As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTVE1"), TextBox).Text
    '    Dim VS As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTVS1"), TextBox).Text
    '    Dim VH As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTVH1"), TextBox).Text
    '    Dim SE As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTSE1"), TextBox).Text
    '    Dim SS As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTSS1"), TextBox).Text
    '    Dim SH As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTSH1"), TextBox).Text
    '    Dim DE As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTDE1"), TextBox).Text
    '    Dim DS As String = DirectCast(GVREP0.FooterRow _
    '                              .FindControl("TXTDS1"), TextBox).Text
    '    Dim DH As String = DirectCast(GVREP0.FooterRow _
    '                             .FindControl("TXTDH1"), TextBox).Text
    '    Dim s As String = ConfigurationManager.ConnectionStrings("EASYIDB").ConnectionString
    '    Dim nC = New SqlConnection(s)
    '    nC.Open()
    '    Dim cmd As New SqlCommand("insert into CALENDARIO_TDS(TIENDA, VENDEDOR, NOMBRE, " & _
    '         "LUNES_ENTRADA, LUNES_SALIDA,LUNES_HORAS, MARTES_ENTRADA, MARTES_SALIDA, MARTES_HORAS, " & _
    '         "MIERCOLES_ENTRADA, MIERCOLES_SALIDA, MIERCOLES_HORAS,JUEVES_ENTRADA, JUEVES_SALIDA, " & _
    '         "JUEVES_HORAS, VIERNES_ENTRADA, VIERNES_SALIDA, VIERNES_HORAS, SABADO_ENTRADA, " & _
    '         "SABADO_SALIDA,SABADO_HORAS, DOMINGO_ENTRADA, DOMINGO_SALIDA, DOMINGO_HORAS)" & _
    '         "values(@TIENDA, @VENDEDOR, @NOMBRE, @LE, @LS, @LH, @ME, @MS,@MH, @MIE, @MIS, @MIH," & _
    '         "@JE, @JS, @JH,@VE, @VS, @VH, @SE, @SS, @SH, @DE, @DS, @DH)", nC)
    '    'cmd.Parameters.Add("@CODIGO", SqlDbType.Int).Value = COD
    '    cmd.Parameters.Add("@TIENDA", SqlDbType.Int).Value = TDA
    '    cmd.Parameters.Add("@SMN", SqlDbType.Int).Value = SMN
    '    cmd.Parameters.Add("@VENDEDOR", SqlDbType.Int).Value = VDR
    '    cmd.Parameters.Add("@NOMBRE", SqlDbType.NVarChar).Value = NOM
    '    cmd.Parameters.Add("@LE", SqlDbType.NVarChar).Value = LE
    '    cmd.Parameters.Add("@LS", SqlDbType.NVarChar).Value = LS
    '    cmd.Parameters.Add("@LH", SqlDbType.Int).Value = LH
    '    cmd.Parameters.Add("@ME", SqlDbType.NVarChar).Value = MARE
    '    cmd.Parameters.Add("@MS", SqlDbType.NVarChar).Value = MARS
    '    cmd.Parameters.Add("@MH", SqlDbType.Int).Value = MARH
    '    cmd.Parameters.Add("@MIE", SqlDbType.NVarChar).Value = MIE
    '    cmd.Parameters.Add("@MIS", SqlDbType.NVarChar).Value = MIS
    '    cmd.Parameters.Add("@MIH", SqlDbType.Int).Value = MIH
    '    cmd.Parameters.Add("@JE", SqlDbType.NVarChar).Value = JE
    '    cmd.Parameters.Add("@JS", SqlDbType.NVarChar).Value = JS
    '    cmd.Parameters.Add("@JH", SqlDbType.Int).Value = JH
    '    cmd.Parameters.Add("@VE", SqlDbType.NVarChar).Value = VE
    '    cmd.Parameters.Add("@VS", SqlDbType.NVarChar).Value = VS
    '    cmd.Parameters.Add("@VH", SqlDbType.Int).Value = VH
    '    cmd.Parameters.Add("@SE", SqlDbType.NVarChar).Value = SE
    '    cmd.Parameters.Add("@SS", SqlDbType.NVarChar).Value = SS
    '    cmd.Parameters.Add("@SH", SqlDbType.Int).Value = SH
    '    cmd.Parameters.Add("@DE", SqlDbType.NVarChar).Value = DE
    '    cmd.Parameters.Add("@DS", SqlDbType.NVarChar).Value = DS
    '    cmd.Parameters.Add("@DH", SqlDbType.Int).Value = DH
    '    cmd.ExecuteNonQuery()
    '    Dim Da As New SqlDataAdapter(cmd)
    '    nD = New DataSet
    '    Da.Fill(nD, "nA")
    '    GVREP0.DataSource = nD
    '    GVREP0.DataBind()
    ' nC.Close()
    'End Sub

    Public Sub BindData()
        Dim s As String
        nD = Nothing
        nD = New DataSet
        s = ConfigurationManager.ConnectionStrings("EASYIDB").ConnectionString
        Dim nC = New SqlConnection(s)
        nC.Open()
        Dim cmd As New SqlCommand("SELECT CODIGO,TIENDA,SEMANA,VENDEDOR,NOMBRE,SUPERVISOR, DOMINGO_ENTRADA, DOMINGO_SALIDA, DOMINGO_HORAS,LUNES_ENTRADA,LUNES_SALIDA ,LUNES_HORAS," & _
            "MARTES_ENTRADA, MARTES_SALIDA, MARTES_HORAS, MIERCOLES_ENTRADA, MIERCOLES_SALIDA, MIERCOLES_HORAS," & _
            "JUEVES_ENTRADA, JUEVES_SALIDA, JUEVES_HORAS, VIERNES_ENTRADA, VIERNES_SALIDA, VIERNES_HORAS," & _
            "SABADO_ENTRADA, SABADO_SALIDA, SABADO_HORAS," & _
            "HORAS_SEMANA, HORAS_LEY, HORAS_ALMUERZO, HORAS_EXTRAS" & _
            " FROM CALENDARIO_TDS WHERE SUPERVISOR='" & TXTSUPER.Text & "' AND TIENDA='" & TXTTIENDAS.Text & "' AND SEMANA IN (Select DATEPART(WEEK,FECHA)SEMANA from ( " & _
            "select (dateadd(dd, value, dateadd(month, month(GETDATE()) - 2, dateadd(year, YEAR(getdate()) - 1900," & _
            "'1900.01.01')))) as FECHA from(" & _
            "select (v2 * 4 + v1) * 4 + v0 as value from" & _
            "(select 0 as v0 union select 1 union select 2 union select 3) as rs0 cross join " & _
            "(select 0 as v1 union select 1 union select 2 union select 3) as rs1 cross join " & _
            "(select 0 as v2 union select 1 union select 2 union select 3) as rs2 " & _
            ") as rs " & _
             ") as rs2 " & _
             "where  month(FECHA) = MONTH(GETDATE())-1 " & _
             "GROUP BY DATEPART(WEEK,FECHA)) ORDER BY SEMANA", nC)
        cmd.ExecuteNonQuery()
        Dim Da As New SqlDataAdapter(cmd)
        Da.Fill(nD, "nA")
        GVREP0.DataSource = nD
        GVREP0.DataBind()
        nC.Close()
    End Sub

    Public Sub Aplicar(TX As String)
        LBLERR9.Text = ""
        AbrirRecordsetData("PRG_RPT_CALENDARIO 10,'" & TXTSUPER.SelectedItem.Value & "','" & TXTSEMANA.SelectedItem.Value & "','" & TXTTIENDAS.SelectedItem.Value & "'")
        If nA(0) = 0 Then
            'GridBind90(GVHORAS, "EXEC PRG_RPT_CALENDARIO 5,'" & TXTSUPER.SelectedItem.Value & "','" & TXTSEMANA.SelectedItem.Value & "','" & TXTTIENDAS.SelectedItem.Value & "'", "", {""})
            LBLERR9.Text = nA(1)
            LBLERR8.Text = ""
            AbrirRecordsetData("PRG_RPT_CALENDARIO 13,'" & TX.ToString & "','" & TXTSUPER.SelectedItem.Value & "','" & TXTTIENDAS.SelectedItem.Value & "'")
            If nA(0) = 0 Then
                LBLERR8.Text = nA(1)
                Exit Sub
            End If
            Exit Sub
        End If
    End Sub

    Protected Sub BTNEXPORT_Click(sender As Object, e As ImageClickEventArgs) Handles BTNEXPORT.Click
        If GVREP0.Rows.Count > 0 Then
            ExportToExcel(Replace(Replace(LBLCALENDARIO.Text, " ", "_", 1), "/", "_", 1) & ".xls", GVREP0, GVREP)
        End If
    End Sub

    Private Sub ExportToExcel(ByVal strFileName As String, ByVal dg As GridView, ByVal dg1 As GridView)
        dg.AllowPaging = False
        dg.Columns(0).Visible = False
        dg.Columns(1).Visible = False
        dg.Columns(2).Visible = False
        Response.Clear()
        Response.Buffer = True

        Response.AddHeader("content-disposition", _
               "attachment;filename=" & strFileName)
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Dim sw As New StringWriter()
        Dim hw As New HtmlTextWriter(sw)

        Dim tb As New Table()
        Dim tr1 As New TableRow()
        Dim cell1 As New TableCell()
        cell1.Controls.Add(dg)
        tr1.Cells.Add(cell1)
        Dim cell3 As New TableCell()
        cell3.Controls.Add(dg1)
        Dim cell2 As New TableCell()
        cell2.Text = "&nbsp;"
        tr1.Cells.Add(cell2)
        tr1.Cells.Add(cell3)
        tb.Rows.Add(tr1)
        'Dim tr2 As New TableRow()
        'tr2.Cells.Add(cell2)
        'Dim tr3 As New TableRow()
        'tr3.Cells.Add(cell3)
        'tb.Rows.Add(tr1)
        'tb.Rows.Add(tr2)
        'tb.Rows.Add(tr3)
        tb.RenderControl(hw)
        Dim style As String = "<style> .textmode { mso-number-format:\@; } </style>"
        Response.Write(style)
        Response.Output.Write(sw.ToString())
        Response.Flush()
        Response.End()
        'Response.Clear()
        'Response.AddHeader("content-disposition", "attachment;filename=" & strFileName)
        'Response.Charset = ""
        'Response.ContentType = "application/vnd.ms-excel"
        'Dim oStringWriter As New System.IO.StringWriter
        'Dim oHtmlTextWriter As New System.Web.UI.HtmlTextWriter(oStringWriter)
        'dg.RenderControl(oHtmlTextWriter)
        'Response.Write(oStringWriter.ToString())
        'Response.End()
    End Sub

    Private Sub GVREP0_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GVREP0.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim descanso As String = DataBinder.Eval(e.Row.DataItem, "LUNES_ENTRADA")
            If descanso = "D" Or descanso = "Descanso" Or descanso = "d" Or descanso = "X" Or descanso = "x" Then
                e.Row.Cells(11).BackColor = Color.Pink
                e.Row.Cells(11).ForeColor = Color.Black
                e.Row.Cells(11).Font.Bold = True
            End If
            Dim descanso1 As String = DataBinder.Eval(e.Row.DataItem, "LUNES_SALIDA")
            If descanso1 = "D" Or descanso1 = "Descanso" Or descanso1 = "d" Or descanso = "X" Or descanso = "x" Then
                e.Row.Cells(12).BackColor = Color.Pink
                e.Row.Cells(12).ForeColor = Color.Black
                e.Row.Cells(12).Font.Bold = True
            End If
            Dim descanso2 As String = DataBinder.Eval(e.Row.DataItem, "MARTES_ENTRADA")
            If descanso2 = "D" Or descanso2 = "Descanso" Or descanso2 = "d" Or descanso = "X" Or descanso = "x" Then
                e.Row.Cells(14).BackColor = Color.Pink
                e.Row.Cells(14).ForeColor = Color.Black
                e.Row.Cells(14).Font.Bold = True
            End If
            Dim descanso3 As String = DataBinder.Eval(e.Row.DataItem, "MARTES_SALIDA")
            If descanso3 = "D" Or descanso3 = "Descanso" Or descanso3 = "d" Or descanso = "X" Or descanso = "x" Then
                e.Row.Cells(15).BackColor = Color.Pink
                e.Row.Cells(15).ForeColor = Color.Black
                e.Row.Cells(15).Font.Bold = True
            End If
            Dim descanso4 As String = DataBinder.Eval(e.Row.DataItem, "MIERCOLES_ENTRADA")
            If descanso4 = "D" Or descanso4 = "Descanso" Or descanso4 = "d" Or descanso = "X" Or descanso = "x" Then
                e.Row.Cells(17).BackColor = Color.Pink
                e.Row.Cells(17).ForeColor = Color.Black
                e.Row.Cells(17).Font.Bold = True
            End If
            Dim descanso5 As String = DataBinder.Eval(e.Row.DataItem, "MIERCOLES_SALIDA")
            If descanso5 = "D" Or descanso5 = "Descanso" Or descanso5 = "d" Or descanso = "X" Or descanso = "x" Then
                e.Row.Cells(18).BackColor = Color.Pink
                e.Row.Cells(18).ForeColor = Color.Black
                e.Row.Cells(18).Font.Bold = True
            End If
            Dim descanso6 As String = DataBinder.Eval(e.Row.DataItem, "JUEVES_ENTRADA")
            If descanso6 = "D" Or descanso6 = "Descanso" Or descanso6 = "d" Or descanso = "X" Or descanso = "x" Then
                e.Row.Cells(20).BackColor = Color.Pink
                e.Row.Cells(20).ForeColor = Color.Black
                e.Row.Cells(20).Font.Bold = True
            End If
            Dim descanso7 As String = DataBinder.Eval(e.Row.DataItem, "JUEVES_SALIDA")
            If descanso7 = "D" Or descanso7 = "Descanso" Or descanso7 = "d" Or descanso = "X" Or descanso = "x" Then
                e.Row.Cells(21).BackColor = Color.Pink
                e.Row.Cells(21).ForeColor = Color.Black
                e.Row.Cells(21).Font.Bold = True
            End If
            Dim descanso8 As String = DataBinder.Eval(e.Row.DataItem, "VIERNES_ENTRADA")
            If descanso8 = "D" Or descanso8 = "Descanso" Or descanso8 = "d" Or descanso = "X" Or descanso = "x" Then
                e.Row.Cells(23).BackColor = Color.Pink
                e.Row.Cells(23).ForeColor = Color.Black
                e.Row.Cells(23).Font.Bold = True
            End If
            Dim descanso9 As String = DataBinder.Eval(e.Row.DataItem, "VIERNES_SALIDA")
            If descanso9 = "D" Or descanso9 = "Descanso" Or descanso9 = "d" Or descanso = "X" Or descanso = "x" Then
                e.Row.Cells(24).BackColor = Color.Pink
                e.Row.Cells(24).ForeColor = Color.Black
                e.Row.Cells(24).Font.Bold = True
            End If
            Dim descanso10 As String = DataBinder.Eval(e.Row.DataItem, "SABADO_ENTRADA")
            If descanso10 = "D" Or descanso10 = "Descanso" Or descanso10 = "d" Or descanso = "X" Or descanso = "x" Then
                e.Row.Cells(26).BackColor = Color.Pink
                e.Row.Cells(26).ForeColor = Color.Black
                e.Row.Cells(26).Font.Bold = True
            End If
            Dim descanso11 As String = DataBinder.Eval(e.Row.DataItem, "SABADO_SALIDA")
            If descanso11 = "D" Or descanso11 = "Descanso" Or descanso11 = "d" Or descanso = "X" Or descanso = "x" Then
                e.Row.Cells(27).BackColor = Color.Pink
                e.Row.Cells(27).ForeColor = Color.Black
                e.Row.Cells(27).Font.Bold = True
            End If
            Dim descanso12 As String = DataBinder.Eval(e.Row.DataItem, "DOMINGO_ENTRADA")
            If descanso12 = "D" Or descanso12 = "Descanso" Or descanso12 = "d" Or descanso = "X" Or descanso = "x" Then
                e.Row.Cells(8).BackColor = Color.Pink
                e.Row.Cells(8).ForeColor = Color.Black
                e.Row.Cells(8).Font.Bold = True
            End If
            Dim descanso13 As String = DataBinder.Eval(e.Row.DataItem, "DOMINGO_SALIDA")
            If descanso13 = "D" Or descanso13 = "Descanso" Or descanso13 = "d" Or descanso = "X" Or descanso = "x" Then
                e.Row.Cells(9).BackColor = Color.Pink
                e.Row.Cells(9).ForeColor = Color.Black
                e.Row.Cells(9).Font.Bold = True
            End If
        End If
    End Sub
End Class