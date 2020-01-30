Public Class Empleados
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        DdBind(DDLAREA, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO]  1000", "ID", "AREA")
    End Sub

    Private Sub GVEMPLEADO_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GVEMPLEADO.RowDataBound
        'Dim ddl As DropDownList = e.Row.FindControl("DDLTIPOEMPLEADO")
        'DdBind(ddl, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO]  1000", "ID", "AREA")
    End Sub
End Class