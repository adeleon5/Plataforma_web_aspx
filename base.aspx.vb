Imports System.IO
Imports System.Text
Imports System.Data
Imports System.Data.SqlClient

Partial Public Class base
    Inherits System.Web.UI.Page


    Protected Overridable Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Session("UCO") Is Nothing Then
                Notifica("Por su seguridad, la sesión há expirado. Reinicie sesión", "Login_new.aspx")
            End If
            AbrirRecordsetData("EXEC SEGURIDAD 5001,'" & Session("UCO") & "','" & Request.Url.Segments(Request.Url.Segments.Length - 1) & "'")
            If nA(0) = 0 Then
                Notifica("No tiene permiso de acceder a esta opción", "Inicio.aspx")
            End If
        Catch
            Notifica("Por su seguridad, la sesión há expirado. Reinicie sesión", "Login_new.aspx")
        End Try

    End Sub

    Sub GVSelect(ByRef Grida As System.Web.UI.WebControls.GridView)
        For Each row As GridViewRow In Grida.Rows
            If row.RowType = DataControlRowType.DataRow Then
                row.Attributes.Add("OnMouseOver", "this.style.cursor='pointer';this.style.textDecoration='underline';")
                row.Attributes.Add("onmouseout", "this.style.textDecoration='none';")
                row.Attributes.Add("onclick", ClientScript.GetPostBackClientHyperlink(Grida, "Select$" & row.DataItemIndex, True))
            End If
        Next
    End Sub

    Public Sub GridBind(ByRef GR As GridView, ByVal Sql As String, ByVal COL As String, ByVal ParamArray Esconder() As String)
        GR.Columns.Clear()
        Dim nC = New SqlConnection(ConfigurationManager.ConnectionStrings("EASYIDB").ConnectionString)
        Dim nI As Integer
        nD = Nothing
        nD = New DataSet
        Dim Da As New SqlDataAdapter(Sql, nC)
        Da.Fill(nD, "nA")
        For nI = 0 To nD.Tables("nA").Columns.Count - 1
            Dim nCol As New BoundField
            nCol.DataField = nD.Tables("nA").Columns(nI).ColumnName
            nCol.HeaderText = nD.Tables("nA").Columns(nI).ColumnName
            For Each nS In Esconder
                If nCol.HeaderText = nS Then
                    nCol.HeaderStyle.CssClass = "hiddencol"
                    nCol.ItemStyle.CssClass = "hiddencol"
                End If
            Next
            GR.Columns.Add(nCol)
        Next
        If COL <> "" Then
            GridAddRow(GR, COL)
        End If
        GR.DataSource = nD
        GR.DataBind()
        nC = Nothing
        Da = Nothing
        nD = Nothing
    End Sub

    Public Sub GBLocal(ByRef GR As GridView, ByVal Sql As String, ByVal COL As String, ByVal ParamArray Esconder() As String)
        GR.Columns.Clear()
        Dim nC = New SqlConnection(ConfigurationManager.ConnectionStrings("WEBDB").ConnectionString)
        Dim nI As Integer
        nD = Nothing
        nD = New DataSet
        Dim Da As New SqlDataAdapter(Sql, nC)
        Da.Fill(nD, "nA")
        For nI = 0 To nD.Tables("nA").Columns.Count - 1
            Dim nCol As New BoundField
            nCol.DataField = nD.Tables("nA").Columns(nI).ColumnName
            nCol.HeaderText = nD.Tables("nA").Columns(nI).ColumnName
            For Each nS In Esconder
                If nCol.HeaderText = nS Then
                    nCol.HeaderStyle.CssClass = "hideGridColumn"
                    nCol.ItemStyle.CssClass = "hideGridColumn"
                End If
            Next
            GR.Columns.Add(nCol)
        Next
        If COL <> "" Then
            GridAddRow(GR, COL)
        End If
        GR.DataSource = nD
        GR.DataBind()
        nC = Nothing
        Da = Nothing
        nD = Nothing
    End Sub

    Public Shared Sub GridAddRow(ByRef GR As GridView, ByRef Tipo As String)
        If Not ((Tipo = "SELECT") Or (Tipo = "DELETE") Or (Tipo = "UPDATE")) Then
            Exit Sub
        End If
        Dim nC As New CommandField
        nC.ButtonType = ButtonType.Image
        nC.ShowSelectButton = True
        nC.ItemStyle.Width = 35
        If (Tipo = "SELECT") Then
            nC.SelectImageUrl = "~/Images/VIEW.gif"
        ElseIf (Tipo = "DELETE") Then
            nC.SelectImageUrl = "~/Images/DEL.gif"
        ElseIf (Tipo = "UPDATE") Then
            nC.SelectImageUrl = "~/Images/EDIT.gif"
        End If
        GR.Columns.Add(nC)
    End Sub


    Public Shared Function FindControlRecursive(ByVal List As List(Of Control), ByVal parent As Control, ctrlType As System.Type) As List(Of Control)
        If parent Is Nothing Then Return List
        If parent.GetType Is ctrlType Then
            List.Add(parent)
        End If
        For Each child As Control In parent.Controls
            FindControlRecursive(List, child, ctrlType)
        Next
        Return List
    End Function

    Protected Overrides Sub Render(writer As HtmlTextWriter)
        Dim Lista As New List(Of Control)
        For Each GV In FindControlRecursive(Lista, Me, GetType(GridView))
            ''MsgBox(GV.ClientID.ToString())
            If GV.ClientID.ToString() <> "Contenido_GVCONSUMOPARTES" And GV.ClientID.ToString() <> "Contenido_GVEMPRESAS" Then
                GVSelect(GV)
            End If

        Next
        MyBase.Render(writer)
    End Sub

    Public Function COLINDEX(ByRef GR As GridView, ByVal Columna As String) As Integer
        For nI As Integer = 0 To GR.Columns.Count - 1
            If GR.HeaderRow.Cells(nI).Text = Columna Then
                Return nI
            End If
        Next
        Return -1
    End Function
End Class