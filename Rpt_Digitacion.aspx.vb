Public Class Rpt_Digitacion
    Inherits base

    Private Sub Rpt_Digitacion_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        DdBind(DDLEMPRESA, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO]  100", "ID", "EMPRESA")
        DdBind(DDLREPORTE, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO]  105", "ID", "RESULTADO")
    End Sub

    Private Sub DDLEMPRESA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDLEMPRESA.SelectedIndexChanged
        DdBind(DDLTIENDA, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO]  101" + ",'" + DDLEMPRESA.SelectedValue.ToString + "'", "ID", "TIENDA")
    End Sub

    Private Sub BTNGO_Click(sender As Object, e As EventArgs) Handles BTNGO.Click
        If DDLREPORTE.SelectedValue.ToString = "0" Then
            mensaje("DEBE ELIGIR UN REPORTE VALIDO")
            Exit Sub
        End If
        If DDLREPORTE.SelectedValue.ToString = "1" Then
            P_DOCTOENCA.Visible = False
            P_DOCTODETA.Visible = False
            P_IMAGENES.Visible = True
            GridBind(GVREP, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO]  102, '" & DDLEMPRESA.SelectedValue.ToString() & "','" & DDLTIENDA.SelectedValue.ToString & "','" & CDate(TXTFECHADOCTO.Text).ToString("yyyyMMdd") & "'", "", {"IdEmpresa", "IdSucursal", "NombreSucursal"})
        Else
            P_IMAGENES.Visible = False
            P_DOCTOENCA.Visible = True
            GridBind(GVDOCTOENCA, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO] " & DDLREPORTE.SelectedValue.ToString & ",'" & DDLEMPRESA.SelectedValue.ToString() & "','" & DDLTIENDA.SelectedValue.ToString & "','" & CDate(TXTFECHADOCTO.Text).ToString("yyyyMMdd") & "'", "", {"IdEmpresa", "IdSucursal", "NombreSucursal"})
        End If
    End Sub

    Private Sub GVDOCTOENCA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVDOCTOENCA.SelectedIndexChanged
        If DDLREPORTE.SelectedValue.ToString = "103" Then
            GridBind(GVDOCTODETA, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO] 104, '" & DDLEMPRESA.SelectedValue.ToString() & "','" & DDLTIENDA.SelectedValue.ToString & "','" & CDate(TXTFECHADOCTO.Text).ToString("yyyyMMdd") & "','" & GVDOCTOENCA.SelectedRow.Cells(3).Text & "'", "", {"IdEmpresa", "IdSucursal", "NombreSucursal"})
        End If
        If DDLREPORTE.SelectedValue.ToString = "106" Then
            GridBind(GVDOCTODETA, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO] 107, '" & DDLEMPRESA.SelectedValue.ToString() & "','" & DDLTIENDA.SelectedValue.ToString & "','" & CDate(TXTFECHADOCTO.Text).ToString("yyyyMMdd") & "','" & GVDOCTOENCA.SelectedRow.Cells(3).Text & "'", "", {"IdEmpresa", "IdSucursal", "NombreSucursal"})
        End If
        If GVDOCTODETA.Rows.Count > 0 Then
            P_DOCTODETA.Visible = True
        Else
            mensaje("NO HAY RESULTADOS PARA MOSTRAR")
            Exit Sub
        End If

    End Sub

    Protected Sub BTNEXPORT_Click(sender As Object, e As ImageClickEventArgs) Handles BTNEXPORT.Click
        'If GVREP.Rows.Count > 0 Then
        '    ExportToExcel(Replace(Replace(TXTPREP.SelectedItem.Text, " ", "_", 1), "/", "_", 1) & ".xls", GVREP)
        'End If
    End Sub

    Private Sub ExportToExcel(ByVal strFileName As String, ByVal dg As GridView)
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

    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        'MyBase.VerifyRenderingInServerForm(control)
    End Sub

    Public Sub mensaje(ByRef mensaje As String)
        Dim script As String = "alert('" + mensaje + "');"
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, True)
    End Sub

    Public Sub PaginaNueva(ByRef mensaje As String)
        Dim script As String = "window.open('" + mensaje + "');"
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, True)
    End Sub

    Private Sub GVREP_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVREP.SelectedIndexChanged
        PaginaNueva("http://190.106.203.34:9098/api/download?id=" & GVREP.SelectedRow.Cells(0).Text)
    End Sub

End Class