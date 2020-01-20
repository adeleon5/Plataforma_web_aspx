Imports System.IO
Imports System.Drawing
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
            P_DOCTOENCA.Visible = True
            GridBind(GVREP, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO]  102, '" & DDLEMPRESA.SelectedValue.ToString() & "','" & DDLTIENDA.SelectedValue.ToString & "','" & CDate(TXTFECHADOCTO.Text).ToString("yyyyMMdd") & "'", "", {"IdEmpresa", "IdSucursal", "NombreSucursal"})
            GridBind(GVDOCTOENCA, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO] 103,'" & DDLEMPRESA.SelectedValue.ToString() & "','" & DDLTIENDA.SelectedValue.ToString & "','" & CDate(TXTFECHADOCTO.Text).ToString("yyyyMMdd") & "'", "", {"IdEmpresa", "IdSucursal", "NombreSucursal"})
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
        'PaginaNueva("http://190.106.203.34:9098/api/download?id=" & GVREP.SelectedRow.Cells(0).Text)
        Dim DSLocal As DataSet
        DSLocal = ObtieneRS("EXEC DB_WEB..PRG_APP_GESTION_ARCHIVO 7,'" & GVREP.SelectedRow.Cells(0).Text & "'")
        For Each fila As DataRow In DSLocal.Tables(0).Rows()
            ImgDocto = fila(1).ToString()
        Next
        IMGDOCTO_.ImageUrl = Convert.ToString("data:image/jpg;base64,") & ImgDocto
    End Sub

    Function GetImgDocto() As String
        Dim img As String = """" + "<img src=\'\data:image/jpg;base64, " + CStr(IMGDOCTO) + "\'\ onerror=\'\alert(1)\'\>" + """"
        Return img
    End Function

    Private Sub btnpanelopciones_Click(sender As Object, e As EventArgs) Handles btnpanelopciones.Click
        id01.Visible = True
        btnpanelopciones.Visible = False
    End Sub

    Private Sub SP01_Click(sender As Object, e As EventArgs) Handles SP01.Click
        id01.Visible = False
        btnpanelopciones.Visible = True
    End Sub
End Class